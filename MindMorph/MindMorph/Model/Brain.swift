//
//  Brain.swift
//  MindMorph
//
//  Created by Aman Gupta on 21/02/24.
//

import Foundation
struct Brain{
    var dopamine:Amount = Amount()
    var serotonin: Amount = Amount()
    var acetylcholine:Amount = Amount()
    var gaba: Amount = Amount()
    var glutamate: Amount = Amount()
    
    mutating func effect(chemicalLevels:[ChemicalLevels:Float]? = nil){
        if let chemicalLevels = chemicalLevels{
            if let dopamineChange = chemicalLevels[.dopamine]{
                dopamine.effect(percentage: dopamineChange)
            }
            if let serotoninChange = chemicalLevels[.serotonin]{
                serotonin.effect(percentage: serotoninChange)
            }
            if let acetylcholineChange = chemicalLevels[.acetylcholine]{
                acetylcholine.effect(percentage: acetylcholineChange)
            }
            if let gabaChange = chemicalLevels[.gaba]{
                gaba.effect(percentage: gabaChange)
            }
            if let glutamateChange = chemicalLevels[.glutamate]{
                glutamate.effect(percentage: glutamateChange)
            }

        }
    }
}
