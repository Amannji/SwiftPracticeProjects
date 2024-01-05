//
//  AccountViewModel.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 05/01/24.
//

import SwiftUI

final class AccountViewModel:ObservableObject{

    @AppStorage("user") private var userData: Data?
    @Published var user = User()
@Published var alertItem: AlertItem?
    
    func saveChanges(){
        guard isValidForm else {return }
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSavedSuccessfully
        }
        catch{
            alertItem = AlertContext.invalidUser
        }
        
    }
    
    func retreiveChange(){
        guard let userData = userData else {return}
        do{
            user =  try JSONDecoder().decode(User.self, from: userData)
            
        }
        catch{
            alertItem = AlertContext.invalidUser
        }
    }
    
    
    
        
    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else{
            self.alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else{
            self.alertItem  = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
   
}
