//
//  PostTableViewCell.swift
//  frmU
//
//  Created by Grace Lei on 3/24/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var partyName: UILabel!
    
    
    @IBOutlet weak var hostImage: UIImageView!
    
    @IBOutlet weak var hostName: UILabel!
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var partyTime: UICollectionView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func joinButtonPressed(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
