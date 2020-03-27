//
//  Account.swift
//  frmU
//
//  Created by Lingyue Zhu on 3/24/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore


class User {
    //Get username from Google account Name?
    //name to display on virtual parties.
    var username: String
    //posts are each users' post in a list of posts.
    //The virtual parties interface will access this later.
    var profilePic: UIImage?
    
    //each account has an uid.
    var uid: String
    //friends be list of uids.
    var friends: [String]
    
    // Map post categories to corresponding hosted posts.
    // If the post
    // Store posts here.
    var typeToHostedPosts: [String : [Post]]
    
    var postsHosted: [Post]
    
    var postsJoined: [Post]
    
    var myFriendSpace: [friendSpace]
    
    init(username: String, profilePic: UIImage?, uid: String, friends: [String], typeToPosts: [String : [Post]], postsHosted: [Post], postsJoined: [Post]) {
        self.username = username
        self.profilePic = profilePic
        self.uid = uid
        self.friends = friends
        self.typeToHostedPosts = typeToPosts
        self.postsHosted = postsHosted
        self.postsJoined = postsJoined
        self.myFriendSpace = [friendSpace(uid: self.uid, name: self.username, people: self.friends, image: self.profilePic)]
    }
    
    func changeUsername(newName : String) {
        
        
    }
    
    func addPostsToType(post : Post) {
        
    }
    
    // return friends of self
    func getFriends() -> [User] {
        if uid == "12AB" {
            return [Grace]
        } else if uid == "99BA" {
            return [Alan]
        }
        return []
    }
    
    // return all posts of given type
    func allPostsOfType(type: String) -> [Post] {
        var posts : [Post] = []
        if let p = self.typeToHostedPosts[type] {
            for i in p {
                posts.append(i)
            }
        }

        for f in getFriends() {
            if let p = f.typeToHostedPosts[type] {
                for i in p {
                    posts.append(i)
                }
            }
        }
        return posts
    }
    
    //update user's information to the hashtable
    //access
    func updateUser() {
        
    }
}
