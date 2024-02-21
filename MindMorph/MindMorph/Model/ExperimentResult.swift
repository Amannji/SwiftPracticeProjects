//
//  ExperimentResult.swift
//  MindMorph
//
//  Created by Aman Gupta on 21/02/24.
//

import Foundation
struct ExperimentResult:Identifiable{
    var id: UUID = UUID()
    var result: RunResult = .success
    var chemicalchangeFactor: ChemicalLevelsChange
}

enum RunResult: String{
    case success
    case failed
}
