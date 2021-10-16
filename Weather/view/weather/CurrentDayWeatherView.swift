//
//  WeatherDayView.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import SwiftUI

struct CurrentDayWeatherView: View {
    var temperature: Int
    var icon: String
    
    var body: some View {
        VStack(spacing:10) {
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
