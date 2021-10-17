//
//  DailyWeatherView.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import SwiftUI

struct DailyWeatherView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    private func getDailyCell(weather: DailyWeather) -> some View {
        HStack {
            Text(cityViewModel.getDayFor(timestamp: weather.dt).uppercased())
                .frame(width: 50)
            
            Spacer()
            
            Text("\(cityViewModel.getTemperatureFor(temperature: weather.temp.max)) | \(cityViewModel.getTemperatureFor(temperature: weather.temp.min))")
                .frame(width: 150)
            
            Spacer()
            
            cityViewModel.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 5).fill(
            LinearGradient(
                gradient: Gradient(colors: [Color("lightBlue"), .blue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)))
        .shadow(color: .white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
    
    var body: some View {
        ForEach(cityViewModel.weather.daily) {weather in
            LazyVStack {
                getDailyCell(weather: weather)
            }
        }
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
