//
//  Alert.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 17/09/24.
//

import Foundation

struct AlertAction {
    let buttonTitle: String
    let handler: (() -> Void)?
}

struct SingleButtonAlert {
    let title: String
    let message: String?
    let action: AlertAction
}
