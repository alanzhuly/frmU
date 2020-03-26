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
    
    
    // testing
    let eventsHosted = ["CS170 HW Party", "Movie night", "Casino night", "Board game", "Virtual lunch", "Interview prep"]
    let eventsHostedDate = ["3/23 9pm", "3/22 3pm", "3/22 5pm", "4/23 8pm", "3/23 9pm", "4/23 9pm"]
    
    let eventsJoined = ["Math54 HW Party", "Film night", "Casino night", "Shopping together", "Virtual dinner", "Interview prep", "Resume Critique"]
    let eventsJoinedDate = ["3/23 9pm", "3/22 3pm", "3/22 5pm", "4/23 8pm", "3/23 9pm", "4/23 9pm", "4/23 9pm"]
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBAction func addFriendsButtonPressed(_ sender: Any) {
    }
    
    @IBAction func myFriendsButtonPressed(_ sender: Any) {
    }
    
    @IBOutlet weak var eventsHostedTableView: UITableView!
    
    
    @IBOutlet weak var eventsJoinedTableView: UITableView!
    
    
    @IBAction func finalizeButtonPressed(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        self.profileImage.image = Grace.profilePic
        super.viewDidLoad()

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
            return eventsHosted.count
        } else {
            return eventsJoined.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellToReturn = UITableViewCell()
        switch tableView {
        case eventsJoinedTableView:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "eventsJoinedCell", for: indexPath) as? EventsJoinedTableViewCell {
                 let index = indexPath.item
                cell.partyNameLabel.text = eventsJoined[index]
                cell.partyTimeLabel.text = eventsJoinedDate[index]
                cellToReturn = cell
                }
            
        case eventsHostedTableView:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "eventsHostedCell", for: indexPath) as? EventsHostedTableViewCell {
                     let index = indexPath.item
                    cell.partyNameLabel.text = eventsHosted[index]
                    cell.partyTimeLabel.text = eventsHostedDate[index]
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
