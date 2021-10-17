//
//  TodayWeatherView.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import SwiftUI

struct TodayWeatherView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    private func widgetView(image: String, color: Color, title: String) -> some View {
        VStack{
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
            
            Text(title)
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Today")
                .font(.largeTitle)
                .bold()
            
            HStack {
                LottieView(
                    name: cityViewModel.getLottieAnimationFor(
                        icon: cityViewModel.weatherIcon
                    )
                ).frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text("\(cityViewModel.temperature)")
                        .font(.system(size: 42))
                    Text(cityViewModel.conditions)
                }
            }
            
            HStack {
                Spacer()
                widgetView(image: "wind",
                           color: .green,
                           title: "\(cityViewModel.windSpeed) m/s")
                Spacer()
                widgetView(image: "drop.fill",
                           color: .blue,
                           title: "\(cityViewModel.humidity)")
                Spacer()
                widgetView(image: "umbrella.fill",
                           color: .red,
                           title: "\(cityViewModel.rainChances)")
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 20).fill(
            LinearGradient(colors: [.blue.opacity(0.5), .blue],
                           startPoint: .top,
                           endPoint: .bottom)
        ).opacity(0.3))
        .shadow(color: .white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
