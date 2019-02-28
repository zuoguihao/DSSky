//
//  WeekWeatherViewModel.swift
//  DSSky
//
//  Created by 左得胜 on 2019/2/28.
//  Copyright © 2019 左得胜. All rights reserved.
//

import UIKit

struct WeekWeatherViewModel {
    let weekWeatherModels: [ForecastModel]
    
    private let dateFormatter = DateFormatter()
    
    func week(for index: Int) -> String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(
            from: weekWeatherModels[index].time)
    }
    
    func date(for index: Int) -> String {
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(
            from: weekWeatherModels[index].time)
    }
    
    func temperature(for index: Int) -> String {
        let min = String(format: "%.0f °C",
                         weekWeatherModels[index].temperatureLow.toCelsius())
        let max = String(format: "%.0f °C",
                         weekWeatherModels[index].temperatureHigh.toCelsius())
        
        return "\(min) - \(max)"
    }
    
    func weatherIcon(for index: Int) -> UIImage? {
        return UIImage(named: weekWeatherModels[index].icon)
    }
    
    func humidity(for index: Int) -> String {
        return String(format: "%.0f %%", weekWeatherModels[index].humidity * 100)
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfDays: Int {
        return weekWeatherModels.count
    }
    
}
