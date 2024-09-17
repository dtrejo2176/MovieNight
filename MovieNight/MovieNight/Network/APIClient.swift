//
//  APIClient.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 17/09/24.
//

import Foundation

class APIClient {
    private var session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared as URLSessionProtocol) {
        self.session = session
    }
    
    private func request<T>(type: T.Type, service: Service, completion: @escaping (APIResponse<T>) -> ()) where T: Decodable {
        let request = URLRequest(service: service)
        let task = session.dataTask(request: request, completionHandler: {[weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        task.resume()
    }

    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (APIResponse<T>) -> ()) {
        guard error == nil else { return completion(.failure(.unknown)) }
        guard let response = response, let data = data else { return completion(.failure(.noJSONData)) }
        switch response.statusCode {
        case 200...299:
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch (_) {
                completion(.failure(.JSONDecoder))
            }
        case 401:
            completion(.failure(.unauthorized))
        default:
            completion(.failure(.unknown))
        }
    }
    
    //MARK:- Services
    func getNowPlayingMovies(service: Service, completion: @escaping (APIResponse<Response>) -> ()) {
        self.request(type: Response.self, service: service, completion: completion)
    }
    
    func getMostPopularMovies(service: Service, completion: @escaping (APIResponse<Response>) -> ()) {
        self.request(type: Response.self, service: service, completion: completion)
    }
    
    func getMovieDetail(service: Service, completion: @escaping (APIResponse<MovieDetail>) -> ()) {
        self.request(type: MovieDetail.self, service: service, completion: completion)
    }
}

