//
//  MovieDetail.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 17/09/24.
//

import Foundation

struct Genre: Codable {
    var id: Int
    var name: String
}

struct MovieDetail: Codable {
    var runtime: Int?
    var genres: [Genre]
}
