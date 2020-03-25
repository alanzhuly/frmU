//
//  Account.swift
//  frmU
//
//  Created by Lingyue Zhu on 3/24/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import Foundation
import UIKit

struct User {
    //Get username from Google account Name?
    //name to display on virtual parties.
    var username: String
    //posts are each users' post in a list of posts.
    //The virtual parties interface will access this later.
    var profilePic: UIImage?
    var posts: [Post]
    //each account has an uid.
    var uid: String?
    //friends be list of uids.
    var friends: [String]
}
