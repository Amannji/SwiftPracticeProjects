//
//  Order.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 07/01/24.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items:[Appetizer] = []
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    var totalPrice: Double{
        items.reduce(0){$0 + $1.price}
    }
}
