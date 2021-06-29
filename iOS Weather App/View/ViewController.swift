//
//  ViewController.swift
//  iOS Weather App
//
//  Created by Decagon on 19/04/2021.
//

import UIKit

var viewModel = ViewModel()


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var topTempLabel: UILabel!
    @IBOutlet weak var topTempDescriptionLabel: UILabel!
    @IBOutlet weak var middleViewTempLabel: UILabel!
    @IBOutlet weak var middleViewRightLabel: UILabel!
    @IBOutlet weak var middleViewLeftLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier )
        table.delegate = self
        table.dataSource = self
        viewModel.requestWeather()
        viewModel.requestCompletion = { [weak self] in
        self?.table.reloadData()
            
        self?.middleViewTempLabel.text = "\(Int(viewModel.models[1].temp.day))°C"
        self?.middleViewLeftLabel.text = "\(Int(viewModel.models[0].temp.min))°C"
        self?.middleViewRightLabel.text = "\(Int(viewModel.models[1].temp.max))°C"
        self?.topTempLabel.text = "\(Int(viewModel.models[1].temp.day))°C"
        self?.topTempDescriptionLabel.text = viewModel.models[2].weather[0].description.uppercased()
        
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.models.count - 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath)as! WeatherTableViewCell
        cell.configure(with: viewModel.models[indexPath.row])
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84.7
    }
    
}


