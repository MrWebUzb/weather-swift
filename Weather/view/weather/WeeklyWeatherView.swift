//
//  WeeklyWeatherView.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import SwiftUI

struct WeeklyWeatherView: View {
    
    var weatherModels: [WeatherModel]
    
    var body: some View {
        HStack {
            ForEach(weatherModels, id: \.self) { model in
                WeatherOfDayView(dayOfWeek: model.dayOfWeek,
                                 icon:  model.icon,
                                 temperature: model.temperature)
            }
        }
    }
}
