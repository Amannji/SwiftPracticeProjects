//
//  Alert.swift
//  AppetizerTemp
//
//  Created by Aman Gupta on 05/01/24.
//

import Foundation
import SwiftUI

struct AlertItem:Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext{
    static let invalidData = AlertItem(title:Text("Server Error"),message:Text("Something is so wrong"), dismissButton:.default(Text("OK")))
    static let invalidResponse = AlertItem(title:Text("Server Error"),message:Text("Something is so wrong"), dismissButton:.default(Text("OK")))
    static let invalidURL = AlertItem(title:Text("Server Error"),message:Text("Something is so wrong"), dismissButton:.default(Text("OK")))
    static let unableToDetect = AlertItem(title:Text("Server Error"),message:Text("Something is so wrong"), dismissButton:.default(Text("OK")))
    
}
