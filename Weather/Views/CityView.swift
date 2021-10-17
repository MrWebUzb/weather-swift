//
//  CityView.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import SwiftUI

struct CityView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        VStack {
            CityNameView(city: cityViewModel.city, date: cityViewModel.date)
                .shadow(radius: 0)
            TodayWeatherView(cityViewModel: cityViewModel)
                .padding()
            HourlyWeatherView(cityViewModel: cityViewModel)
            DailyWeatherView(cityViewModel: cityViewModel)
        }
        .padding(.bottom, 40)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
