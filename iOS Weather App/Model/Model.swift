//
//  Model.swift
//  iOS Weather App
//
//  Created by Decagon on 04/05/2021.
//

import Foundation

public struct WeatherResponse: Codable {
    
    let current: currentWeatherObject
    
    let daily: [dailyWeather]
    
}
public struct currentWeatherObject : Codable {
    
    let dt: Int
    
    let temp: Double
    
    let weather: [weatherValues]
    
}

public struct dailyWeather: Codable {
    
    let dt: Int
    
    let temp: tempObject
    
    let weather: [weatherValues]
    
}

public struct tempObject: Codable {
    
    let day: Double
    
    let min: Double
    
    let max: Double
    
    let night: Double
    
    let eve: Double
    
    let morn: Double
    
}

public struct weatherValues: Codable {
    
    let id: Int
    
    let main: String
    
    let description: String
    
    let icon: String
    
}
