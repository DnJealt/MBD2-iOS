//
//  BaseViewController.swift
//  MBD2
//
//  Created by Jelte van Tartwijk on 08/04/16.
//  Copyright © 2016 Jelte van Tartwijk. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    let utility = StorageUtility()
    
    
    ///Some magic spells to make the first letter of a String a capital letter. "You're a wizard, Harry" ~ Hagrid
    func capitalizeFirstLetter(inout text: String) -> String {
        let firstLetterOfString = Range(start: text.startIndex,
            end: text.startIndex.advancedBy(1))
        text.replaceRange(firstLetterOfString, with: text.substringWithRange(firstLetterOfString).capitalizedString)
        
        return text;
    }    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
