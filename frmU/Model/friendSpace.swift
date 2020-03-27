//
//  friendSpace.swift
//  frmU
//
//  Created by Lingyue Zhu on 3/26/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import Foundation
import UIKit

class friendSpace {
    
    //uid of this friendSpace. In "Your Friends" Friend space, the uid is globalUser.uid
    var uid: String
    //name of this friendSpace
    var name: String
    //Users in this friendSpace
    var people: [String]
    //Posts in this friendSpace
    //still store posts with each User.typeToHostedPosts
    var posts: [Post] = []
    //image of this friendSpace
    var image: UIImage?

    init(uid: String, name: String, people: [String], posts: [Post], image: UIImage?) {
        self.uid = uid
        self.image = image
        self.name = name
        self.people = people
    }
    
    func addPost(post: Post) {
        posts.append(post)
    }
    //take in user's ID and add it to this friendSpace's user list.
    func addPeople (userID: String) {
        people.append(userID)
    }
    //Fill friendSpace.posts with all the posts from its Users
    func getPosts () {
        //if in "Your Friends", iterate through each People's "Your Friends Space" and get their posts.
        //else, iterate through each People's typeToHostedPosts, and check for the type if it is there getPost.
        
        
    }
    
    
}
