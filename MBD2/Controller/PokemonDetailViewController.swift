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
    @IBOutlet var addToFavoritesButton: UIButton!
    
    var fromFavorites: Bool = false
    
    
    
    @IBAction func backButtonPressed() {
        if(fromFavorites){
            self.performSegueWithIdentifier("backToFavorites", sender: nil)
        }
        else{
            self.performSegueWithIdentifier("backToPokedex", sender: nil)
        }
        
    }
    
    
    @IBAction func addToFavorites() {
        addToFavoritesButton.hidden = true;
        
        utility.appendToArray("Favorites", item: currentPokemon)
    }
    
    ///This function checks if the pokemon is already in the favorites, so it cannot be added twice
    private func checkFavorites(){
        if(utility.containsName("Favorites", item: currentPokemon)){
            addToFavoritesButton.hidden = true;
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkFavorites()
        
        capitalizeFirstLetter(&currentPokemon)
        PokemonLabel.text = currentPokemon

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
