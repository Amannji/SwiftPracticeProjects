//
//  CheckContinuationBootcamp.swift
//  SwiftConcurrency
//
//  Created by Aman Gupta on 13/01/24.
//

import SwiftUI



class CheckContinuationBootcampManager {
    
    func getData(url: URL) async throws->Data{
        do{
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            return data
        }
        catch{
            throw error
        }
    }
    
    func getData2(url: URL) async throws->Data{
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with:url){ data, response, error in
                if let data = data {
                    continuation.resume(returning: data)
                } else if let error = error{
                    continuation.resume(throwing: error)
                }
                else{
                    continuation.resume(throwing: URLError(.badURL))
                }
            }
            .resume()
        }
    }
    
    func getHeartImageFromDatabase(completionHandler: @escaping (_ image: UIImage)->()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            completionHandler(UIImage(systemName: "heart.fill")!)
        }
    }
    
    func getHeartImageFromDatabase() async ->UIImage{
        
        await withCheckedContinuation { continuation in
            getHeartImageFromDatabase{ image in
                continuation.resume(returning: image)
                
            }
        }
    }
}




class CheckContinuationBootcampViewModel: ObservableObject{
    @Published var image: UIImage?
    let manager = CheckContinuationBootcampManager()
    func getImage() async{
        guard let url  = URL(string: "https://picsum.photos/200") else {return}
        
        do{
            let data = try await manager.getData2(url: url)
            if let image = UIImage(data: data){
                await MainActor.run(body: {
                    self.image = image
                }
                )
            }
            
        }
        catch{
            print(error)
        }
    }
    
    func getHeartImage() async {
        self.image = await manager.getHeartImageFromDatabase()
    }
    
    
}




struct CheckContinuationBootcamp: View {
    @StateObject var viewModel = CheckContinuationBootcampViewModel()
    
    var body: some View {
        ZStack{
            if let image = viewModel.image{
                Image(uiImage:image)
                    .resizable()
                    .frame(width: 250, height: 250)
            }
        }
        .task{
            await viewModel.getHeartImage()
        }
        
    }
}

#Preview {
    CheckContinuationBootcamp()
}
