//
//  FirstViewController.swift
//  Simpsons Character Viewer
//
//  Created by Isai Yepez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func Favorite(_ sender: UIButton) {
        var isFavorited: Bool = true
        
        
        if isFavorited == true {
            favoriteButton.setImage(UIImage(imageLiteralResourceName: "favoriteOn"), for: .normal)
            isFavorited = false
        }
        else {
            favoriteButton.setImage(UIImage(imageLiteralResourceName: "favoriteOff"), for: .normal)
            isFavorited = true
        }
        print("Favorited!")
    }
    


}

