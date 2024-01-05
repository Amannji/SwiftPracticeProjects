//
//  AppetizerListView.swift
//  AppetizerTemp
//
//  Created by Aman Gupta on 05/01/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                    AppetizerListCellView(appetizer: appetizer)
                    
                }
                .navigationTitle("Appetizers")
            }
            .onAppear{
                viewModel.listAppetizer()
            }
            if viewModel.isLoading{
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
            
        }
    }
    
    
}

#Preview {
    AppetizerListView()
}
