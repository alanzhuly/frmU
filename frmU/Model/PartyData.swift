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
class Post {
    //type is the uid of the workspace the posts belong to.
    var friendSpace: friendSpace
    // Title to display.
    var title: String
    // a string saying the location
    var location: String
    // List of Data objects in the collection view
    //* If Data pass current Date, delete the event. (new page)
    var date: [[String]]
    //image the user uploaded, else default type.
    var image: UIImage?
    //username: Get from User.username
    var user: String
    //profile picture. Get from User.profilePic
    var userImage: UIImage?
    // a string saying the description. Get from User.posts
    var description: String
    
    init(friendSpace: friendSpace, title: String, location: String, date: [[String]], image: UIImage?, user: String, userImage: UIImage?, description: String) {
        self.friendSpace = friendSpace
        self.title = title
        self.location = location
        self.date = date
        self.image = image
        self.user = user
        self.userImage = userImage
        self.description = description
        self.friendSpace.addPost(post: self)
    }
        
    
}




//construct fake user Alan for testing.

//test I can see my Post

let dum = Post(friendSpace: Berkeley, title: "movie Party" , location: "Google Hangout", date: [["2/3 4pm", "1"], ["2/3 5am", "3"], ["2/26 7pm", "2"], ["2/23 3pm", "5"]], image: UIImage(named: "movies"), user: "lucy", userImage: UIImage(named: "lucy"), description: "ZOOM Cinema")

let lucyPost = Post(friendSpace: Berkeley, title: "movie Party" , location: "Google Hangout", date: [["2/3 4pm", "1"], ["2/3 5am", "3"], ["2/26 7pm", "2"], ["2/23 3pm", "5"]], image: UIImage(named: "movies"), user: "lucy", userImage: UIImage(named: "lucy"), description: "ZOOM Cinema")



let gracePost = Post(friendSpace: Unit1, title: "game night" , location: "Google Hangout", date: [["2/3 4pm", "1"], ["2/3 5am", "3"], ["2/26 7pm", "2"], ["2/23 3pm", "5"]], image: UIImage(named: "game"), user: "grace", userImage: UIImage(named: "grace"), description: "lets have fun gaming")
let alanPost = Post(friendSpace: CS170, title: "CS170 HW Party" , location: "Zoom", date: [["2/3 4pm", "1"], ["2/3 5am", "3"], ["2/26 7pm", "2"], ["2/23 3pm", "5"]], image: UIImage(named: "hw"), user: "alan", userImage: UIImage(named: "alan"), description: "cs170 MT study yes")
let pp1 = Post(friendSpace: CS170, title: "CS170 HW Party2" , location: "Zoom", date: [["2/3 4pm", "1"], ["2/3 5am", "3"], ["2/26 7pm", "2"], ["2/23 3pm", "5"]], image: UIImage(named: "hw"), user: "jerry", userImage: UIImage(named: "alan"), description: "cs170 MT study no")

let pp2 = Post(friendSpace: toppa, title: "CS170 HW Party" , location: "Zoom", date:[["2/3 4pm", "1"], ["2/3 5am", "3"], ["2/26 7pm", "2"], ["2/23 3pm", "5"]], image: UIImage(named: "hw"), user: "tom", userImage: UIImage(named: "alan"), description: "cs170 MT study yes")

let pp3 = Post(friendSpace: DSC, title: "CS170 HW Party" , location: "Zoom", date: [["2/3 4pm", "1"], ["2/3 5am", "3"], ["2/26 7pm", "2"], ["2/23 3pm", "5"]], image: UIImage(named: "hw"), user: "amy", userImage: UIImage(named: "alan"), description: "cs170 MT study yes")

let pp4 = Post(friendSpace: blockchain, title: "CS170 HW Party" , location: "Zoom", date: [["2/3 4pm", "1"], ["2/3 5am", "3"], ["2/26 7pm", "2"], ["2/23 3pm", "5"]], image: UIImage(named: "hw"), user: "selina", userImage: UIImage(named: "lucy"), description: "blockchain")



var dum2 = User(username: "grace", profilePic: UIImage(named: "grace"), uid: "99BA", friends: ["12AB"], typeToPosts:["Unit 1" : [gracePost]], postsHosted: [gracePost], postsJoined: [lucyPost])

var Grace = User(username: "grace", profilePic: UIImage(named: "grace"), uid: "grace", friends: ["alan", "selina"], typeToPosts:["Unit 1" : [gracePost]], postsHosted: [gracePost], postsJoined: [lucyPost])

var Alan = User(username: "alan", profilePic: UIImage(named: "Alan"), uid: "alan", friends: ["grace", "tom", "amy", "jerry", "selina"], typeToPosts: ["CS170" : [alanPost]], postsHosted: [alanPost], postsJoined: [gracePost])

var Amy = User(username: "amy", profilePic: UIImage(named: "Alan"), uid: "amy", friends: ["tom", "jerry", "alan"], typeToPosts: ["CS170" : [alanPost]], postsHosted: [pp3], postsJoined: [gracePost])
var Selina = User(username: "selina", profilePic: UIImage(named: "Alan"), uid: "selina", friends: ["tom", "alan"], typeToPosts: ["CS170" : [alanPost]], postsHosted: [pp4], postsJoined: [alanPost])
var Tom = User(username: "tom", profilePic: UIImage(named: "Alan"), uid: "tom", friends: ["alan","selina", "amy"], typeToPosts: ["CS170" : [alanPost]], postsHosted: [pp2], postsJoined: [gracePost])
var Jerry = User(username: "jerry", profilePic: UIImage(named: "Alan"), uid: "jerry", friends: ["alan", "amy"], typeToPosts: ["CS170" : [pp3, pp1]], postsHosted: [pp1], postsJoined: [gracePost])


var CS170 = friendSpace(uid: "cs170", name: "CS170", people: ["alan", "grace"], image: UIImage(named: "cs170"))
var Berkeley = friendSpace(uid: "berkeley", name: "Berkeley", people: ["alan","grace", "amy", "selina", "tom"], image: UIImage(named: "berkeley"))
var Unit1 = friendSpace(uid: "unit1", name: "Unit1", people: ["grace", "selina"], image: UIImage(named: "dorm"))
var DSC = friendSpace(uid: "dsc", name: "DSC", people: ["alan", "tom"], image: UIImage(named: "dsc"))
var Stats = friendSpace(uid: "stats", name: "Stats", people: ["jerry", "amy"], image: UIImage(named: "stats"))
var blockchain = friendSpace(uid: "blockchain", name: "CS61B", people: ["grace", "selina"], image: UIImage(named: "blockchain"))
var toppa = friendSpace(uid: "toppa", name: "toppa", people: ["alan","grace", "amy", "selina", "tom", "jerry"], image: UIImage(named: "toppa"))

//construct fake user Grace fro testing.

//global variable for this User.
var signedIn = false
var globalUser = Alan

//for getUser in User class
//store uid and username to check if the user is already there
var globalUID = ""
var globalUSERNAME = ""
var globalPICURL: URL?

var friendSpacesIn: [friendSpace] = [CS170, Berkeley, Unit1, toppa, DSC, Stats, blockchain]


var vP = virtualParties()


class virtualParties {
    
    var allPosts: [Post] = []
    
    init() {
        for f in globalUser.friends {
            let ff = useridToUser(f)
            for p in ff.postsHosted {
                allPosts.append(p)
            }
            for p in ff.postsJoined {
                allPosts.append(p)
            }
        }
    }
    
    func addPost(post: Post) {
        allPosts.append(post)
    }

    func addFriendSpaces(friendSpace: friendSpace) {
        friendSpacesIn.append(friendSpace)
    }
    
    func useridToUser(_ id: String) -> User {
        let useridToUser = ["grace":Grace, "alan":Alan, "amy": Amy, "selina": Selina, "tom":Tom, "jerry": Jerry]
        return useridToUser[id] ?? dum2
    }
    
    
}
