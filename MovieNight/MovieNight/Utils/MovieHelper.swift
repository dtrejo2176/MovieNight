//
//  MovieHelper.swift
//  MovieNight
//
//  Created by David Arturo Trejo Hernandez on 24/09/24.
//

import Foundation

struct MovieHelper {
    static func formatReleaseDate(releaseDate: String?) -> String {
        if let releaseDate = releaseDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: releaseDate) ?? Date()
            dateFormatter.dateFormat = "MMMM dd, yyyy"
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            return ""
        }
    }
    
    static func formatRuntime(runtime: Int?) -> String {
        var minutesString = ""
        var hoursString = ""
        
        if let runtime = runtime {
            let minutes = runtime % 60
            let hours = runtime / 60
            if hours != 0 {
                hoursString = "\(hours)h"
            }
            if minutes != 0 {
                minutesString = "\(minutes)m"
            }
            return "\(hoursString) \(minutesString)"
        } else {
            return "-"
        }
    }
}
