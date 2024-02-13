//
//  ExperimentView.swift
//  MindMorph
//
//  Created by Aman Gupta on 10/02/24.
//

import SwiftUI

struct ExperimentView: View {
    var body: some View {
        SplitView{
            MorphCodeView()
                
            BrainModelView()
        }
        
    }
}

#Preview {
    ExperimentView()
}
