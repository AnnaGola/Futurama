//
//  FetchDataService.swift
//  Weather
//
//  Created by anna on 26.06.2022.
//

import Foundation
import CoreLocation


class FetchDataService {
    
    var fetchData: FetchingData = FetchData()
    
    func fetchWeatherData(
        latitude: CLLocationDegrees,
        longitude: CLLocationDegrees,
        complitionHandler: @escaping (WeatherModel?) -> Void) {
            
            let urlString = APIManager.shared.getWeatherURL(latitude: latitude, longitude: longitude)
            fetchData.fetchData(urlString: urlString, complitionHandler: complitionHandler)
        }
}
