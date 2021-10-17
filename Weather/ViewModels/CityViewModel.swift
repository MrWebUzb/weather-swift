//
//  CityViewViewModel.swift
//  Weather
//
//  Created by Asliddin Abdivasiyev on 17/10/21.
//

import SwiftUI
import CoreLocation

final class CityViewModel: ObservableObject {
    
    @Published var weather: WeatherResponse = WeatherResponse.empty()
    @Published var city: String = "Tashkent" {
        didSet {
            getLocation()
        }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        
        return formatter
    }()
    
    init() {
        getLocation()
    }
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    
    var temperature: String {
        let temperature = weather.current.temp
        
        return getTemperatureFor(temperature: temperature)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var windSpeed: String {
        let windSpeed = weather.current.wind_speed
        
        return String(format: "%0.1f", windSpeed)
    }
    
    var humidity: String {
        let humidity = weather.current.humidity
        
        return String(format: "%d%%", humidity)
    }
    
    var rainChances: String {
        let dewPoint = weather.current.dew_point
        
        return String(format: "%0.0f%%", dewPoint)
    }
    
    func getTemperatureFor(temperature: Double) -> String {
        return String(format: "%0.1f °C", temperature)
    }
    
    func getTimeFor(timestamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getDayFor(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    private func getWeather(coordinate: CLLocationCoordinate2D?) {
        var urlString: String
        if let coordinate = coordinate {
            urlString = Api.getURLFor(lat: coordinate.latitude, lon: coordinate.longitude)
        } else {
            urlString = Api.getURLFor(lat: 41.3725692, lon: 69.2965532)
        }
        getWeatherInternal(city: city, for: urlString)
    }
    
    private func getWeatherInternal(city: String, for urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coordinate: place.location?.coordinate)
            }
        }
    }
    
    func getLottieAnimationFor(icon: String) -> String {
        switch icon {
        case "01d":
            return "dayClearSky"
        case "01n":
            return "nightClearSky"
        case "02d":
            return "dayFewClouds"
        case "02n":
            return "nightFewClouds"
        case "03d":
            return "dayScatteredClouds"
        case "03n":
            return "nightScatteredClouds"
        case "04d":
            return "dayBrokenClouds"
        case "04n":
            return "nightBrokenClouds"
        case "09d":
            return "dayShowerRains"
        case "09n":
            return "nightShowerRains"
        case "10d":
            return "dayRain"
        case "10n":
            return "nightRain"
        case "11d":
            return "dayThunderstorm"
        case "11n":
            return "nightThunderstorm"
        case "13d":
            return "daySnow"
        case "13n":
            return "nightSnow"
        case "50d":
            return "dayMist"
        case "50n":
            return "nightMist"
        default:
            return "dayClearSky"
        }
    }
    
    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill")
        case "01n":
            return Image(systemName: "moon.fill")
        case "02d":
            return Image(systemName: "cloud.sun.fill")
        case "02n":
            return Image(systemName: "cloud.moon.fill")
        case "03d":
            return Image(systemName: "cloud.fill")
        case "03n":
            return Image(systemName: "cloud.fill")
        case "04d":
            return Image(systemName: "cloud.fill")
        case "04n":
            return Image(systemName: "cloud.fill")
        case "09d":
            return Image(systemName: "cloud.drizzle.fill")
        case "09n":
            return Image(systemName: "cloud.drizzle.fill")
        case "10d":
            return Image(systemName: "cloud.heavyrain.fill")
        case "10n":
            return Image(systemName: "cloud.heavyrain.fill")
        case "11d":
            return Image(systemName: "cloud.bolt.fill")
        case "11n":
            return Image(systemName: "cloud.bolt.fill")
        case "13d":
            return Image(systemName: "cloud.snow.fill")
        case "13n":
            return Image(systemName: "cloud.snow.fill")
        case "50d":
            return Image(systemName: "cloud.fog.fill")
        case "50n":
            return Image(systemName: "cloud.fog.fill")
        default:
            return Image(systemName: "sun.max.fill")
        }
    }
}
