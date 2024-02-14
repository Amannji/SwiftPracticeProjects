//
//  ExperimentView.swift
//  MindMorph
//
//  Created by Aman Gupta on 10/02/24.
//

import SwiftUI

struct ExperimentView: View {
    let controller = ViewController()
    var body: some View {
        SplitView{
            MorphCodeView()
            BrainModelView()
                .onAppear{
                    controller.start()
                }
        }
        
    }
}

#Preview {
    ExperimentView()
}
