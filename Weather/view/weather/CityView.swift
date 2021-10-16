//
//  CityView.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import SwiftUI

struct CityView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding(.top)
    }
}
