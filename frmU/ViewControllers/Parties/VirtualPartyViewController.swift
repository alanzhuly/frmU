//
//  VirtualPartyViewController.swift
//  frmU
//
//  Created by Grace Lei on 3/24/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import UIKit

class VirtualPartyViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    var type: String = "CS170"
    
    var vP = virtualParties()
    
    // testing
    let types = ["CS170", "Berkeley", "Unit1", "TOPPA", "DSC", "Stats", "CS61B"]
    let posts = [alanPost, gracePost, lucyPost]
    let users = [Grace, Alan]
    
    @IBOutlet weak var typeCollectionView: UICollectionView!
    
    
    @IBOutlet weak var postTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        typeCollectionView.delegate = self
        typeCollectionView.dataSource = self

        postTableView.delegate = self
        postTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        typeCollectionView.reloadData()
        postTableView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return types.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "typeCell", for: indexPath) as? TypeCollectionViewCell {
            cell.typeLabel.text = types[index]
             cell.typeBackground.layer.cornerRadius = cell.typeBackground.frame.width / 2
                       cell.typeBackground.layer.borderWidth = 3
                       cell.typeBackground.layer.masksToBounds = false
            cell.typeBackground.backgroundColor = .cyan
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        type = types[index]
        postTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vP.allPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let postDisplaying = vP.allPosts[index]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell {
            cell.partyName.text = postDisplaying.title
            cell.hostImage.image = postDisplaying.userImage
            cell.hostName.text = postDisplaying.user
            cell.postImage.image = postDisplaying.image
            cell.descriptionLabel.text = postDisplaying.description
            cell.locationLabel.text = postDisplaying.location
            return cell

        } else {
            return UITableViewCell()
        }
    }

}
