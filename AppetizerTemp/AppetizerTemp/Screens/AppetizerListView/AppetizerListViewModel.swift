//
//  AppetizerListViewModel.swift
//  AppetizerTemp
//
//  Created by Aman Gupta on 05/01/24.
//

import Foundation

final class AppetizerListViewModel: ObservableObject{
    @Published var appetizers:[Appetizer] = []
    @Published var alertItem:AlertItem?
    @Published var isLoading: Bool = false
    
    func listAppetizer(){
        self.isLoading = true
        NetworkManager.shared.getAppetizer {result in
            DispatchQueue.main.async {
                switch result{
                case .success(let result):
                    self.isLoading = false
                    self.appetizers = result
                case .failure(let error):
                    switch error{
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToDetect:
                        self.alertItem = AlertContext.unableToDetect
                        
                    }
                    
                }
                
            }
        }
    }
}
