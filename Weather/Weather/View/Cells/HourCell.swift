//
//  HourCell.swift
//  Weather
//
//  Created by anna on 26.06.2022.
//

import UIKit

final class HourCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    
    private var weatherModel: Model?
    static var identifier = "HourCell"
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: 60, height: 120)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .lightBlue
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .lightBlue
        selectionStyle = .none
        contentView.addSubview(collectionView)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    func configure(with model: Model) {
        self.weatherModel = model
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    private func setupCollectionView() {
        collectionView.register(HourCollectionCell.self, forCellWithReuseIdentifier: HourCollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupContentView() {
        
        collectionView.register(HourCell.self, forCellWithReuseIdentifier: HourCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureCollectioncell(_ index: Int) -> HourCollectionViewCell {
        
        var tempLabelstring: String?
        var timeLabelstring: String?
        var humidityLabelString: String?
        var iconImageLabel: UIImage?
        var urlStringForImage: String?
        
        if let weatherModel = weatherModel {
            let hourlyModel = weatherModel.hourly[index]
            let hourForDate = Date(timeIntervalSince1970: Double(hourlyModel.dt)).getHourForDate()
            let nextHourForDate = Date(timeIntervalSince1970: Double(weatherModel.hourly[index + 1].dt)).getTimeForDate()
            let timeForDate = Date(timeIntervalSince1970: Double(hourlyModel.dt)).getTimeForDate()
            let sunset = Date(timeIntervalSince1970: Double(weatherModel.current.sunset)).getTimeForDate()
            let sunrise = Date(timeIntervalSince1970: Double(weatherModel.current.sunrise)).getTimeForDate()
            urlStringForImage = "http://openweathermap.org/img/wn/\(hourlyModel.weather[0].icon)@2x.png"
            
            if index == 0 {
                timeLabelstring = "Now"
                iconImageLabel = nil
                tempLabelstring = String(format: "%.f", weatherModel.hourly[index].temp) + "º"
            } else {
                if sunset >= timeForDate && sunset < nextHourForDate {
                    tempLabelstring = "Sunset"
                    iconImageLabel = #imageLiteral(resourceName: "sunset")
                    timeLabelstring = sunset
                } else if sunrise >= timeForDate && sunrise < nextHourForDate {
                    tempLabelstring = "Sunrise"
                    iconImageLabel = #imageLiteral(resourceName: "sunrise")
                    timeLabelstring = sunrise
                } else {
                    iconImageLabel = nil
                    tempLabelstring = String(format: "%.f", weatherModel.hourly[index].temp) + "º"
                    timeLabelstring = hourForDate
                }
            }
            
            if hourlyModel.humidity >= 30 {
                humidityLabelString = String(hourlyModel.humidity) + " %"
            } else {
                humidityLabelString = ""
            }
        }
        
        return HourCollectionViewCell(
            tempLabelString: tempLabelstring,
            timeLabelString: timeLabelstring,
            humidityLabelString: humidityLabelString,
            iconImage: iconImageLabel,
            urlString: urlStringForImage
        )
    }
}

extension HourCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourCollectionCell.identifier, for: indexPath) as! HourCollectionCell
        
        let viewModel = configureCollectioncell(indexPath.row)
        cell.configure(with: viewModel)
        cell.backgroundColor = .lightBlue
        return cell
    }
}
