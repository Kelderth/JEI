//
//  CharacterCollectionViewCell.swift
//  The Wire Character Viewer
//
//  Created by MCS on 2/10/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(text: String){
        let imageName = UIImage(named: "imagenotavailable")
        self.characterImageView.image = imageName
        self.characterNameLabel.text = text
    }

}
