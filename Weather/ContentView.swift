//
//  ContentView.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 16/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityView(cityName: "Kitab, Kashkadarya")
                
                CurrentDayWeatherView(
                    temperature: 28,
                    icon: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                
                WeeklyWeatherView(weatherModels: [
                    WeatherModel(dayOfWeek: "TUE",
                                     icon:  "cloud.heavyrain.fill",
                                     temperature: 12),
                    WeatherModel(dayOfWeek: "WED",
                                     icon:  "cloud.hail.fill",
                                     temperature: 20),
                    WeatherModel(dayOfWeek: "THU",
                                     icon:  "cloud.sun.rain.fill",
                                     temperature: 22),
                    WeatherModel(dayOfWeek: "FRI",
                                     icon:  "sun.max.fill",
                                     temperature: 32),
                    WeatherModel(dayOfWeek: "SAT",
                                     icon:  "cloud.snow.fill",
                                     temperature: -5)
                ])
                
                Spacer()
                
                WeatherButton(action: {
                    isNight.toggle()
                },
                      title: "Change Day Time",
                      backgroundColor: .white,
                      textColor: .blue)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            isNight ? .black : .blue,
            isNight ? .gray :Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
