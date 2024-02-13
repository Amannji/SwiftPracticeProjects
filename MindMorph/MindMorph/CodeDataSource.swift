//
//  CodeDataSource.swift
//  MindMorph
//
//  Created by Aman Gupta on 13/02/24.
//

import Foundation
import SwiftUI

class CodeDataSource{
    static var actionGroups: [ActionGroup]{
        [
            food, exercise, entertainment
        ]
    }
    
    
    static var food:ActionGroup{
        ActionGroup(
            groupName:"Food",
            iconName:"",
            color: Color.orange,
            actions:[
                Action(
                    code:"Cooking()",
                    description: "Prepare and eat dishes rich in nutrients",
                    color:Color.orange
                ),
                Action(
                    code:"Eating Fruits()",
                    description: "Replenish vitamins and make more collagen",
                    color:Color.orange
                ),
                Action(
                    code:"Drink Beer()",
                    description: "Gives you an instant dizzy feeling.",
                    color:Color.orange
                )
            
            ]
        )
    }
    
    static var exercise: ActionGroup{
        ActionGroup(
            groupName:"Exercise",
            iconName:"",
            color: Color.red,
            actions:[
                Action(
                    code:"Pull Day",
                    description:"Engage in exercises to make up your back muscles",
                    color:Color.red
                ),
            ]
        )
    }
    
    static var entertainment:ActionGroup{
        ActionGroup(
            groupName:"Entertainment",
            iconName:"",
            color: Color.yellow,
            actions:[
                Action(
                    code:"Bingwatch a Korean Drama",
                    description: "Continuously sit in front of a screen, and follow through the story for 14 hours straight.",
                    color: Color.yellow
                )
            
            ]
        )
    }
    
}
