//
//  ViewController.swift
//  MBD2
//
//  Created by Jelte van Tartwijk on 21/03/16.
//  Copyright © 2016 Jelte van Tartwijk. All rights reserved.
//

import UIKit

class ListViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var PokemonListView: UITableView!
    
    var pokemonList: [String] = []
    
    
    private func fetchPokemonList(){
        activityIndicator.startAnimating()
        
        RequestHandler.sendGetRequest(
            "http://pokeapi.co/api/v2/pokedex/1", // Only Kanto for now.
            result: { (result: PokeListResult) -> Void in
                self.fillTableView(result.getAllNames())

            }) { (error) -> Void in
                print("Error: \(error.localizedDescription)")
                self.activityIndicator.stopAnimating()
        }
    }
    
    func fillTableView(names: [String]) {
        // Reduces the loading times by about 95%.
        dispatch_async(dispatch_get_main_queue(), {
            self.pokemonList = names
            self.PokemonListView.reloadData()
            self.activityIndicator.stopAnimating()
        })
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PokemonCell", forIndexPath: indexPath) as! PokemonCell
        
        let name = pokemonList[indexPath.row]    
        
        cell.nameLabel.text = name
        
        // Set the tag of the cell, so it can be identified later
        cell.tag = indexPath.row
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! PokemonCell
        print(cell.nameLabel.text)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPokemonList()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

