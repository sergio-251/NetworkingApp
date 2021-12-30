//
//  NetworkManager.swift
//  NetworkingApp
//
//  Created by Sergey Efimov on 27.12.2021.
//

import Foundation
im


enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchApi(from url: String?, with closure: @escaping(User) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Not error")")
                return }
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    closure(user)
                }
            } catch let error {
                print("Decode error: \(error)")
            }
        }.resume()
    
    }
   
}

//MARL: - Methods
extension NetworkManager {
    func fetchData(_ url: String, completion: @escaping(Result<[User], NetworkError>) -> Void) {
        AF.request(Link.exampleTwo.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let courses = Course.getCourses(from: value)
                    DispatchQueue.main.async {
                        completion(.success(courses))
                    }
                case .failure:
                    completion(.failure(.decodingError))
                }
            }
    }
}
