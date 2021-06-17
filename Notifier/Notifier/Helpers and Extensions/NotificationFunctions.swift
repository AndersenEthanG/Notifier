//
//  NotificationFunctions.swift
//  Notifier
//
//  Created by Ethan Andersen on 6/17/21.
//

import Foundation
import UserNotifications

class NotificationFunctions {
    
    /// Put this function on the initial viewDidLoad controller
    static func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (accepted, error) in
            if accepted {
                print("User granted permission for notifications")
            } else {
                print("User did not grant permission for notifications... Oh well!?")
            }
        }
        /*
         // Put this line in ithe didFinishLaunchingWithOption function in the AppDelegate
         UNUserNotificationCenter.current().delegate = self
         */
    } // End of Function
    
    
    /// Call this to create a notification
    static func addTimedNotification(title: String, body: String, timeDelay: Int) {
        // Notification center initialization
        let center = UNUserNotificationCenter.current()
        
        // Content assignment
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        // Trigger notification
        let delay = Date().addingTimeInterval(TimeInterval(timeDelay))
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: delay)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Request
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        // Register request
        center.add(request) { (error) in
            if let error = error {
                print("Error in \(#function)\(#line) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    } // End of Function
    
    
    static func addInAppNotification(title: String, body: String) {
        
    } // End of Function
    
    
    func addFirebaseNotification() {
        
        
    } // End of Function
    
} // End of Class NotificationFunctions
