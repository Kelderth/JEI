//
//  FavoriteTableViewCell.swift
//  The Wire Character Viewer
//
//  Created by MCS on 2/10/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(image: UIImage, text: String) {
        self.characterImageView.image = image
        self.characterNameLabel.text = text
    }
}
