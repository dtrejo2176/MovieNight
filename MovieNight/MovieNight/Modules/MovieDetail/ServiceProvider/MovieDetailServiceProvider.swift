//
//  MovieDetailServiceProvider.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 24/09/24.
//

//Note: This is similar to Endpoint in a different implementation

import Foundation

class MovieDetailServiceProvider: Service {
    var parameters: [String: String]?
    var movieId: Int

    init(parameters: [String: String]?, movieId: Int) {
        self.parameters = parameters
        self.parameters?.append(dict: NetworkConstants.defaultRequestParams)
        self.movieId = movieId
    }

    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }

    var path: String {
        return "\(NetworkConstants.movieDetailServicePath)\(movieId)"
    }

    var method: HTTPMethod {
        return .get
    }

    var task: Task {
        return .requestParameters(self.parameters ?? [:])
    }

    var headers: RequestHeaders? {
        return NetworkConstants.defaultRequestHeaders
    }

    var parametersEncoding: ParametersEncoding {
        return .url
    }

}

