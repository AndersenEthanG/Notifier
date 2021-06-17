//
//  ViewController.swift
//  Notifier
//
//  Created by Ethan Andersen on 6/17/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var bodyField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationFunctions.requestPermission()
    }


    // MARK: - Functions
    @IBAction func inAppNotifyBtn(_ sender: Any) {
        NotificationFunctions.addInAppNotification(title: titleField.text ?? "Default Title", body: bodyField.text ?? "Default Body")
    } // End of Function inAppNotify
    
    @IBAction func timedNotifyBtn(_ sender: Any) {
        NotificationFunctions.addTimedNotification(title: titleField.text ?? "Default Title", body: bodyField.text ?? "Default Body", timeDelay: 5)
        print("Timed Notify Button Pressed!")
    } // End of Function timedNotifyBtn
    
    
} // End of Class ViewController

