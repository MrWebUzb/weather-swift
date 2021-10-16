//
//  WeatherButtonLabel.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import SwiftUI

struct WeatherButton: View {
    var action: () -> Void
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(10.0)
        })
    }
}
