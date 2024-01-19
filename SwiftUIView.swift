//
//  SwiftUIView.swift
//  
//
//  Created by Aman Gupta on 18/01/24.
//

import SwiftUI

struct CarouselSliderView: View {
    let titles = ["Title 1", "Title 2", "Title 3", "Title 4", "Title 5"]
    @State private var currentIndex: Int = 0
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<titles.count, id: \.self) { index in
                        CarouselCardView(title: titles[index], index: index, currentIndex: $currentIndex)
                    }
                }
                .padding()
            }
            .animation(.easeInOut, value: currentIndex)
            
            Text("Selected Title: \(titles[currentIndex])")
                .padding()
        }
    }
}

struct CarouselCardView: View {
    let title: String
    let index: Int
    @Binding var currentIndex: Int
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.blue)
                .frame(width: 300, height: 200)
                .overlay(
                    Text(title)
                        .foregroundColor(.white)
                        .font(.headline)
                )
                .onTapGesture {
                    withAnimation {
                        currentIndex = index
                    }
                }
        }
    }
}

struct CarouselSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselSliderView()
    }
}
