//
//  MindMorphApp.swift
//  MindMorph
//
//  Created by Aman Gupta on 10/02/24.
//

import SwiftUI

@main
struct MindMorphApp: App {
    @StateObject var vm = CodeViewModel()
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(vm)
        }
    }
}
