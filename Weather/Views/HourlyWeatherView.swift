//
//  HourlyWeatherView.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import SwiftUI

struct HourlyWeatherView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    private func getHourlyView(hour: String, image: Image, temperature: String) -> some View {
        VStack(spacing: 20) {
            Text(hour)
            image.foregroundColor(.yellow)
            Text(temperature)
        }
        .foregroundColor(.white)
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).fill(
            LinearGradient(
                gradient: Gradient(colors: [Color("lightBlue"), .blue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)))
        .shadow(color: .white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(cityViewModel.weather.hourly) {weather in
                    let icon = cityViewModel.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    let hour = cityViewModel.getTimeFor(timestamp: weather.dt)
                    let temperature = cityViewModel.getTemperatureFor(temperature: weather.temp)
                    
                    getHourlyView(hour: hour, image: icon, temperature: temperature)
                }
            }
        }
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
