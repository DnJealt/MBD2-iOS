//
//  ViewController.swift
//  MBD2
//
//  Created by Jelte van Tartwijk on 21/03/16.
//  Copyright © 2016 Jelte van Tartwijk. All rights reserved.
//

import UIKit

class FavoritesViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var FavoritesListView: UITableView!
    
    var pokemonList: [String] = ["Nothing Here!"]
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FavoriteCell", forIndexPath: indexPath) as! FavoriteCell
        
        var name = pokemonList[indexPath.row]
        
        capitalizeFirstLetter(&name)
        
        cell.nameLabel.text = name
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(pokemonList[indexPath.row])

        self.performSegueWithIdentifier("ToPokemonDetail", sender: pokemonList[indexPath.row])
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ToPokemonDetail"){
            let destination = segue.destinationViewController as! PokemonDetailViewController
            let thisPokemon = sender as! String
            
            destination.currentPokemon = thisPokemon
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        FavoritesListView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch the cached list, getNames returns an array of strings
        let list = utility.getNames("Favorites")
        
        pokemonList = list
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

