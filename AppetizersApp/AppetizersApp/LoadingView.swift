//
//  LoadingView.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 04/01/24.
//

import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimaryColor
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
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
