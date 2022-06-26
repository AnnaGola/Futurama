//
//  MainHeader.swift
//  Weather
//
//  Created by anna on 26.06.2022.
//

import UIKit
import CoreLocation


final class MainHeader: UIView {

    let locationManager = CLLocationManager()
    let networkService = FetchDataService()
    //let weatherModel: Model?
    
    private let locationNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 27, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 90, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionlabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let highTemperatureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lowTemperatureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(locationNameLabel)
        addSubview(currentTemperatureLabel)
        addSubview(descriptionlabel)
        addSubview(highTemperatureLabel)
        addSubview(lowTemperatureLabel)
        addConstraints()
        setupLocationManager()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            currentTemperatureLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            currentTemperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currentTemperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            currentTemperatureLabel.heightAnchor.constraint(equalToConstant: 70),
            
            locationNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            locationNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            locationNameLabel.heightAnchor.constraint(equalToConstant: 50),
            locationNameLabel.bottomAnchor.constraint(equalTo: currentTemperatureLabel.topAnchor, constant: -40),
        
            descriptionlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            descriptionlabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            descriptionlabel.heightAnchor.constraint(equalToConstant: 50),
            descriptionlabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 20),
            
            lowTemperatureLabel.topAnchor.constraint(equalTo: descriptionlabel.bottomAnchor, constant: 10),
            lowTemperatureLabel.widthAnchor.constraint(equalTo: self.currentTemperatureLabel.widthAnchor, multiplier: 0.3),
            lowTemperatureLabel.heightAnchor.constraint(equalToConstant: 50),
            lowTemperatureLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor),
            
            highTemperatureLabel.topAnchor.constraint(equalTo: descriptionlabel.bottomAnchor, constant: 10),
            highTemperatureLabel.widthAnchor.constraint(equalTo: self.currentTemperatureLabel.widthAnchor, multiplier: 0.3),
            highTemperatureLabel.heightAnchor.constraint(equalToConstant: 50),
            highTemperatureLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.stopUpdatingLocation()
    }
}
    
extension MainHeader: CLLocationManagerDelegate {
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationManager.stopUpdatingLocation()
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkService.fetchWeatherData(latitude: latitude, longitude: longitude) { [weak self] (weather) in
            guard let self = self,
                  let weather = weather,
                  let currentWeather = weather.current.weather.first,
                  let dailytWeather = weather.daily.first else { return }
            
//            self.locationNameLabel.text = weather.timezone.deletingPrefix()
//            self.currentTempLabel.text = String(format: "%.f", weather.current.temp) + "°"
//            self.descriptionLabel.text = currentWeather.descriptionWeather.firstCapitalized
//            self.lowTempLabel.text = "Min: " + String(format: "%.f", dailytWeather.temp.min) + "°"
//            self.highTempLabel.text = "Max: " + String(format: "%.f", dailytWeather.temp.max) + "°"
//            self.weatherModel = weather
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Can't get location", error)
    }
}

