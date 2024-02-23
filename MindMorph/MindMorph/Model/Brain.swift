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
    
    private let dopamineImpactFactor: Float = 0.3
    private let serotoninImpactFactor: Float = 0.25
    private let acetylcholineImpactFactor: Float = 0.2
    private let gabaImpactFactor: Float = 0.15
    private let glutamateImpactFactor: Float = 0.1
    
    var brainHealth: Float {
        let health = Float(dopamine.amount) * dopamineImpactFactor +
                     Float(serotonin.amount) * serotoninImpactFactor +
                     Float(acetylcholine.amount) * acetylcholineImpactFactor +
                     Float(gaba.amount) * gabaImpactFactor +
                     Float(glutamate.amount) * glutamateImpactFactor
        return health
    }
    
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
