//
//  GamesViewController.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 07.09.2023.
//

import UIKit

class GamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DataLoadingViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    var games: [Game] = []
    let apiClientGames: ApiClientGames = ApiClientImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        reload()
    }
    
    @IBAction func onReloadButtonClick(_ sender: Any) {
        reload()
    }
    
    func reload() {
        showLoading()
        apiClientGames.getGames(completion: {result in
            DispatchQueue.main.async {
                switch result {
                case .success(let games):
                    self.games = games
                    self.tableView.reloadData()
                    self.showData()
                case .failure:
                    self.games = []
                    self.tableView.reloadData()
                    self.showError()
                }
            }
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        let game = games[indexPath.row]
        cell.textLabel?.text = game.dateSeason
        cell.detailTextLabel?.text = game.teamVS
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.black.withAlphaComponent(0.02)
        } else {
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let gameDetailsViewController = storyboard.instantiateViewController(identifier: "GameDetailsViewController") as! GameDetailsViewController
        let game = games[indexPath.row]
        gameDetailsViewController.game = game
        navigationController?.pushViewController(gameDetailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
