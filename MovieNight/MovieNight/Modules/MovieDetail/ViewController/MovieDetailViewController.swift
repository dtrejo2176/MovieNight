//
//  MovieDetailViewController.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 24/09/24.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var genreView: UIView!

    private var viewModel: MovieDetailViewModel

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

private extension MovieDetailViewController {
    func configureView() {
        titleLabel.text = viewModel.movie.title
        releaseDateLabel.text = MovieHelper.formatReleaseDate(releaseDate: viewModel.movie.releaseDate)
        overviewLabel.text = viewModel.movie.overview
        let placeholderImage = UIImage(named: "placeholder")
        if let moviePoster = viewModel.movie.posterUrl() {
            posterImage.kf.setImage(with: moviePoster, placeholder: placeholderImage)
        } else {
            posterImage.image = placeholderImage
        }
        posterImage.layer.borderWidth = 2
        posterImage.layer.borderColor = UIColor(named: "AppDarkGray")?.cgColor
        posterImage.layer.masksToBounds = true
    }
    
    func updateMovieDetail() {
        let releaseDate = MovieHelper.formatReleaseDate(releaseDate: viewModel.movie.releaseDate)
        let runtime = MovieHelper.formatRuntime(runtime: viewModel.runtime.value)
        releaseDateLabel.text = "\(releaseDate) - \(runtime)"
    }
    
    func updateGenreList() {
        genreView.subviews.forEach({ $0.removeFromSuperview() })
        let buttonWidth: CGFloat = 70.0
        let buttonSpace: CGFloat = 80.0
        var xOrigin: CGFloat = 0
        var genreButton: UIButton
        
        for genre in viewModel.genres.value {
            genreButton = UIButton(frame: CGRect(x: xOrigin, y: 0, width: buttonWidth, height: genreView.frame.height))
            genreButton.setTitle(genre.name, for: .normal)
            genreButton.titleLabel?.adjustsFontSizeToFitWidth = true
            genreButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
            genreButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
            genreButton.backgroundColor = UIColor.white
            genreView.addSubview(genreButton)
            xOrigin += buttonSpace
        }
    }
    
    func bindViewModel() {
        viewModel.runtime.bind({ [weak self] _ in
            DispatchQueue.main.async {
                self?.updateMovieDetail()
            }
        })
        viewModel.genres.bind({ [weak self] _ in
            DispatchQueue.main.async {
                self?.updateGenreList()
            }
        })
        viewModel.state.bind { [weak self] state in
            switch state {
            case .error(let error):
                DispatchQueue.main.async {
                    self?.viewModel.presentNetworkError(error: error)
                }
            case .loading, .finishedLoading:
                break
            }
        }
    }
}
