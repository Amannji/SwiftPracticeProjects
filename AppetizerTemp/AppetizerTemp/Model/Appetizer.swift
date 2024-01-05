//
//  Appetizer.swift
//  AppetizerTemp
//
//  Created by Aman Gupta on 05/01/24.
//

import Foundation


struct Appetizer:Identifiable, Decodable{
    let id: Int
    let protein: Int
    let name: String
    let calories: Int
    let price: Double
    let imageURL: String
    let description: String
    let carbs:Int
}

struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}


struct MockData{
    static let sampleAppetizer = Appetizer(id: 001, protein: 100, name: "Sameple Palette", calories: 100, price: 999, imageURL: "", description: "Something really tasty", carbs: 100)
    static let appetizers = [sampleAppetizer,sampleAppetizer, sampleAppetizer]
}


