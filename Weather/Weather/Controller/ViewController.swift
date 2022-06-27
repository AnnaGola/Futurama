//
//  ViewController.swift
//  Weather
//
//  Created by anna on 26.06.2022.
//

import UIKit
import CoreLocation

final class ViewController: UIViewController {

    private let locationManager = CLLocationManager()
    private let networkService = FetchDataService()
    private let weatherModel: Model? = nil
    private var header: MainHeader?
    
    private let mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightBlue
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightBlue
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return WeatherTableViewSections.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = WeatherTableViewSections(sectionIndex: section) else {
        return 0
    }
        switch section {
        case .hourly: return 1
        case .daily: return 2
        case .information: return 3
        case .description: return descriptionArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = WeatherTableViewSections(sectionIndex: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .hourly:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HourCell.identifier, for: indexPath) as? HourCell else { return UITableViewCell() }
            if let weatherModel = weatherModel {
                cell.configure(with: weatherModel)
            }
            return cell
        case .daily:
            
        case .information:
            
        case .description:
            
        }
  }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = WeatherTableViewSections(sectionIndex: indexPath.section) else { return CGFloat() }
        switch section {
        case .hourly:
            return section.cellHeight
        case .daily:
            return section.cellHeight
        case .information:
            return section.cellHeight
        case .description:
            return section.cellHeight
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationManager.startUpdatingLocation()
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkService.fetchWeatherData(latitude: latitude, longitude: longitude) { [weak self] weather in
            guard let self = self, let weather = weather else { return }
            
            self.weatherModel = weather
            
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    
    
}
