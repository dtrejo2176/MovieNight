//
//  NetworkConstants.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 17/09/24.
//

struct NetworkConstants {
    static let defaultRequestParams = ["api_key": "55957fcf3ba81b137f8fc01ac5a31fb5"]
    static let defaultRequestHeaders = ["Content-type": "application/json; charset=utf-8"]
    static let baseURL = "https://api.themoviedb.org/3"
    static let nowPlayingServicePath = "/movie/now_playing"
    static let mostPopularServicePath = "/movie/popular"
    static let movieDetailServicePath = "/movie/"
    static let imagesBaseURL = "https://image.tmdb.org/t/p/w500/"
    static let pageParameterKey = "page"
}
