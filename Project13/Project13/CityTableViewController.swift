//
//  CityTableViewController.swift
//  Project13
//
//  Created by 馬丹君 on 2019/7/1.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    let heroes : [String: [String]] =
        ["A": ["Anti-Mage", "Axe", "Ancient Apparition", "Alchemist", "Abaddon", "Arc Warden"],
         "B": ["Bane", "Bloodseeker", "Beastmaster", "Broodmother", "Bounty Hunter", "Batrider", "Brewmaster", "Bristleback"],
         "C": ["Crystal Maiden", "Clockwerk", "Clinkz", "Chen", "Chaos Knight", "Centaur Warrunner"],
         "D": ["Drow Ranger", "Death Prophet", "Dragon Knight", "Dazzle", "Dark Seer", "Doom", "Disruptor"],
         "E": ["Earthshaker", "Enigma", "Enchantress", "Elder Titan", "Ember Spirit", "Earth Spirit"],
         "F": ["Faceless Void"],
         "G": ["Gyrocopter"],
         "H": ["Huskar"],
         "I": ["Invoker", "Io"],
         "J": ["Juggernaut", "Jakiro"],
         "K": ["Kunkka", "Keeper of the Light"],
         "L": ["Lina", "Lich", "Lion", "Luna", "Leshrac", "Lifestealer", "Lycan", "Lone Druid", "Legion Commander"],
         "M": ["Mirana", "Morphling", "Meepo", "Medusa", "Magnus"],
         "N": ["Necrophos", "Nature", "Night Stalker", "Nyx Assassin", "Naga Siren"],
         "O": ["Omniknight", "Outworld Devourer", "Ogre Magi", "Oracle"],
         "P": ["Phantom Lancer", "Puck", "Pudge", "Phantom Assassin", "Pugna", "Phoenix"],
         "Q": ["Queen of Pain"],
         "R": ["Razor", "Riki", "Rubick"],
         "S": ["Shadow Fiend", "Sand King", "Storm Spirit", "Sven", "Shadow Shaman", "Slardar", "Sniper", "Spectre", "Spirit Breaker", "Silencer", "Shadow Demon", "Slark", "Skywrath Mage"],
         "T": ["Tiny", "Tidehunter", "Tinker", "Templar Assassin", "Treant Protector", "Troll Warlord", "Timbersaw", "Tusk", "Terrorblade", "Techies"],
         "U": ["Ursa", "Undying"],
         "V": ["Vengeful Spirit", "Venomancer", "Viper", "Visage"],
         "W": ["Windranger", "Witch Doctor", "Warlock", "Wraith King", "Weaver", "Winter Wyvern"],
         "Z": ["Zeus"],
    ]
    
    var heroKeyArray:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        heroKeyArray = Array(heroes.keys).sorted()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return heroKeyArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (heroes[heroKeyArray[section]]!.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pee", for: indexPath)

        // Configure the cell...
        print(indexPath.section)
        let heroValues = heroes[heroKeyArray[indexPath.section]]
        cell.textLabel?.text = heroValues?[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return heroKeyArray[section]
    }
    
 
  
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
