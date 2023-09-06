//
//  PlayersViewController.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 06.09.2023.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let players: [Player] = [
        Player(firstName: "LeBron",
               lastName: "James",
               position: "SF",
               teamName: "Lakers",
               height: "6'9''",
               cityName: "Los Angeles",
               conferenceName: "West"
              ),
        Player(firstName: "Anthony",
               lastName: "Davis",
               position: "PF",
               teamName: "Lakers",
               height: "6'10''",
               cityName: "Los Angeles",
               conferenceName: "West"
              ),
        Player(firstName: "Jimmy",
               lastName: "Butler",
               position: "SG",
               teamName: "Heat",
               height: "6'7''",
               cityName: "Miami",
               conferenceName: "East"
              ),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        
        let player = players[indexPath.row]
        cell.textLabel?.text = player.fullName
        cell.detailTextLabel?.text = player.teamName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let playerDetailsViewController = storyboard.instantiateViewController(identifier: "PlayerDetailsViewController") as! PlayerDetailsViewController
        
        let player = players[indexPath.row]
        playerDetailsViewController.player = player
        
        navigationController?.pushViewController(playerDetailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
