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
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var txtOutput: UITextField!
    
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
    
    @IBAction func onSubmit(_ sender: Any) {
        guard let inputData = self.txtInput.text else { return  }
        presenter?.getData(input: inputData)
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
        TeamsListWireframe.pushToTeamDetails(team: self.countriesList[indexPath.row], from: self)
    }
    
}


extension TeamsListViewController : TeamsListViewProtocol{
    func showData(with data: String) {
        print("output data  \(data)")
        self.txtOutput.text = data
    }
    
    func showTeams(with teams: [TeamCellModel]) {
        print(teams)
        self.countriesList = teams
        self.tableView.reloadData()
    }
}


