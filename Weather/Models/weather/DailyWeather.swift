//
//  DailyWeather.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import Foundation
import UIKit

struct DailyWeather: Codable, Identifiable {
    var dt: Int
    var temp: Temperature
    var weather: [WeatherDetail]
    
    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = []
    }
}

extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}

