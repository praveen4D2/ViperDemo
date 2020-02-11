//
//  TeamDetailsWireframe.swift
//  CricketPlayersViperDemo
//
//  Created by Adaps on 11/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import Foundation

class TeamDetailsWireframe: TeamDetailsWireFrameProtocol {
    
    class func createTeamDetailsModule(with VC:TeamDetailsViewController, team:TeamCellModel)
    {
        let presenter = TeamDetailsPresenter()
        presenter.team = team
        VC.presenter = presenter
        VC.presenter?.view = VC
        VC.presenter?.wireframe = TeamDetailsWireframe()
        
    }
}
