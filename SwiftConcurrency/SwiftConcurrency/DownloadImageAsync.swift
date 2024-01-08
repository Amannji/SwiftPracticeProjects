//
//  DownloadImageAsync.swift
//  SwiftConcurrency
//
//  Created by Aman Gupta on 08/01/24.
//

import SwiftUI
import Combine

class DownloadImageLoader{
    let url = URL(string:"https://picsum.photos/400/300")!
    
    func handleResponse(data: Data?, response: URLResponse?)->UIImage?{
        guard
            let data = data,
            let image = UIImage(data: data),
            let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    return nil
                }
        return image
    }
    
    func downloadImageWithEscaping(completionHandler:@escaping (UIImage?,Error?)->()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            let image = self.handleResponse(data: data, response: response)
            completionHandler(image,error)
        }
        .resume()
    }
    
    func downloadWithCombine()->AnyPublisher<UIImage?, Error>{
        URLSession.shared.dataTaskPublisher(for: url)
            .map(handleResponse)
            .mapError({ $0 })
            .eraseToAnyPublisher()
    }
}


class DownloadImageViewModel:ObservableObject{
    @Published var image: UIImage? = nil
    let loader = DownloadImageLoader()
    var cancellables = Set<AnyCancellable>()
    
    func fetchImage(){
//        self.image = UIImage(systemName: "heart.fill")
//        loader.downloadImageWithEscaping{ [weak self] image, error in
//            DispatchQueue.main.async{
//                self?.image = image
//            }
//        }
        loader.downloadWithCombine()
            .receive(on: DispatchQueue.main)
            .sink{ _ in
                
            } receiveValue : { [weak self] image in
                self?.image = image
            }
            .store(in: &cancellables)
            
        
        
    }
    
}

struct DownloadImageAsync: View {
    @StateObject private var viewModel  = DownloadImageViewModel()
    var body: some View {
        ZStack{
            if let image = viewModel.image{
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height:450)
            }
        }
        .onAppear{
            viewModel.fetchImage()
        }
    }
}

#Preview {
    DownloadImageAsync()
}
