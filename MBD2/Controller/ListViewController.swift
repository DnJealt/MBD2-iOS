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
    
    let dummyArray = ["kaas", "giratina", "Palkia", "Joost"]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PokemonCell", forIndexPath: indexPath) as! PokemonCell
        
        let dummyString = dummyArray[indexPath.row]
        
        cell.nameLabel.text = dummyString
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyArray.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

