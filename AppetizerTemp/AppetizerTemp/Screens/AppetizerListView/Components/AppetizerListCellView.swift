//
//  AppetizerListCellView.swift
//  AppetizerTemp
//
//  Created by Aman Gupta on 05/01/24.
//

import SwiftUI

struct AppetizerListCellView: View {
    var appetizer: Appetizer
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString:appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5){
                Text(appetizer.name)
                    .font(.title3)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.f")")
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 20)
            
        }
    }
}

#Preview {
    AppetizerListCellView(appetizer: MockData.sampleAppetizer)
}
