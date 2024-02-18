//
//  SelectedBlockCell.swift
//  MindMorph
//
//  Created by Aman Gupta on 18/02/24.
//

import SwiftUI

struct SelectedBlockCell: View{
    var action: Action
    var index: Int
    @EnvironmentObject var vm: CodeViewModel
    var body: some View{
        CardView(backgroundColor:action.color){
            HStack{
                VStack(alignment:.leading){
                    Text(action.code)
                        .font(.system(size: 30, weight: .bold))
                    Text(action.description)
                        .font(.title)
                }
                .foregroundColor(.white)
                Spacer()
                Image(systemName:"xmark")
                    .font(.system(size:40,weight:.bold))
                    .foregroundColor(.white)
                    .onTapGesture {
                        vm.remove(index: index)
                    }
            }
            .frame(minWidth:UIScreen.main.bounds.width/2)
        }
    }
}
#Preview {
    SelectedBlockCell(action:CodeDataSource.food.actions[0], index: 1)
}
