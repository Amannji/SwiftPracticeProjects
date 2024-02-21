//
//  Executable.swift
//  MindMorph
//
//  Created by Aman Gupta on 21/02/24.
//

import Foundation
protocol Block: Identifiable{
    var id: UUID { get }
    
}

struct RunnableBlock: Block, Executable{
    var id: UUID = UUID()
    var strategy:Strategy
    func effect(brain:Brain)->Brain{
        var brain: Brain = brain
        brain = effective(brain: brain)
        return brain
    }
    private func effective(brain:Brain)->Brain{
        var brain = brain
        brain.effect(chemicalLevels:strategy.chemicalChange)
        return brain
    }
}


