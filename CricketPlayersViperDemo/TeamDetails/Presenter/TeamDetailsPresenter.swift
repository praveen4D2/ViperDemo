//
//  TeamDetailsPresenter.swift
//  CricketPlayersViperDemo
//
//  Created by Adaps on 11/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import Foundation
import UIKit

class TeamDetailsPresenter:TeamDetailsPresenterProtocol {
    
    var view: TeamDetailsViewProtocol?
    var wireframe: TeamDetailsWireFrameProtocol?
    var team:TeamCellModel?
    
    func viewDidLoad() {
        guard let team = team else { return  }
        view?.showTeamMembers(with: team)
    }
    
    func backBtnPressed(from VC: UIViewController) {
        
    }
    
    
}
