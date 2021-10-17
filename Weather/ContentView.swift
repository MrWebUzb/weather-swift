//
//  ContentView.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 16/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cityViewModel: CityViewModel = CityViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                MenuHeaderView(cityViewModel: cityViewModel)
                    .padding()
                ScrollView(showsIndicators: false) {
                    CityView(cityViewModel: cityViewModel)
                }.padding(.top, 10)
            }.padding(.top, 30)
        }.background(LinearGradient(
            gradient: Gradient(colors: [Color("lightBlue"), .blue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing))
            .edgesIgnoringSafeArea(.all)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
