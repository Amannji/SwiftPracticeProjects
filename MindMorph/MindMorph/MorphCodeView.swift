//
//  MorphCodeView.swift
//  MindMorph
//
//  Created by Aman Gupta on 10/02/24.
//

import SwiftUI

struct MorphCodeView: View {
    @State var activities = []
    @State private var selectedActionGroup: ActionGroup = CodeDataSource.actionGroups[0]
    @State var codeDetailViewActive: Bool = false
    @State var blocks: [Action] = []

    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                CardView{
                    VStack(alignment: .leading){
                        Text("Goal: Experiment with activities to see its impact on overall brainHealth")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 10)
                        HStack{
                            Text("Steps:")
                            Image(systemName:"arrow.down")
                        }
                        
                        Text("1. Choose an activity tab")
                        Text("2. Choose the activity command you most likely want to do")
                        Text("3. Press Run button")
                        Text("For fun, Try running a bunch of activities together")
                            .padding(.top,10)
                            .fontWeight(.semibold)
                        
                    }
                    
                    ScrollView(.vertical){
                        ForEach(blocks){ block in
                            CodeBlockCell(action:block)
                            
                        }
                    }
                    
                }
                
                Spacer()
            }
            .zIndex(1)
            .overlay{
                Rectangle()
                    .opacity(codeDetailViewActive ? 0.2:0)
            }
            
            bottomDrawer
            
        }
        
        .frame(width: UIScreen.main.bounds.width / 2)
        .ignoresSafeArea(.all)
        
        
        
    }
}




#Preview {
    MorphCodeView()
        .previewDevice("iPad Pro (12.9-inch) (6th generation)")
        .previewInterfaceOrientation(.landscapeRight)
}

extension MorphCodeView{
    public var runBtn: some View{
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 130,height:50)
            .padding()
            .overlay{
                HStack{
                    Image(systemName: "arrowtriangle.right.fill")
                        .foregroundColor(.white)
                    Text("Execute")
                        .foregroundColor(.white)
                        
                }
            }
    }
}


struct ActivityTitleBtn: View{
    var title: String
    var image: String
    var index: Int
    @Binding var selectedTabIndex: Int
    var body: some View{
        HStack{
            Image(systemName: "brain.fill")
            Text(title)
                .foregroundColor(selectedTabIndex == index ? .blue : .black)
        }
        .padding()
        .onTapGesture{
            selectedTabIndex = index
        }
    }
}


struct CodeBlockCell: View{
    var action: Action
    var body: some View{
        CardView(backgroundColor:action.color){
            HStack(spacing:5){
                VStack(alignment:.leading){
                    Text(action.code)
                        .font(.system(size: 30, weight: .bold))
                    Text(action.description)
                        .font(.title)

                    
                }
                .foregroundColor(.white)
                Image(systemName:"plus.circle")
                    .font(.system(size:40,weight:.bold))
                    .foregroundColor(.white)
                   
                    
            }
        }
    }
}


struct CodeBlocksList: View{
    var actionGroup:ActionGroup
    var body: some View{
        ScrollView{
            ForEach(actionGroup.actions){ action in
                CodeBlockCell(action: action)
                    .padding()
            }
        }
    }
}


extension MorphCodeView{
    
    
    public var ActionGroupBtns: some View{
        HStack{
            ForEach(CodeDataSource.actionGroups){actionGroup in
                HStack{
                    Image(systemName: "brain.fill")
                    Text(actionGroup.groupName)
                }
                .padding()
                .onTapGesture{
                    selectedActionGroup = actionGroup
                }
                
            }
        }
    }
    
    
    public var bottomDrawer: some View{
        VStack{
            VStack{
                HStack(spacing:200){
                   ActionGroupBtns
                    Image(systemName: codeDetailViewActive ? "arrow.down.square": "arrow.up.square")
                        .font(.system(size:30))
                        .onTapGesture {
                            codeDetailViewActive.toggle()
                        }
                }
                ScrollView(.horizontal){
                    HStack(spacing:10){
                        ForEach(selectedActionGroup.actions){action in
                            CodeActionTab(action:action)
                                .padding(.horizontal)
                        }
                    }
                }
                
                .opacity(codeDetailViewActive ? 0:1)
                
            }
    
            VStack{
                CodeBlocksList(actionGroup: selectedActionGroup)
            }
            .frame(height: codeDetailViewActive ? UIScreen.main.bounds.height/2 : 0 )
        }
        
        .background(Color.white)
        .zIndex(3)
    }
    
}


struct CodeActionTab: View{
    var action: Action
    var body: some View{
        RoundedRectangle(cornerRadius: 10)
            .frame(width:CGFloat(action.code.count*15),height:40)
            .overlay{
                Text(action.code)
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
            }
        
    }
}
