//
//  MovieDetailViewModel.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 24/09/24.
//

import Foundation

struct MovieDetailDataSource {
    let apiClient: APIClient
    let movie: Movie
}

class MovieDetailViewModel {
    private(set) var state: Bindable<FetchingServiceState> = Bindable(.loading)
    private(set) var runtime: Bindable<Int> = Bindable(0)
    private(set) var genres: Bindable<[Genre]> = Bindable([])

    private let apiClient: APIClient
    private let router: MovieDetailRouter

    let movie: Movie
    
    init(dataSource: MovieDetailDataSource, router: MovieDetailRouter) {
        self.apiClient = dataSource.apiClient
        self.movie = dataSource.movie
        self.router = router
    }
    
    func fetchMovieDetail() {
        state.value = .loading
        apiClient.getMovieDetail(service: MovieDetailServiceProvider(parameters: NetworkConstants.defaultRequestParams, movieId: movie.id), completion: { [weak self] response in
            self?.state.value = .finishedLoading
            switch response {
            case .success(let result):
                self?.runtime.value = result.runtime ?? 0
                self?.genres.value.append(contentsOf: result.genres)
            case .failure(let error):
                self?.state.value = .error(error)
            }
        })
    }
    
    func handleCloseButtonTapped() {
        router.routeBack()
    }
    
    func presentNetworkError(error: NetworkError?) {
        let alert = AlertHelper.buildNetworkErrorAlert(error: error)
        router.routeToAlert(alert: alert)
    }
}
