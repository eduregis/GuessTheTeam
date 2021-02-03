//
//  ViewController.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 03/02/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundPurple
        removeAllTeams()
        readTeam()

    }
    
    func loadTeams() {
        if let team = NSEntityDescription.insertNewObject(forEntityName: "Team", into:  DatabaseController.persistentContainer.viewContext) as? Team {
            team.name = "Flamengo"
            if let player = NSEntityDescription.insertNewObject(forEntityName: "Player", into:  DatabaseController.persistentContainer.viewContext) as? Player {
                player.name = "Bruno Henrique"
                player.club = "Flamengo"
                player.function = "Left wing"
                player.nationality = "Brazil"
                team.addToPlayers(player)
            }
            DatabaseController.saveContext()
        }
    }
    
    func readTeam() {
        do {
            if let teams = try DatabaseController.persistentContainer.viewContext.fetch(Team.fetchRequest()) as? [Team] {
                for team in teams {
                    print(team.name)
                    var players = team.players
                    
                }
            }
        } catch {
            print("Erro no banco, não conseguiu realizar a busca")
        }
    }
    
    func removeAllTeams() {
        do {
            if var teams = try DatabaseController.persistentContainer.viewContext.fetch(Team.fetchRequest()) as? [Team] {
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

