//
//  EmptyState.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 06/01/24.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("empty")
                    .resizable()
                    .scaledToFit()
                    .frame(height:150)
                Text("You have no orders in your order. \nPlease add an appetizer!")
                    .font(.title3)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 20)
            }
            
        }
    }
}

#Preview {
    EmptyState()
}
