//
//  FetchData.swift
//  iOS Weather App
//
//  Created by Decagon on 04/05/2021.
//

import Foundation
class ViewModel{
    
    var requestCompletion: (() -> Void)?
    
  //  var Table = ViewController()
    var models = [dailyWeather]()
    var results = [WeatherResponse]()
    func requestWeather(){
        
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=6.5833&lon=3.75&appid=e7ec1576762e776cc0b33d20af144b08&exclude=hourly&units=metric"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data,response,error in
            
            guard let data = data, error == nil else{
                print ("Something went wrong")
                return
            }
            var json:WeatherResponse?
            
            do{
                json = try JSONDecoder().decode(WeatherResponse.self, from: data)
            }
            catch{
                print("error:\(error)")
            }
            guard let result = json else {
                return
            }
            let entries = result.daily
            self.models.append(contentsOf:entries)
    
           DispatchQueue.main.async {
            
            self.requestCompletion?()
            
           }
            
        }).resume()
    }

}


