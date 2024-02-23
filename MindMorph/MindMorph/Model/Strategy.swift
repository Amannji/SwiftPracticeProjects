//
//  Strategy.swift
//  MindMorph
//
//  Created by Aman Gupta on 21/02/24.
//

import Foundation
protocol Strategy{
    var chemicalChange:[ChemicalLevels: Float]{ get set }
    var abilityChange:[AbilityLevels: Float]{ get set }
}
