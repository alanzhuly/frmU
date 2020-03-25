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
let alanPost = Post(type: "CS170", title: "CS170 HW Party" , location: "Zoom", date: [Date()], image: UIImage(named: "hw"), user: "alan", userImage: UIImage(named: "alan"), description: "cs170 MT study yes")

let lucyPost = Post(type: "Berkeley", title: "movie Party" , location: "Google Hangout", date: [Date()], image: UIImage(named: "movies"), user: "lucy", userImage: UIImage(named: "lucy"), description: "ZOOM Cinema")
let gracePost = Post(type: "Unit1", title: "game night" , location: "Google Hangout", date: [Date()], image: UIImage(named: "game"), user: "grace", userImage: UIImage(named: "grace"), description: "lets have fun gaming")



var Grace = User(username: "grace", profilePic: UIImage(named: "grace"), uid: "99BA", friends: ["12AB"], typeToPosts:["Unit 1" : [gracePost]], postsHosted: [gracePost], postsJoined: [alanPost, lucyPost])

var Alan = User(username: "alan", profilePic: UIImage(named: "alan"), uid: "12AB", friends: ["99BA"], typeToPosts: ["CS170" : [alanPost]], postsHosted: [alanPost], postsJoined: [gracePost])



//construct fake user Grace fro testing.

class virtualParties {
    var currentUser: User!
    var allPosts: [Post] = []

    
    init() {
        currentUser = Grace
        for p in Grace.postsHosted {
            allPosts.append(p)
        }
        for p in Grace.postsJoined {
            allPosts.append(p)
        }
    }
    
    func addPost(post: Post) {
        allPosts.append(post)
    }

    
    
}
