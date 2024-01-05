//
//  Appetizer.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 04/01/24.
//

import Foundation
struct Appetizer: Decodable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}


struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}


struct MockData {
    static let sampleAppetizer = Appetizer(id: 001, name: "Sample", description: "This is yummmt", price: 999, imageURL:"",calories: 99, protein: 99, carbs: 99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
