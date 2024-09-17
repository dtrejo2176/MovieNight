//
//  StoryboardInstanciable.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 17/09/24.
//

import UIKit

protocol StoryboardInstanciable {
    static func instantiate(from storyboard: Storyboard) -> Self
}

extension StoryboardInstanciable where Self: UIViewController {
    
    static func instantiate(from storyboard: Storyboard) -> Self {
        let moduleClassName = NSStringFromClass(self)
        let className = moduleClassName.components(separatedBy: ".").last!
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
