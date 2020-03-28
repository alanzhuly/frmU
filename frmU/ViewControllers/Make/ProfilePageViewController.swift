//
//  ProfilePageViewController.swift
//  frmU
//
//  Created by Grace Lei on 3/25/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class ProfilePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myUsername: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBAction func addFriendsButtonPressed(_ sender: Any) {
        //
    }
    
    @IBAction func myFriendsButtonPressed(_ sender: Any) {
        //
    }
    
    @IBOutlet weak var eventsHostedTableView: UITableView!
    
    
    @IBOutlet weak var eventsJoinedTableView: UITableView!
    
    
    @IBAction func finalizeButtonPressed(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileImage.image = globalUser.profilePic
        myUsername.text = globalUser.username
        eventsHostedTableView.delegate = self
        eventsHostedTableView.dataSource = self
       
        eventsJoinedTableView.delegate = self
        eventsJoinedTableView.dataSource = self
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        eventsHostedTableView.reloadData()
        eventsJoinedTableView.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 300
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == eventsHostedTableView {
            return globalUser.postsHosted.count
        } else {
            return globalUser.postsJoined.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellToReturn = UITableViewCell()
        switch tableView {
        case eventsJoinedTableView:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "eventsJoinedCell", for: indexPath) as? EventsJoinedTableViewCell {
                 let index = indexPath.item
                cell.partyNameLabel.text = globalUser.postsJoined[index].title
                if globalUser.postsJoined[index].date.count == 1 {
                    cell.partyTimeLabel.text = "Time: " +  globalUser.postsJoined[index].date[0][0]
                } else {
                    cell.partyTimeLabel.text = "Time: TBD"
                }
                cellToReturn = cell
                }
            
        case eventsHostedTableView:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "eventsHostedCell", for: indexPath) as? EventsHostedTableViewCell {
                     let index = indexPath.item
                cell.partyNameLabel.text = globalUser.postsHosted[index].title
                if globalUser.postsHosted[index].date.count == 1 {
                    cell.partyTimeLabel.text = "Time: " +  globalUser.postsHosted[index].date[0][0]
                } else {
                    cell.partyTimeLabel.text = "Time: TBD"
                }
                cellToReturn = cell


            }
        default:
            return cellToReturn
        }
        return cellToReturn
    }
    
    @IBAction func logOut(_ sender: Any) {
        print(globalUser.username)
        GIDSignIn.sharedInstance()?.signOut()
        signedIn = false
        performSegue(withIdentifier: "logout", sender: sender)
    }
    
    
    
}
