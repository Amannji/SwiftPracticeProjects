//
//  ResultView.swift
//  MindMorph
//
//  Created by Aman Gupta on 18/02/24.
//

import SwiftUI

struct ResultView: View {
    @Binding var brain: Brain
    @Binding var result: ExperimentResult
    var body: some View {
        ScrollView{
            VStack{
                CardView{
                 
                    VStack(alignment:.leading,spacing:40){
                        Text("NeuroChemical Composition Score")
                            .font(.largeTitle.bold())
                            
                        ProgressView(text:"Dopamine",progress:brain.dopamine.percentage, change:result.chemicalchangeFactor.dopamine)
                        ProgressView(text:"Serotonin",progress:brain.serotonin.percentage, change:result.chemicalchangeFactor.serotonin)
                        ProgressView(text:"Acetylcholine",progress:brain.acetylcholine.percentage,change: result.chemicalchangeFactor.acetylcholine)
                        ProgressView(text:"Gaba",progress:brain.gaba.percentage,change: result.chemicalchangeFactor.gaba)
                        ProgressView(text:"Glutamate",progress:brain.glutamate.percentage,change:result.chemicalchangeFactor.glutamate)
                    }
                    .padding()
                }
                
                CardView{
                    VStack(alignment:.leading,spacing:50){
                        Text("Mental Abilities Score")
                            .font(.largeTitle.bold())
                            
                        ProgressView(text:"Memory",progress: brain.memory.percentage, change:result.abilityChangeFactor.memory)
                        ProgressView(text:"Attention",progress: brain.attention.percentage,change:result.abilityChangeFactor.attention)
                        ProgressView(text:"Emotional \nRegulation",progress:brain.emotionalRegulation.percentage, change:result.abilityChangeFactor.emotionalRegulation)
                            .padding(.bottom,40)
                        ProgressView(text:"Problem \nSolving", progress: brain.executiveFunction.percentage, change: result.abilityChangeFactor.executiveFunction)
                            .padding(.bottom,40)
                        ProgressView(text:"Social Skills", progress:brain.perception.percentage,change:result.abilityChangeFactor.perception)
                            .padding(.bottom,20)
                        
                        
                        
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width / 2)
    }
}

#Preview {
    ResultView(brain: .constant(Brain(
        dopamine:Amount(0.2),
        serotonin:Amount(0.3),
        acetylcholine:Amount(0.4),
        gaba:Amount(0.2),
        glutamate:Amount(0.8),
        memory: Amount(0.5),
        attention: Amount(0.5),
        perception: Amount(0.5),
        emotionalRegulation: Amount(0.5),
        executiveFunction: Amount(0.5)
    )),
               result: .constant(ExperimentResult(chemicalchangeFactor: ChemicalLevelsChange(dopamine: 10, serotonin: 10, acetylcholine: 10, gaba: 10, glutamate: 0),abilityChangeFactor: AbilityLevelsChange(memory: 10, attention: 10, perception: 10, emotionalRegulation: 10, executiveFunction: 10))))
    
}

//struct Stat: View{
//    var text: String
//    var progress: Float
//    var body: some View{
//        HStack{
//            Text(text)
//                .font(.largeTitle)
//            Spacer()
//            ZStack{
//                Circle()
//                    .stroke(Color(.systemGray6),lineWidth: 10)
//                    .frame(width:100)
//                Circle()
//                    .trim(from:0,to: CGFloat(progress))
//                    .stroke(Color(.systemGreen),lineWidth:10)
//                    .rotationEffect(.degrees(-90))
//                    .frame(width:100)
//                    .overlay{
//                        Text(String(format:"%.0f%%",progress*100))
//                            .font(.title)
//                    }
//            }
//        }
//        
//        .padding(.horizontal,50)
//    }
//}

