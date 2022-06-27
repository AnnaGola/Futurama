//
//  HourCollection.swift
//  Weather
//
//  Created by anna on 27.06.2022.
//

import UIKit

struct HourCollectionViewCell {
    
    let tempLabelString: String?
    let timeLabelString: String?
    let humidityLabelString: String?
    let iconImage: UIImage?
    let urlString: String?
}


final class HourCollectionCell: UICollectionViewCell {
    
    static let identifier = "HourCollectionCell"
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightBlue
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(humidityLabel)
        contentView.addSubview(iconImageView)
        addConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            
            temperatureLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 10),
            
            humidityLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            humidityLabel.bottomAnchor.constraint(equalTo: iconImageView.topAnchor),
            
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
    
    func configure(with viewModel: HourCollectionViewCell) {
        if viewModel.tempLabelString == "Now" {
            timeLabel.text = "Now"
            timeLabel.font = UIFont.boldSystemFont(ofSize: 17)
            temperatureLabel.text = viewModel.tempLabelString
            temperatureLabel.font = UIFont.boldSystemFont(ofSize: 17)
        } else {
            timeLabel.text = viewModel.timeLabelString
            temperatureLabel.text = viewModel.tempLabelString
        }
        
        if viewModel.iconImage != nil {
            iconImageView.image = viewModel.iconImage
        } else {
            iconImageView.downloadedData(from: viewModel.urlString ?? "")
        }
        
        humidityLabel.text = viewModel.humidityLabelString
    }
}

