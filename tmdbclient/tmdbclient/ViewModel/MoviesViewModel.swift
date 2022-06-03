//
//  MoviesViewModel.swift
//  tmdbclient
//
//  Created by Ömer Can Koç on 29.05.2022.
//

import Foundation

class MoviesViewModel : ObservableObject {
    @Published var items : [MovieModel]?
    public var placeholders = Array(repeating: MovieModel(id : Int(UUID().uuidString), overview: nil, title: nil), count: 10)
    
    func getMovies(path : String){
        let url = URL(string: "\(APIViewModel.baseURL)\(path)?api_key=\(APIViewModel.apiKey)&language=en-US&page=1")
        
        var request = URLRequest(url : url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                do {
                    let res : ErrorModel = try JSONDecoder().decode(ErrorModel.self, from : data!)
                    print("ERROR GET DATA!",res.status_message as Any)
                    return
                } catch {
                    print(error)
                }
            }
            
            guard let data = data else { return }
            
            do {
                let result : DiscoverModel = try JSONDecoder().decode(DiscoverModel.self, from: data)
                DispatchQueue.main.async {
                    self.items = result.results
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
