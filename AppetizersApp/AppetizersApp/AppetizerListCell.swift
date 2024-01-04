//
//  AppetizerListCell.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 04/01/24.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer: Appetizer
    var body: some View {
        HStack{
            Image("steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                
            }
            .padding(.leading, 20)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
