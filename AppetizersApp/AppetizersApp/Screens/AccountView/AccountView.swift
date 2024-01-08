//
//  AccountView.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 04/01/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusTextField: FocusStateField?
    
    enum FocusStateField{
        case firstName, lastName, email
    }
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Personal Info")){
                    TextField("First Name",text: $viewModel.user.firstName)
                     
                    TextField("Last Name",text: $viewModel.user.lastName)
                     
                    TextField("Email",text: $viewModel.user.email)
    
                        .keyboardType(.emailAddress)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    DatePicker("Birthday", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    Button{
                        viewModel.saveChanges()
                    }
                label:{
                    Text("Save Changes")
                        .foregroundColor(.brandPrimaryColor)
                }
                    
                }
                

                Section(header:Text("Requests")){
                    Toggle("Extra Napkins",isOn: $viewModel.user.extraNapkins)
                        
                    Toggle("Frequent Refills",isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimaryColor))
               
                
               
               
                
                    
            }
            .navigationTitle("Account")
            .onAppear{
                viewModel.retreiveChange()
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
}

#Preview {
    AccountView()
}
