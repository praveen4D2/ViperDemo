//
//  TeamDetailsProtocol.swift
//  CricketPlayersViperDemo
//
//  Created by Adaps on 11/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import Foundation
import UIKit

protocol TeamDetailsViewProtocol {
    func showTeamMembers(with team:TeamCellModel)
}

protocol TeamDetailsPresenterProtocol {
    
    var view:TeamDetailsViewProtocol? { get set }
    var wireframe: TeamDetailsWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func backBtnPressed(from VC:UIViewController)
//    var wireframe:
}

protocol TeamDetailsWireFrameProtocol {
}

