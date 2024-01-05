//
//  AccountView.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 04/01/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Personal Info")){
                    TextField("First Name",text: $viewModel.firstName)
                    TextField("Last Name",text: $viewModel.lastName)
                    TextField("Email",text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    DatePicker("Birthday", selection: $viewModel.birthdate, displayedComponents: .date)
                    Button{
                        viewModel.saveChanges()
                    }
                label:{
                    Text("Save Changes")
                        .foregroundColor(.brandPrimaryColor)
                }
                    
                }
                
                Section(header:Text("Requests")){
                    Toggle("Extra Napkins",isOn: $viewModel.extraNapkins)
                    Toggle("Frequent Refills",isOn: $viewModel.frequentRefills)
                        
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimaryColor))
               
                
                    
            }
            .navigationTitle("Account")
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(
                title:alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
            
        }
    }
}

#Preview {
    AccountView()
}
