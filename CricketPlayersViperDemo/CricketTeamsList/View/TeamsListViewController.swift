//
//  TeamsListViewController.swift
//  CricketPlayersViperDemo
//
//  Created by Adaps on 05/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import UIKit

class TeamsListViewController: UIViewController {

    /// MARK : - Storyboard outlets
    @IBOutlet weak var tableView: UITableView!
    
    /// MARK : - Custom Outlets
    var countriesList = [TeamCellModel]()
    var presenter:TeamsListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        TeamsListWireframe.createTeamsListModule(teamsListRef: self)
        presenter?.viewDidLoad()
    }
    
    func setupTableView(){
        self.tableView.register(UINib(nibName: "TeamsTableViewCell", bundle: nil), forCellReuseIdentifier: "TeamsTableViewCell")
    }

}

extension TeamsListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TeamsTableViewCell", for: indexPath) as! TeamsTableViewCell
        cell.item = self.countriesList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


extension TeamsListViewController : TeamsListViewProtocol{
    func showTeams(with teams: [TeamCellModel]) {
        print(teams)
        self.countriesList = teams
        self.tableView.reloadData()
    }
}


