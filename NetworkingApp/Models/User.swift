//
//  User.swift
//  NetworkingApp
//
//  Created by Sergey Efimov on 28.12.2021.
//

struct User: Decodable {
    var results: [UserCharacter]
    let info: Info
    
    var description: String {
        """
        Result: \(resultsToString())
        Info: \(info.description)
        """
    }
    
    private func resultsToString() -> String {
        var results = ""
        self.results.forEach { results += $0.description }
        return results
    }
    
}

struct Info: Decodable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
    
    var description: String {
        """
        seed: \(seed)
        results: \(results)
        page: \(page)
        version: \(version)
        """
    }
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
    let nat: String
    
    var description: String {
        """
        gender: \(gender)
        name: \(name.description)
        location: \(location.description)
        email: \(email)
        login: \(login.description)
        dob: \(dob.description)
        registered: \(dob.description)
        phone: \(phone)
        id: \(id.description)
        picture: \(picture.description)
        nat: \(nat)
        """
    }
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
    
    var description: String {
        """
        title: \(title)
        first: \(first)
        last: \(last)
        """
    }
}

struct Location: Decodable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: TimeZone
    
    var description: String {
        """
        street: \(street.description)
        city: \(city)
        state: \(state)
        country: \(country)
        postcode: \(postcode)
        coordinates: \(coordinates.description)
        timezone: \(timezone.descriptionInfo)
        """
    }
}

struct Street: Decodable {
    let number: Int
    let name: String
    
    var description: String {
        """
        number: \(number)
        name: \(name)
        """
    }
}

struct Coordinates: Decodable {
    let latitude: String
    let longitude: String
    
    var description: String {
        """
        number: \(latitude)
        name: \(longitude)
        """
    }
}

struct TimeZone: Decodable {
    let offset: String
    let description: String
    
    
    var descriptionInfo: String {
        """
        offset: \(offset)
        description: \(description)
        """
    }
}

struct Login: Decodable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
    
    var description: String {
        """
        uuid: \(uuid)
        username: \(username)
        password: \(password)
        salt: \(salt)
        md5: \(md5)
        sha1: \(sha1)
        sha256: \(sha256)
        """
    }
}

struct Dob: Decodable {
    let date: String
    let age: Int
    
    var description: String {
        """
        date: \(date)
        age: \(age)
        """
    }
}

struct Id: Decodable {
    let name: String
    let value: String?
    
    var description: String {
        """
        name: \(name)
        value: \(value ?? "")
        """
    }
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
    
    var description: String {
        """
        large: \(large)
        medium: \(medium)
        thumbnail: \(thumbnail)
        """
    }
}
