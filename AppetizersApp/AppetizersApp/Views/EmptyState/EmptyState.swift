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
                Text("Default message")
                    .font(.title3)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyState()
}
