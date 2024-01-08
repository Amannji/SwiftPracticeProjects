//
//  DoCatchTryView.swift
//  SwiftConcurrency
//
//  Created by Aman Gupta on 08/01/24.
//

import SwiftUI

class DoCatchTryDataManager{
    
    let isActive: Bool = true
    func getTitle()-> (title:String?,error:Error?){
        if isActive{
            return (title:"New String", nil)
        }
        else{
            return (nil, URLError(.badURL))
        }
    }
    
    func getTitle2()->Result<String,Error>{
        if isActive{
            return .success("New Text")
        }
        else{
            return .failure(URLError(.badURL))
        }
    }
    
    func getTitle3() throws->String{
        if isActive{
            return "Mew mew"
        }else{
            throw URLError(.badURL)
        }
    }
}
class DoCatchTryViewModel: ObservableObject {
    @Published var text: String = "Starting text"
    let manager = DoCatchTryDataManager()
    
    //    func fetchTitle(){
    //        let returnedValue = manager.getTitle()
    //        if let newTitle = returnedValue.title{
    //            self.text = newTitle
    //        }
    //        else if let error = returnedValue.error{
    //            self.text = error.localizedDescription
    //        }
    //
    //    }
    
    //    func fetchTitle(){
    //        let result = manager.getTitle2()
    //        switch result{
    //        case .success(let newTitle):
    //            self.text = newTitle
    //        case .failure(let error):
    //            self.text = error.localizedDescription
    //
    //        }
    //
    //    }
        
    
    func fetchTitle(){
        
        do{
            let newTitle = try manager.getTitle3()
            self.text = newTitle
        }
        catch let error{
            self.text = error.localizedDescription
        }
    }
    
}

struct DoCatchTryView: View {
    @StateObject private var viewModel = DoCatchTryViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .onTapGesture{
                viewModel.fetchTitle()
            }
    }
}

#Preview {
    DoCatchTryView()
}
