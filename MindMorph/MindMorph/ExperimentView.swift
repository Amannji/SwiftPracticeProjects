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
    
    @EnvironmentObject var vm: CodeViewModel
    @State var blocks:[Action] = []
    var body: some View {
        SplitView{
            CustomTabView(brain: $brain)
        
            ZStack(alignment:.bottom){
                
                BrainModelView()
                    .overlay{
                        Text("Brain Health: \(health)%")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .offset(y:-400)
                    }
                //run
                Button(action:{
                    result = run()
                    
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
//            var chemicalChanges:[String: BeforeAfterValue] = [:]
//
            if block.chemicalChange.dopamine != 0 {
                let rr = brain.dopamine.calculate(block.chemicalChange.dopamine)
                if rr.hasChanged{
                    result.chemicalchangeFactor.dopamine += block.chemicalChange.dopamine
                }
            }
//            
//            if block.chemicalChange.acetylcholine != 0 {
//                let rr = brain.acetylcholine.calculate(block.chemicalChange.acetylcholine)
//                if rr.hasChanged{
//                    chemicalChanges["acetylocholine"] = rr
//                }
//            }
//            
//            var affectedString = ""
//            for (key,value) in chemicalChanges{
//                affectedString.append("\(key) (\(value.before.amount)->\(value.after.amount))")
//            }

        }
        print(result)
        return result
    }
}

#Preview {
    ExperimentView()
}
