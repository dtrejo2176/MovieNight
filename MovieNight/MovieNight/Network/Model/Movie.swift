//
//  Movie.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 17/09/24.
//

import Foundation

struct Movie: Codable {

    var id: Int
    var title: String?
    var overview: String?
    var releaseDate: String?
    var poster: String?
    private var voteAverage: Decimal
    var rating: Int {
        get { return Int(truncating: NSDecimalNumber(decimal: voteAverage * 10)) }
    }

    init(id: Int, title: String, overview: String, releaseDate: String, poster: String, voteAverage: Decimal) {
        self.id = id
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.poster = poster
        self.voteAverage = voteAverage
    }

    func posterUrl() -> URL? {
        return URL(string: "\(NetworkConstants.imagesBaseURL)\(poster ?? "")")
    }

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case poster = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
