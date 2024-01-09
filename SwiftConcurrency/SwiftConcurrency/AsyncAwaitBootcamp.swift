//
//  AsyncAwaitBootcamp.swift
//  SwiftConcurrency
//
//  Created by Aman Gupta on 09/01/24.
//

import SwiftUI

class AsyncAwaitBootcampViewModel: ObservableObject{
    @Published var data:[String] = []
    
    func addTitle1(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.data.append("Title1 \(Thread.current)")
        }
    }
    
    func addTitle2(){
        DispatchQueue.global().asyncAfter(deadline: .now() + 2){
            self.data.append("Title2 \(Thread.current)")
        }
    }
    
    func addAuthor() async{
        
        let author1 = "Author 1 \(Thread.current)"
        self.data.append(author1)
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        await MainActor.run(body:{
            let author2 = "Author2 \(Thread.current)"
            self.data.append(author2)
            
            let author3 = "Author3 \(Thread.current)"
            self.data.append(author3)
        })
        
        await doSomething()
        
    }
    
    func doSomething() async{
        let author4 = "Author 4 \(Thread.current)"
        self.data.append(author4)
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
    }
}

struct AsyncAwaitBootcamp: View {
    @StateObject var vm = AsyncAwaitBootcampViewModel()
    
    var body: some View {
        VStack{
            List{
                ForEach(vm.data, id: \.self){data in
                    Text(data)
                }
            }
            .onAppear{
//                vm.addTitle1()
//                vm.addTitle2()
                Task{
                    await vm.addAuthor()
                    let author5 = "Author5 \(Thread.current)"
                    vm.data.append(author5)
                }
            }
        }
    }
}

#Preview {
    AsyncAwaitBootcamp()
}
