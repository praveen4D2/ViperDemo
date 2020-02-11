//
//  TeamsListWireframe.swift
//  CricketPlayersViperDemo
//
//  Created by Adaps on 05/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import Foundation
import UIKit

class TeamsListWireframe: TeamsListWireFrameProtocol {
    class func pushToTeamDetails(team: TeamCellModel, from VC: UIViewController) {
        
        let nextVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "TeamDetailsViewController") as TeamDetailsViewController
        TeamDetailsWireframe.createTeamDetailsModule(with: nextVC, team: team)
        VC.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    class func createTeamsListModule(teamsListRef: TeamsListViewController) {
        
        let presenter: TeamsListPresenterProtocol & TeamsListOutputInteractorProtocol = TeamsListPresenter()
        teamsListRef.presenter = presenter
        teamsListRef.presenter?.view = teamsListRef
        teamsListRef.presenter?.wireframe = TeamsListWireframe()
        teamsListRef.presenter?.interactor = TeamsListInteractor()
        teamsListRef.presenter?.interactor?.presenter = presenter
    }
    
}

