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
        removeAllTeams()
        loadTeams()
        readTeams()
    }
    
    func loadTeams() {
        print(UserDefaults.standard.bool(forKey: "isNotFirstTime"))
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
    
    func readTeams() -> [Team] {
        var teamList: [Team] = []
        do {
            let request = Team.fetchRequest() as NSFetchRequest<Team>
            if let teams = try DatabaseController.persistentContainer.viewContext.fetch(request) as? [Team] {
                teamList = teams
            }
        } catch {
            print("Erro no banco, não conseguiu realizar a busca")
        }
        return teamList
    }
    
    func fetchPlayersByClub(club: String) -> [Player] {
        var playerList: [Player] = []
        do {
            let request = Player.fetchRequest() as NSFetchRequest<Player>
            let pred =  NSPredicate(format: "club = %@", club)
            request.predicate = pred
            if let players = try DatabaseController.persistentContainer.viewContext.fetch(request) as? [Player] {
                playerList = players
            }
        } catch {
            print("Erro no banco, não conseguiu realizar a busca")
        }
        return playerList
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
    
    func showNamesinField(field: FieldView) {
        for player in field.team {
            player.playerNameLabel.isHidden = false
        }
    }
    
    func hidePlayersinField(field: FieldView) {
        for player in field.team {
            player.isHidden = true
        }
    }
    
    func setPlayersInField(field: FieldView, club: String) {
        var players = fetchPlayersByClub(club: club)
        
        for player in players {
            
            if let name = player.name {
                
                if let nationality = player.nationality {
                    
                    switch player.function {
                    case "GoalKeeper":
                        field.goalkeeper.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "Left Back":
                        field.leftBack.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "Center Back":
                        field.leftBack.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "Right Back":
                        field.rightBack.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "Left WingBack":
                        field.leftWingBack.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "Right WingBack":
                        field.rightWingBack.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "LeftCenter Midfielder":
                        field.leftMidfielder.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "RightCenter Midfielder":
                        field.rightMidfielder.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "Midfielder":
                        field.midfielder.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "Left Wing":
                        field.leftWing.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "Right Wing":
                        field.rightWing.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "Second Striker":
                        field.secondStriker.setPlayer(playerName: name, shieldOrFlag: nationality)
                    case "Striker":
                        field.striker.setPlayer(playerName: name, shieldOrFlag: nationality)
                    default:
                        break
                    }
                }
            }
        }
    }
}
