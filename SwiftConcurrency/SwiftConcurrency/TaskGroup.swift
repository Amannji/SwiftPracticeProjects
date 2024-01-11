//
//  TaskGroup.swift
//  SwiftConcurrency
//
//  Created by Aman Gupta on 11/01/24.
//

import SwiftUI

class TaskGroupDataManager{
    
    func fetchImagesWithTaskGroup() async throws -> [UIImage]{
        return try await withThrowingTaskGroup(of: UIImage.self){group in
            var images: [UIImage] = []
            group.addTask{
                try await self.fetchImage(urlString: "https://picsum.photos/200")
                
            }
            group.addTask{
                try await self.fetchImage(urlString: "https://picsum.photos/300")
            }
            group.addTask{
                try await self.fetchImage(urlString: "https://picsum.photos/400")
            }
            
            for try await image in group{
                images.append(image)
            }
        }
        
        
    }
    class TaskGroupViewModel: ObservableObject{
        @Published var images: [UIImage] = []
        
        let manager = TaskGroupDataManager()
        func getImages() async {
            if let images = try? await manager.fetchImagesWithTaskGroup(){
                self.images.append(contentsOf: images)
            }
                
        }
    }
    
    func fetchImage(urlString: String) async throws->UIImage{
        guard let url = URL(string: urlString) else{
            throw URLError(.badURL)
        }
        do{
            let (data, _) = try await URLSession.shared.data(from:url, delegate: nil)
            if let image = UIImage(data: data){
                return image
            }
            else {
                throw URLError(.badURL)
            }
            
        }
        catch{
            throw error
        }
        
    }
}

struct TaskGroup: View {
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(images, id: \.self){ image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height:150)
                        
                        
                    }
                }
                
            }
            .navigationTitle("🧠Task Group")
        
        }
    }
}

#Preview {
    TaskGroup()
}
