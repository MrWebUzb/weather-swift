//
//  WeatherOfDayView.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import SwiftUI

struct WeatherOfDayView: View {
    var dayOfWeek: String
    var icon: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
