//
//  DataLoadingViewController.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 09.09.2023.
//

import UIKit

protocol DataLoadingViewController: UIViewController {
    var activityIndicator: UIActivityIndicatorView! { get set }
    var errorLabel: UILabel! { get set }
    var reloadButton: UIButton! { get set }
    
    func showLoading()
    func showError()
    func showData()
    func reload()
}

extension DataLoadingViewController {
    func showLoading() {
        activityIndicator.startAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    func showError() {
        activityIndicator.stopAnimating()
        errorLabel.isHidden = false
        reloadButton.isHidden = false
    }
    
    func showData() {
        activityIndicator.stopAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
}

