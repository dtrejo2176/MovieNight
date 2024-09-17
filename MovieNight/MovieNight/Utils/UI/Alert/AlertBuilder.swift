//
//  AlertBuilder.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 17/09/24.
//

import Foundation

enum AlertHelper {
    static func buildNetworkErrorAlert(error: NetworkError?) -> SingleButtonAlert {
        var alert: SingleButtonAlert
        if let error = error {
            switch error {
            case .unauthorized:
                alert = SingleButtonAlert(title: "API Error", message: "Your API Key might be wrong", action: AlertAction(buttonTitle: "OK", handler: {}))
            case .unknown:
                alert = SingleButtonAlert(title: "Unknown Error", message: "please try again later.", action: AlertAction(buttonTitle: "OK", handler: {}))
            case .noJSONData:
                alert = SingleButtonAlert(title: "Data Error", message: "Data returned is empty", action: AlertAction(buttonTitle: "OK", handler: {}))
            case .JSONDecoder:
                alert = SingleButtonAlert(title: "Data Error", message: "Data returned is not in the correct format", action: AlertAction(buttonTitle: "OK", handler: {}))
            }
        } else {
            alert = SingleButtonAlert(title: "Unknown Error", message: "please try again later.", action: AlertAction(buttonTitle: "OK", handler: {}))
        }
        return alert
    }
}
