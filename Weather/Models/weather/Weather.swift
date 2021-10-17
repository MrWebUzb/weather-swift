//
//  Weather.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import Foundation

struct Weather: Codable, Identifiable {
    var dt: Int
    var temp: Double
    var feels_like: Double
    var pressure: Int
    var humidity: Int
    var dew_point: Double
    var wind_speed: Double
    var wind_deg: Int
    var weather: [WeatherDetail]
    
    init() {
        dt = 0
        temp = 0.0
        feels_like = 0.0
        pressure = 0
        humidity = 0
        dew_point = 0.0
        wind_speed = 0.0
        wind_deg = 0
        weather = []
    }
}

extension Weather {
    var id: UUID {
        return UUID()
    }
}
