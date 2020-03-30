//
//  VirtualPartyViewController.swift
//  frmU
//
//  Created by Grace Lei on 3/24/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import UIKit

class VirtualPartyViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    var selectedType: friendSpace = globalUser.myFriendSpace[0]
    var selectedPost:Post?
    
    @IBOutlet weak var typeCollectionView: UICollectionView!
    
    
    @IBOutlet weak var postTableView: UITableView!
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeCollectionView.delegate = self
        typeCollectionView.dataSource = self

        postTableView.delegate = self
        postTableView.dataSource = self
        typeCollectionView.reloadData()
        postTableView.reloadData()
        print("------- Nothing -------------")
        refreshData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        typeCollectionView.reloadData()
        postTableView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("collection view count:")
        print(globalUser.myFriendSpace.count+1)
        return globalUser.myFriendSpace.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item
        if (index == globalUser.myFriendSpace.count) {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "createNewFriendSpaceCell", for: indexPath) as? TypeCollectionViewCell {
                cell.typeLabelTwo.text = "➕"
                cell.typeBackgroundTwo.layer.cornerRadius = cell.typeBackgroundTwo.frame.width / 2
                           cell.typeBackgroundTwo.layer.borderWidth = 3
                           cell.typeBackgroundTwo.layer.masksToBounds = false
                cell.typeBackgroundTwo.backgroundColor = .yellow
                return cell

            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "typeCell", for: indexPath) as? TypeCollectionViewCell {
                cell.typeLabel.text = globalUser.myFriendSpace[index].name
                 cell.typeBackground.layer.cornerRadius = 25
                           cell.typeBackground.layer.borderWidth = 3
                cell.typeBackground.layer.borderColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
                           cell.typeBackground.layer.masksToBounds = false
                cell.typeBackground.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        if (index == globalUser.myFriendSpace.count) {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "createNewFriendSpaceCell", for: indexPath) as? TypeCollectionViewCell {
                performSegue(withIdentifier: "toCreateNewFriendSpace", sender: cell)
            }

        } else {
            selectedType = globalUser.myFriendSpace[index]
            postTableView.reloadData()
            collectionView.reloadData()
            print("SELECTED TYPE")
            print(selectedType.posts.count)
            print(selectedType.uid)
            print(selectedType.name)
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedType.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let postDisplaying = selectedType.posts[index]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell {
            cell.partyName.text = postDisplaying.title
            
            cell.hostImage.image = postDisplaying.userImage
            cell.hostName.text = postDisplaying.user
            cell.postImage.image = postDisplaying.image
            cell.descriptionLabel.text = postDisplaying.description
            cell.locationLabel.text = postDisplaying.location
            
//            cell.joinLabel.tag = index
            
            return cell

        } else {
            return UITableViewCell()
        }
    }

    @IBAction func joinButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toVoteTime", sender: self)
    }
    
    
    
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let index = indexPath.row
//        self.selectedPost = selectedType.posts[index]
//        performSegue(withIdentifier: "toVoteTime", sender: self.selectedPost)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
//           if let identifier = segue.identifier {
//               if identifier == "toVoteTime" {
//                if let dest = segue.destination as? VoteTimeViewController, let but = sender as? UIButton {
//                    dest.postToJoin = selectedType.posts[but.tag]
//                   }
//               }
//           }
//       }
}
