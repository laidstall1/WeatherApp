//
//  WeatherTableViewCell.swift
//  iOS Weather App
//
//  Created by Decagon on 27/04/2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
//private let refreshControl = UIRefreshControl()
    @IBOutlet var dayLabel:UILabel!
    @IBOutlet var tempLabel:UILabel!
    @IBOutlet var icon:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      //  backgroundColor = .systemBlue
        
        // Initialization code
    }

 
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let identifier = "WeatherTableViewCell"
//    var  selectionStyle: .none
    
    static func nib()->UINib{
        return UINib(nibName: "WeatherTableViewCell", bundle: nil )
    }
    func configure(with model:dailyWeather ){
        self.tempLabel.text = "\(Int(model.temp.day))°C"
        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.dt)))
        
        self.icon.contentMode = .scaleAspectFit
        let summary = model.weather[0].description
        
        if summary.contains("clear"){
            
        self.icon.image = UIImage(named:"clear")
        }
        else if summary.contains("rain"){
            
            self.icon.image = UIImage(named:"rain")
        }else{
            self.icon.image = UIImage(named:"partlysunny")
        }
    }
    
    func getDayForDate(_ date:Date?)->String{
        guard let inputDate = date else{
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate )
    }
}
