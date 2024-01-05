//
//  Alert.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 04/01/24.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
}


struct AlertContext{
    // Mark - Network Errors
    
    static let invalidData = AlertItem(title:Text("Server Error"), message:Text("Please contact the support"), dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title:Text("Server Error"), message:Text("Please contact the support"), dismissButton: .default(Text("OK")))
    static let invalidURL = AlertItem(title:Text("Server Error"), message:Text("Please contact the support"), dismissButton: .default(Text("OK")))
    static let unableToDetect = AlertItem(title:Text("Server Error"), message:Text("Please contact the support"), dismissButton: .default(Text("OK")))
    
    //Mark - Account Error
    static let invalidForm = AlertItem(title:Text("Invalid Form"), message:Text("Your account details are invalid"), dismissButton: .default(Text("OK")))
    static let invalidEmail = AlertItem(title:Text("Invalid Email"), message:Text("Your Email is invalid"), dismissButton: .default(Text("OK")))
    static let userSavedSuccessfully = AlertItem(title:Text("User saved Successfully!"), message:Text("Congrats!!"), dismissButton: .default(Text("OK")))
    static let invalidUser = AlertItem(title:Text("Invalid User"), message:Text("Something is wrong."), dismissButton: .default(Text("OK")))
    
    
}
