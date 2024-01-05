//
//  AccountViewModel.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 05/01/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject{
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    @Published var birthdate = Date()
    @Published var alertItem: AlertItem?
    
        
    var isValidForm: Bool{
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else{
            self.alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else{
            self.alertItem  = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {return }
        print("Changes have been saved successfully!!")
        
    }
}
