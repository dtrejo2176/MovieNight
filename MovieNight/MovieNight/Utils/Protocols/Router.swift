//
//  Router.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 17/09/24.
//

import UIKit

protocol Router {
    var viewController: UIViewController? { get }
}

extension Router {
    func routeToAlert(alert: SingleButtonAlert) {
        let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alert.action.buttonTitle, style: .default, handler: { _ in alert.action.handler?() }))
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
