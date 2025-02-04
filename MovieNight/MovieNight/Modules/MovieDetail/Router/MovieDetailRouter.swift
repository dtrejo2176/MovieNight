//
//  MovieDetailRouter.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 24/09/24.
//

import UIKit

class MovieDetailRouter: Router {
    internal weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeBack() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
}
