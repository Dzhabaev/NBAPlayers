//
//  GameDetailsViewController.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 08.09.2023.
//

import UIKit

class GameDetailsViewController: UIViewController {
    
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var visitorTeamScore: UILabel!
    
    @IBOutlet weak var homeTeamButton: UIButton!
    @IBOutlet weak var visitorTeamButton: UIButton!
    
    var game: Game?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        if let game = game {
            navigationItem.title = game.formattedDate
            seasonLabel.text = game.seasonToString
            periodLabel.text = game.periodToString
            statusLabel.text = game.status
            homeTeamScore.text = game.homeTeamScoreToString
            visitorTeamScore.text = game.visitorTeamScoreToString
            homeTeamButton.setTitle(game.homeTeam.fullName, for: .normal)
            visitorTeamButton.setTitle(game.visitorTeam.fullName, for: .normal)
        }
    }
    @IBAction func teamButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamNameViewController = storyboard.instantiateViewController(identifier: "TeamNameViewController") as! TeamNameViewController
        if sender == homeTeamButton {
            teamNameViewController.team = game?.homeTeam
        } else if sender == visitorTeamButton {
            teamNameViewController.team = game?.visitorTeam
        }
        navigationController?.pushViewController(teamNameViewController, animated: true)
    }
}
