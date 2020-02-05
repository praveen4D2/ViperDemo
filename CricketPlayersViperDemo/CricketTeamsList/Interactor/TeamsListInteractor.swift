//
//  TeamsListInteractor.swift
//  CricketPlayersViperDemo
//
//  Created by Adaps on 05/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import Foundation

class TeamsListInteractor: TeamsListInputInteractorProtocol {
    var presenter: TeamsListOutputInteractorProtocol?
    
    func getTeamsList() {
        presenter?.didFetchTeams(teamsList: getCricketTeams())
    }

    func getCricketTeams() -> [TeamCellModel]{

        var countries = [TeamCellModel]()
        APIService.shared.GET(endpoint: APIService.Endpoint.getPlayers)     {
                    (result: Result<CricketTeams, APIService.APIError>) in
                    switch result {
                    case let .success(response):
                        let mirror = Mirror(reflecting: response)
                        for child in mirror.children  {
                            let country = TeamCellModel(countryName: child.label ?? "", playersList: child.value as! [Player])
                            countries.append(country)
                        }
                        break
                    case let .failure(error):
                        print(error)
                        break
                    }
                }
        return countries
    }
    
}
