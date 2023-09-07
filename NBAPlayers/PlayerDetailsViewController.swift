//
//  PlayerDetailsViewController.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 06.09.2023.
//

import UIKit

class PlayerDetailsViewController: UIViewController {
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var teamButton: UIButton!
    var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = player?.fullName
        positionLabel.text = player?.position
        heightLabel.text = player?.height
        teamButton.setTitle(player?.team.fullName, for: .normal)
    }
    @IBAction func onTeamButtonClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamNameViewController = storyboard.instantiateViewController(identifier: "TeamNameViewController") as! TeamNameViewController
        teamNameViewController.team = player?.team
        navigationController?.pushViewController(teamNameViewController, animated: true)
    }
}
