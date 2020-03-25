//
//  PartyData.swift
//  frmU
//
//  Created by Lingyue Zhu on 3/24/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import Foundation
import UIKit


//Create a struck that stores the INFO for each made party.
struct Post {
    //type of the Post.
    var type: String
    // Title to display.
    var title: String
    // a string saying the location
    var location: String
    // List of Data objects in the collection view
    //* If Data pass current Date, delete the event. (new page)
    var date: [Date]
    //image the user uploaded, else default type.
    var image: UIImage?
    //username: Get from User.username
    var user: String
    //profile picture. Get from User.profilePic
    var userImage: UIImage?
    // a string saying the description. Get from User.posts
    var description: String
}

//construct fake user Alan for testing.
let alanPost = Post(type: "CS170", title: "CS170 HW Party" , location: "Zoom", date: [Date()], image: UIImage(named: "grace"), user: "alan", userImage: UIImage(named: "Alan"), description: "cs170 MT study yes")
let lndPost = Post(type: "Berkeley", title: "movie Party" , location: "Google Hangout", date: [Date()], image: UIImage(named: "grace"), user: "alan", userImage: UIImage(named: "Alan"), description: "ZOOM Cinema")
let Alan = User(username: "alan", profilePic: UIImage(named: "Alan"), posts: [alanPost, lndPost], uid: "12AB", friends: ["99BA"])
let Grace = User(username: "grace", profilePic: UIImage(named: "grace"), posts: [], uid: "99BA", friends: ["12AB"])


//construct fake user Grace fro testing.

class virtualParties {
    var posts: [Post]?
    var currentUser: User
    init() {
        currentUser = Grace
        posts = nil
    }
    func getPost(user: User) {
        for i in Alan.posts {
            posts?.append(i)
        }
    }
}
