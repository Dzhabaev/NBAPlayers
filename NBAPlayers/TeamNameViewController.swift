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
    
    var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = player?.teamName
        cityName.text = player?.cityName
        conferenceName.text = player?.conferenceName
    }
}
