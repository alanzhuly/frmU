//
//  LoginViewController.swift
//  frmU
//
//  Created by Lingyue Zhu on 3/25/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase
import FirebaseFirestore

//for the first page.
class LoginViewController: UIViewController{
    @IBOutlet weak var signInButton: GIDSignInButton!

    @IBOutlet weak var welcome: UILabel!
    
    //firebase
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func googleSignInPressed(_ sender: Any) {
//        GIDSignIn.sharedInstance()?.signIn()
//    }
//

    @IBAction func logIn(_ sender: Any) {
        if (signedIn == false) {
            welcome.text = "Sign In With Google First!"
            welcome.reloadInputViews()
        } else {
            self.getUser()
//            globalUser.createNewUser()
            performSegue(withIdentifier: "logIn", sender: sender)
        }
    }
    
       //helper:
        //change Post to dictionary to store in firebase.
        func post2dic(post: Post) -> [String : Any] {
            var dictionary : [String : Any] = [:]
            dictionary.updateValue(post.type, forKey: "type")
            dictionary.updateValue(post.title, forKey: "title")
            dictionary.updateValue(post.location, forKey: "location")
            dictionary.updateValue(post.date, forKey: "date")
            dictionary.updateValue(post.user, forKey: "user")
            //get post's image's uuid when add.
    //        dictionary.updateValue(<#T##value: [String]##[String]#>, forKey: "image")
            //get userImage's uuid when add.
    //        dictionary.updateValue(<#T##value: [String]##[String]#>, forKey: "userImage")
            dictionary.updateValue(post.description, forKey: "description")
            return dictionary
        }
        
        //helper change post list to a list of dictionaries.
        func postlist2dic (posts: [Post]) -> [[String : Any]] {
            var listOfDictionary: [[String : Any]] = []
            for each in posts {
                listOfDictionary.append(post2dic(post: each))
            }
            print("reached 99")
            return listOfDictionary
        }
        
        //helper: change dictionary back to post with correct image.
        func dic2post(dictionary: [String : [String]]) {
            
        }
    
    func convertTypeToHostedPosts (posts: [String : [Post]]) -> [String : [[String: Any]]] {
        var dictionary: [String : [[String: Any]]] = [:]
        for (type, listPost) in posts {
            dictionary.updateValue(postlist2dic(posts: listPost), forKey: type)
        }
        return dictionary
    }
        
        func createNewUser() {
    //        globalUser = User(username: globalUSERNAME, profilePic: UIImage(named: "Alan"), uid: globalUID, friends: [], typeToPosts: [String : [Post]](), postsHosted: [], postsJoined: [])
            //above for real app
            //for testing, use fake user below
            globalUser = Alan
            let typeTHP: [String : [[String: Any]]] = convertTypeToHostedPosts(posts: globalUser.typeToHostedPosts)
            
            //add profilePic later.
            //add myFriendSpace later, now default it to something.
            let data: [String: Any] = [
                "username": globalUser.username, "uid": globalUser.uid, "friends": globalUser.friends,
                "typeToHostedPosts": typeTHP, "postsHosted": postlist2dic(posts: globalUser.postsHosted), "postsJoined": postlist2dic(posts: globalUser.postsJoined)]
            var ref: DocumentReference? = nil
            ref = db.collection("Users").addDocument(data: data) {err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
            print("reached 01")
            
        }
        //Create User if not created in the table.
        //Get user from the user table if the user is in the table.
        func getUser() {
            
            //Fetch the User with the globalUID
            print(globalUID)
            let userDocument = db.collection("Users").whereField("uid", isEqualTo: globalUID)
            userDocument.getDocuments { (userQuerySnap, error) in
                
                if let error = error {
                    print("Error: \(error)")
                    return
                } else {
                    
                    //count the no. of documents returned
                    guard let queryCount = userQuerySnap?.documents.count else {
                        return
                    }
                    
                    if queryCount == 0 {
                        //If documents count is zero that means there is no User available and we need to create a new instance of this user with the globalUID and globalUSERNAME.
                        self.createNewUser()
                    }
                    
                }
                
            }
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
