//
//  APButton.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 05/01/24.
//

import SwiftUI

struct APButton: View {
    var title: Text
    var body: some View {
        Button{
            
        }
    label:{
            title
            .font(.title2)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.brandPrimary)
            .cornerRadius(10)
            .foregroundColor(.white)
            .padding(.horizontal,40)
            
        }
        
    }
}

#Preview {
    APButton(title: Text("Hello"))
}
