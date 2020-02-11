//
//  TeamsListProtocols.swift
//  CricketPlayersViperDemo
//
//  Created by Adaps on 05/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import Foundation
import UIKit

protocol TeamsListViewProtocol:  class {
    // PRESENTER -> VIEW
    func showTeams(with teams:[TeamCellModel])
    
    func showData(with data:String)
}

protocol TeamsListPresenterProtocol: class {
    // VIEW -> PRESENTER
    var interactor: TeamsListInputInteractorProtocol? {get set}
    var view: TeamsListViewProtocol? {get set}
    var wireframe: TeamsListWireFrameProtocol? {get set}
    func viewDidLoad()
    func getData(input:String)
    
}


protocol TeamsListInputInteractorProtocol: class {
    var presenter: TeamsListOutputInteractorProtocol? { get set}
    // PRESENTER -> INTERACTOR
    func getTeamsList()
    
    func retriveData(input:String)
}

protocol TeamsListOutputInteractorProtocol: class {
    // INTERACTOR -> PRESENTER
    func didFetchTeams(teamsList:[TeamCellModel])
    
    
    func didRetriveData(output:String)
}

protocol TeamsListWireFrameProtocol {
    // Presenter -> Wireframe
    static func pushToTeamDetails(team:TeamCellModel, from VC:UIViewController)
    static func createTeamsListModule(teamsListRef: TeamsListViewController)

}
