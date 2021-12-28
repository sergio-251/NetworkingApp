//
//  User.swift
//  NetworkingApp
//
//  Created by Sergey Efimov on 28.12.2021.
//

struct User: Decodable {
    let results: [UserCharacter]
    let info: Info
    
    var description: String {
        """
        Result: \(results)
        Info: \(info)
        """
    }
}

struct Info: Decodable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}

struct UserCharacter: Decodable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob: Dob
    let registered: Dob
    let phone: String
    let id: Id
    let picture: Picture
    let nat: Street
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: TimeZone
}

struct Street: Decodable {
    let number: Int
    let name: String
}

struct Coordinates: Decodable {
    let latitude: String
    let longitude: String
}

struct TimeZone: Decodable {
    let offset: String
    let description: String
}

struct Login: Decodable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}

struct Dob: Decodable {
    let date: String
    let age: Int
}

struct Id: Decodable {
    let name: String
    let value: Int?
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}
