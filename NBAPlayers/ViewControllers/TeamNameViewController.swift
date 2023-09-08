//
//  TeamNameViewController.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 06.09.2023.
//

import UIKit

class TeamNameViewController: UIViewController {
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var conferenceName: UILabel!
    
    var team: Team?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = team?.name
        cityName.text = team?.city
        conferenceName.text = team?.conference
    }
}
