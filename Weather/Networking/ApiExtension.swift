//
//  ApiExtension.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import Foundation

extension Api {
    static let baseURL: String = "https://api.openweathermap.org/data/2.5"
    
    static func getURLFor(lat: Double, lon: Double) -> String {
        return "\(baseURL)/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&units=metric&appid=\(Api.key)"
    }
}
