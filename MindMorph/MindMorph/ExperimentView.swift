//
//  ExperimentView.swift
//  MindMorph
//
//  Created by Aman Gupta on 10/02/24.
//

import SwiftUI

struct ExperimentView: View {
    let controller = ViewController()
    @StateObject var vm = CodeViewModel()
    var body: some View {
        SplitView{
            CodeView()
                .environmentObject(vm)
            BrainModelView()
        }
        
    }
}

#Preview {
    ExperimentView()
}
