//
//  TeamsListPresenter.swift
//  CricketPlayersViperDemo
//
//  Created by Adaps on 05/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import Foundation

class TeamsListPresenter:TeamsListPresenterProtocol {

    
    var wireframe: TeamsListWireFrameProtocol?
    var interactor: TeamsListInputInteractorProtocol?
    var view: TeamsListViewProtocol?
    
    func viewDidLoad() {
        self.loadTeams()
    }
    
    func getData(input: String) {
        interactor?.retriveData(input: input)
    }
    func loadTeams(){
        interactor?.getTeamsList()
    }

}

extension TeamsListPresenter: TeamsListOutputInteractorProtocol {
    func didRetriveData(output: String) {
        view?.showData(with: output)
    }
    
    func didFetchTeams(teamsList: [TeamCellModel]) {
        view?.showTeams(with: teamsList)
    }
}





