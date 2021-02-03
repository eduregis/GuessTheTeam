//
//  FieldPresenter.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 03/02/21.
//

import CoreData

class FieldPresenter {
    
    @Published var apiData = [TeamData]()
    
    init() {
//        loadTeams()
        removeAllTeams()
        readTeams()
    }
    
    func loadTeams() {
        UserDefaults.standard.bool(forKey: "isNotFirstTime")
        if let fileLocation = Bundle.main.path(forResource: "api", ofType: "json") {
            do {
                let url = URL(fileURLWithPath: fileLocation)
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let dataFromJSON = try jsonDecoder.decode([TeamData].self, from: data)
                self.apiData = dataFromJSON
            } catch {
                print(error)
            }
        }
        
        for teamData in self.apiData {
            if let team = NSEntityDescription.insertNewObject(forEntityName: "Team", into:  DatabaseController.persistentContainer.viewContext) as? Team {
                team.name = teamData.name
                for playerData in teamData.players {
                    if let player = NSEntityDescription.insertNewObject(forEntityName: "Player", into:  DatabaseController.persistentContainer.viewContext) as? Player {
                        player.name = playerData.name
                        player.club = playerData.club
                        player.function = playerData.function
                        player.nationality = playerData.nationality
                        team.addToPlayers(player)
                    }
                    DatabaseController.saveContext()
                }
            }
        }
    }
    
    func readTeams() {
        do {
            if let teams = try DatabaseController.persistentContainer.viewContext.fetch(Team.fetchRequest()) as? [Team] {
                for team in teams {
                    print(team.name)
                }
            }
        } catch {
            print("Erro no banco, não conseguiu realizar a busca")
        }
    }
    
    func removeAllTeams() {
        do {
            if let teams = try DatabaseController.persistentContainer.viewContext.fetch(Team.fetchRequest()) as? [Team] {
                for team in teams {
                    DatabaseController.persistentContainer.viewContext.delete(team)
                    DatabaseController.saveContext()
                }
            }
        } catch {
            print("Erro no banco, não conseguiu realizar a busca")
        }
    }
}
