//
//  MenuHeaderView.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    @State private var searchTerm: String = "Tashkent"
    
    var body: some View {
        HStack {
            TextField("", text: $searchTerm)
                .padding(.leading, 20)
            
            Button {
                cityViewModel.city = searchTerm
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                    
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.blue.opacity(0.5))
        })
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
