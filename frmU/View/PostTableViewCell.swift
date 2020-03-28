//
//  PostTableViewCell.swift
//  frmU
//
//  Created by Grace Lei on 3/24/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell,  UICollectionViewDelegate, UICollectionViewDataSource {
    
    let times1 = ["3/22 8pm", "3/23 9am", "3/26 4pm", "3/21 10am", "3/19 4pm"]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return times1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath) as? PartyTimeCollectionViewCell {
            cell.partyTimeLabel.text = times1[index]
          cell.timeBackground.layer.cornerRadius = 10
cell.timeBackground.layer.borderWidth = 1
                       cell.timeBackground.layer.masksToBounds = false
            cell.timeBackground.backgroundColor = .yellow
            return cell
        }
        return UICollectionViewCell()
    }
    

    
    
    @IBOutlet weak var partyName: UILabel!
    
    
    @IBOutlet weak var hostImage: UIImageView!
    
    @IBOutlet weak var hostName: UILabel!
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var partyTime: UICollectionView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    

    
    @IBOutlet weak var locationLabel: UILabel!
    
  
    @IBOutlet weak var timeCollectionView: UICollectionView!

//    @IBOutlet weak var joinLabel: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        timeCollectionView.delegate = self
        timeCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }


}
