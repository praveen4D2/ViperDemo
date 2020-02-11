//
//  TeamDetailsViewController.swift
//  CricketPlayersViperDemo
//
//  Created by Adaps on 11/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    
    /// Storyboard Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter:TeamDetailsPresenterProtocol?
    
    /// Custom Outlets
    
    var cellModel:TeamCellModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        self.setupTableView()
        
        print("cell model  \(cellModel)")
        
    }

    private func setupTableView(){
        self.tableView.register(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

/// MARK : - UITableViewDelegate

extension TeamDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellModel?.playersList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
        cell.item = self.cellModel?.playersList[indexPath.row]
        return cell
    }

}


extension TeamDetailsViewController: TeamDetailsViewProtocol{
    func showTeamMembers(with team: TeamCellModel) {
        cellModel = team
        self.tableView.reloadData()
    }
}
