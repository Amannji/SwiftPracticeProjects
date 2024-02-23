//
//  ExperimentView.swift
//  MindMorph
//
//  Created by Aman Gupta on 10/02/24.
//

import SwiftUI

struct ExperimentView: View {
    @State var result: ExperimentResult = ExperimentResult(chemicalchangeFactor: ChemicalLevelsChange(dopamine: 0, serotonin: 0, acetylcholine: 0, gaba: 0, glutamate: 0))
    
    var health:Int = 50
    @State var brain:Brain = Brain(
        dopamine: Amount(0.3),
        serotonin: Amount(0.5),
        acetylcholine: Amount(0.4),
        gaba: Amount(0.6),
        glutamate: Amount(0.3)
    )
    @StateObject var vm: CodeViewModel = CodeViewModel()
    @ObservedObject var scene = SceneConfigurator(sceneName: "Brain.dae")
    @State var blocks:[Action] = []
    @State var selectedTab: Int = 0
    
    var body: some View {
        SplitView{
            CustomTabView(selectedTab: $selectedTab, brain: $brain, result: $result, vm: vm)
            ZStack(alignment:.bottom){
                BrainModelView(sceneConfigurator: scene)
                    .onAppear{
                        scene.start()
                    }
                    .overlay{
                        Text("Brain Health: \(String(format:"%.0f%",brain.brainHealth))%")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .offset(y:-400)
                    }
                //run
                Button(action:{
                    result = run()
                    selectedTab = 1
                }){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.secondary)
                        .frame(width:300, height:100)
                        .overlay{
                            HStack(spacing:10){
                                Image(systemName: "arrowtriangle.right.fill")
                                    .foregroundColor(.white)
                                Text("Run My Code")
                                    .foregroundColor(.white)
                            }
                            .font(.title)
                        }
                }
            }
                
        }
        .onReceive(vm.$blocks){ receivedBlocks in
                    self.blocks = receivedBlocks
                }
        
    }
    
    private func run()->ExperimentResult{
        
        for block in blocks{

            if block.chemicalChange.dopamine != 0 {
                let rr = brain.dopamine.calculate(block.chemicalChange.dopamine)
                if rr.hasChanged{
                    result.chemicalchangeFactor.dopamine += block.chemicalChange.dopamine
                }
            }
            
            if block.chemicalChange.acetylcholine != 0 {
                let rr = brain.acetylcholine.calculate(block.chemicalChange.acetylcholine)
                if rr.hasChanged{
                    result.chemicalchangeFactor.acetylcholine += block.chemicalChange.acetylcholine
                }
            }
            
            if block.chemicalChange.serotonin != 0 {
                let rr = brain.serotonin.calculate(block.chemicalChange.serotonin)
                if rr.hasChanged{
                    result.chemicalchangeFactor.serotonin += block.chemicalChange.serotonin
                }
            }
            
            if block.chemicalChange.gaba != 0 {
                let rr = brain.gaba.calculate(block.chemicalChange.gaba)
                if rr.hasChanged{
                    result.chemicalchangeFactor.gaba += block.chemicalChange.gaba
                }
            }
            if block.chemicalChange.glutamate != 0 {
                let rr = brain.glutamate.calculate(block.chemicalChange.glutamate)
                if rr.hasChanged{
                    result.chemicalchangeFactor.glutamate += block.chemicalChange.glutamate
                }
            }
        }
        return result
    }
}

#Preview {
    ExperimentView()
}
