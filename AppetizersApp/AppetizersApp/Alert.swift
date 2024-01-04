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
    static let invalidData = AlertItem(title:Text("Server Error"), message:Text("Please contact the support"), dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title:Text("Server Error"), message:Text("Please contact the support"), dismissButton: .default(Text("OK")))
    static let invalidURL = AlertItem(title:Text("Server Error"), message:Text("Please contact the support"), dismissButton: .default(Text("OK")))
    static let unableToDetect = AlertItem(title:Text("Server Error"), message:Text("Please contact the support"), dismissButton: .default(Text("OK")))
}
