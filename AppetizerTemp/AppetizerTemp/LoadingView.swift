//
//  LoadingView.swift
//  AppetizerTemp
//
//  Created by Aman Gupta on 05/01/24.
//

import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable{
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        return
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor(.brandPrimaryColor)
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
}

struct LoadingView: View{
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ActivityIndicator()
        }
        
    }
}
