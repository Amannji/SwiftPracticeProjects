//
//  AppetizerListView.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 04/01/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    @State var isShowingDetail: Bool = false
    @State var selectedAppetizer: Appetizer?
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            self.selectedAppetizer = appetizer
                            isShowingDetail = true
                        }
                    
                }
                .listStyle(.plain)
                
                
                
                .navigationTitle("Appetizers")
                .disabled(isShowingDetail)
                
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            .blur(radius: isShowingDetail ?  20 : 0)
            
            
            if isShowingDetail{
                
                AppetizerDetailView(appetizer: selectedAppetizer!, isShowingDetail: $isShowingDetail)
            }
            
            if viewModel.isLoading{
                LoadingView()
            }
            
        }
        
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(
                title:alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton)
            
            
    }
    }
    
    
}

#Preview {
    AppetizerListView()
}
