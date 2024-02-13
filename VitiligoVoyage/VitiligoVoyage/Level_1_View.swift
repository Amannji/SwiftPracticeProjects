//
//  Level-1-View.swift
//  VitiligoVoyage
//
//  Created by Aman Gupta on 07/02/24.
//

import SwiftUI

struct Level_1_View: View {
    @State var facts:[String] = ["Fact 1","Fact 2","Fact3","Fact4"]
    @State var myths:[String] = ["Myth 1","Myth 2","Myth3","Myth4"]
    @State var showSuccessOverlay:Bool = false
    @GestureState private  var dragOffset: CGSize = .zero
   
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Image(systemName:"arrow.left")
                        .resizable()
                        .frame(width: 50, height:40)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Text("Facts vs Myths")
                        .font(.system(size: 50, weight:.semibold,design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    
                }
                //Facts
                VStack{
                    List{
                        ForEach(facts.indices, id:\.self){ index in
                            textBlock(title: facts[index])
//                            moveItem(from: &facts, to: &myths,index: index)
                            
                            
                        }
                        
                    }
                    .listRowSpacing(10.0)
                    .listStyle(.plain)
                    .padding()
                  
                }
                .frame(width:UIScreen.main.bounds.width/1.3, height: UIScreen.main.bounds.height/3)
                .overlay{
                    Rectangle()
                        
                        .stroke(.white,style: StrokeStyle(lineWidth: 4, dash:[20]))
                }
                .padding(.bottom)
                
               //Myths
                
                VStack{
                    List{
                        ForEach(myths.indices, id:\.self){ index in
                            textBlock(title: myths[index])
                                
                               
                        }
                        
                        
                        
                        
                    }
                    .listRowSpacing(10.0)
                    .listStyle(.plain)
                    .padding()
                }
                .frame(width:UIScreen.main.bounds.width/1.3, height: UIScreen.main.bounds.height/3)
                .overlay{
                    Rectangle()
                        .stroke(.white,style: StrokeStyle(lineWidth: 4, dash:[20]))
                }
                
                
            }
            .padding(40)
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.dullOrange)
            
        }
       
        
    }
        
    func shuffleSentences(){
        facts.shuffle()
        myths.shuffle()
        
    }
   
    func moveItem(from source: inout [String], to destination: inout [String], index: Int){
        let item = source[index]
        source.remove(at: index)
        destination.append(item)
    }
    
    func checkCompletion(){
        if facts ==  facts.sorted() && myths == myths.sorted(){
            print("Game Over")
        }
    }
}

#Preview {
    Level_1_View()
}


struct textBlock:View{
    var title:String
    var body: some View{
        Text(title)
             .font(.subheadline)
             .fontWeight(.medium)
             .listRowBackground(
                 RoundedRectangle(cornerRadius:5)
                     .foregroundColor(.white)
             )
    }
}
