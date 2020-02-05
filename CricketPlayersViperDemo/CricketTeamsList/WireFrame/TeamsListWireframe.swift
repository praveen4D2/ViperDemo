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
    func pushToTeamDetails(with team: TeamCellModel, from VC: UIViewController) {
        
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

