//
//  PokemonDetailViewController.swift
//  MBD2
//
//  Created by Jelte van Tartwijk on 10/04/16.
//  Copyright © 2016 Jelte van Tartwijk. All rights reserved.
//

import UIKit

class PokemonDetailViewController: BaseViewController {
    
    var currentPokemon: String = "null"
    
    @IBOutlet var PokemonLabel: UILabel!
    
    
    @IBAction func addToFavorites() {
        
        utility.appendToArray("Favorites", item: currentPokemon)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PokemonLabel.text = currentPokemon

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
