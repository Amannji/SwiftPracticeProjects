//
//  AppetizerListViewModel.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 04/01/24.
//

import Foundation
import SwiftUI

final class AppetizerListViewModel: ObservableObject{
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    @Published var isLoading:Bool = false
    
    
    func getAppetizers() {
        self.isLoading = true
        NetworkManager.shared.getAppetizer{ [self] result in
            DispatchQueue.main.async{
                self.isLoading = false
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error{
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToDetect:
                        alertItem = AlertContext.unableToDetect
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    }
                }
            }
            
        }
    }
    
}
