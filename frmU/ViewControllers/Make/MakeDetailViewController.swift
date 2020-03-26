//
//  MakeDetailViewController.swift
//  frmU
//
//  Created by Lingyue Zhu on 3/25/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import UIKit

class MakeDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var refresher: UIRefreshControl!
    
    //initialize variable for this Post instance.
    
    //send type and image from segue
    var type = ""
    var image = UIImage()
    
    var myTitle = "default"
    var location = ""
    var changeDate : Date = Date()
    
    //taken care by choosing date
    var date : [Date] = []
    var user = globalUser.username
    var userImage = globalUser.profilePic
    var myDescription = ""
    
    
    //Date TextField
    @IBOutlet weak var dateTextField: UITextField!
    private var datePicker: UIDatePicker?

    @IBOutlet weak var dateTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTableView.dataSource = self
        dateTableView.delegate = self
        //Choose Date Actions
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(MakeDetailViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        //Tap the screen so that the choose date view go away.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MakeDetailViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        dateTextField.inputView = datePicker
        // Do any additional setup after loading the view.
    }
    
    //objc functions for selector above
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //objc functions for selector above
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy HH:mm"
        dateFormatter.timeZone = NSTimeZone(name: "Pacific Daylight Time") as TimeZone?
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        changeDate = datePicker.date
        view.endEditing(true)
    }
    
    //add Date button:
    // 1. add date to Posts
    // 2. refresh TableView
    @IBAction func addDate(_ sender: Any) {
        date.append(changeDate)
        print(changeDate)
        dateTableView.reloadData()
    }
    //Table View to display chosen dates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return date.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy HH:mm"
        dateFormatter.timeZone = NSTimeZone(name: "Pacific Daylight Time") as TimeZone?
        if let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell") as? ChooseDateTableViewCell {
            if date.count == 0 {
                return UITableViewCell()
            }
            let chosen = date[index]
            cell.chosenDate.text = dateFormatter.string(from: chosen)
            return cell
        }
        return UITableViewCell()
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
