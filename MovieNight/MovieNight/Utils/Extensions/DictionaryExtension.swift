//
//  DictionaryExtension.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 17/09/24.
//

import Foundation

extension Dictionary {
    mutating func append(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
