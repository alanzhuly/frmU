//
//  CreatePartyTypeViewController.swift
//  frmU
//
//  Created by Grace Lei on 3/25/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import UIKit

class CreatePartyTypeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let emojis = ["💤", "💯", "🎬", "🏠", "📝", "🎮"]
    let partyTypes = ["CS170", "Toppa", "Movies", "Unit1", "Math", "Games"]
    
    var imagePickerController: UIImagePickerController!
    
    var chosenPartyType:String?
    
    @IBOutlet weak var partyTypeCollectionView: UICollectionView!
    
    @IBOutlet weak var imageLabel: UIImageView!
    
   
    @IBAction func fromCameraButtonPressed(_ sender: Any) {
        self.imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func fromPhotosButtonPressed(_ sender: Any) {
        self.imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func toPartyDetailsView(_ sender: UIButton) {
        performSegue(withIdentifier: "createToDetails", sender: sender)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        partyTypeCollectionView.delegate = self
        partyTypeCollectionView.dataSource = self
        
        self.imagePickerController = UIImagePickerController()
         self.imagePickerController.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if let identifier = segue.identifier {
            if identifier == "createToDetails" {
             if let dest = segue.destination as? MakeDetailViewController {
                 dest.image = self.imageLabel.image
                 dest.type = self.chosenPartyType ?? ""
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return partyTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "partyTypeCell", for: indexPath) as? PartyTypeCollectionViewCell {
            chosenPartyType = partyTypes[index]
            cell.emojiLabel.text = emojis[index]
            cell.typeNameLabel.text = partyTypes[index]
            cell.typeBackgroundLabel .layer.cornerRadius = cell.typeBackgroundLabel.frame.width / 2
            cell.typeBackgroundLabel.layer.borderWidth = 3
                                  cell.typeBackgroundLabel.layer.masksToBounds = false
           return cell
        }
        return UICollectionViewCell()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let index = indexPath.item
        let ima = emojis[index].image()
        imageLabel.image = ima
       }
}

// helper function to convert emoji to image
extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 40, height: 25)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.white.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 20)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension CreatePartyTypeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let ima = info[.originalImage] as? UIImage {
            self.imageLabel.image = ima
            
        }
        imagePickerController.dismiss(animated: true, completion: nil)
    }
}
