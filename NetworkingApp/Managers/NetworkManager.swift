//
//  NetworkManager.swift
//  NetworkingApp
//
//  Created by Sergey Efimov on 27.12.2021.
//

import Foundation
import Alamofire


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
    func fetchData(_ url: String, completion: @escaping(Result<User, NetworkError>) -> Void) {
        AF.request(Link.url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    completion(.success(self.convertToModel(from: value)))
                case .failure:
                    completion(.failure(.decodingError))
                }
                
            }
    }
    
    private func convertToModel(from value: Any) -> User {
        guard let userData = value as? [String: Any] else { return User() }
        guard let infoUser = userData["info"] as? [String: Any] else { return User()}
        guard let resultsUser = userData["results"] as? [[String: Any]] else { return User()}
        
        let info = Info(
            seed: infoUser["seed"] as? String ?? nil,
            results: infoUser["results"] as? Int ?? nil,
            page: infoUser["page"] as? Int ?? nil,
            version: infoUser["version"] as? String ?? nil
        )
        
        var userCharacters: [UserCharacter] = []
        resultsUser.forEach {
            guard let nameData = $0["name"] as? [String: Any] else { return }
            let name = Name(
                title: nameData["title"] as? String ?? nil,
                first: nameData["first"] as? String ?? nil,
                last: nameData["last"] as? String ?? nil
            )
            
            guard let locationData = $0["location"] as? [String: Any] else { return }
            guard let street = locationData["street"] as? [String: Any] else { return }
            guard let coordinates = locationData["coordinates"] as? [String: Any] else { return }
            guard let timezone = locationData["timezone"] as? [String: Any] else { return }
            let location = Location(
                street: Street(
                    number: street["number"] as? Int ?? nil,
                    name: street["name"] as? String ?? nil
                ),
                city: locationData["city"] as? String ?? nil,
                state: locationData["state"] as? String ?? nil,
                country: locationData["country"] as? String ?? nil,
                postcode: locationData["postcode"] as? Int ?? nil,
                coordinates: Coordinates(
                    latitude: coordinates["latitude"] as? String ?? nil,
                    longitude: coordinates["longitude"] as? String ?? nil
                ),
                timezone: TimeZone(
                    offset: timezone["offset"] as? String ?? nil,
                    description: timezone["description"] as? String ?? nil
                
                )
            )
            
            guard let loginData = $0["login"] as? [String: Any] else { return }
            let login = Login(
                uuid: loginData["uuid"] as? String ?? nil,
                username: loginData["username"] as? String ?? nil,
                password: loginData["password"] as? String ?? nil,
                salt: loginData["salt"] as? String ?? nil,
                md5: loginData["md5"] as? String ?? nil,
                sha1: loginData["sha1"] as? String ?? nil,
                sha256: loginData["sha256"] as? String ?? nil
            )
            
            guard let dobData = $0["dob"] as? [String: Any] else { return }
            let dob = Dob(
                date: dobData["date"] as? String ?? nil,
                age: dobData["date"] as? Int ?? nil
            )
            
            guard let registeredData = $0["registered"] as? [String: Any] else { return }
            let registered = Dob(
                date: registeredData["date"] as? String ?? nil,
                age: registeredData["date"] as? Int ?? nil
            )
            
            guard let idData = $0["id"] as? [String: Any] else { return }
            let id = Id(
                name: idData["name"] as? String ?? nil,
                value:  idData["value"] as? String ?? nil
            )
            
            guard let pictureData = $0["picture"] as? [String: Any] else { return }
            let picture = Picture(
                large: pictureData["large"] as? String ?? nil,
                medium: pictureData["medium"] as? String ?? nil,
                thumbnail: pictureData["thumbnail"] as? String ?? nil
            )
            
            let userCharacter = UserCharacter(
                gender: $0["gender"] as? String ?? nil,
                name: name,
                location: location,
                email: $0["email"] as? String ?? nil,
                login: login,
                dob: dob,
                registered: registered,
                phone: $0["phone"] as? String ?? nil,
                id: id,
                picture: picture,
                nat: $0["nat"] as? String ?? nil
            )
            userCharacters.append(userCharacter)
        }
        return User(results: userCharacters, info: info)
    }
}
