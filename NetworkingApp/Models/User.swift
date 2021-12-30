//
//  User.swift
//  NetworkingApp
//
//  Created by Sergey Efimov on 28.12.2021.
//

struct User: Decodable {
    var results: [UserCharacter]?
    let info: Info?
    
    var description: String {
        """
        Result: \(getResultsDescription())
        Info: \(info?.description ?? "nil")
        """
    }
    
    init(results: [UserCharacter]?, info: Info?) {
        self.results = results
        self.info = info
    }
    
    init() {
        self.results = nil
        self.info = nil
    }
    
    private func getResultsDescription() -> String {
        var description = ""
        results?.forEach { description += $0.description}
        return description
    }
    
    
    
}

struct Info: Decodable {
    let seed: String?
    let results: Int?
    let page: Int?
    let version: String?
    
    var description: String {
        """
        seed: \(seed ?? "nil")
        results: \(results ?? 0)
        page: \(page ?? 0)
        version: \(version ?? "nil")
        """
    }
    
    init(seed: String?, results: Int?, page: Int?, version: String?) {
        self.seed = seed
        self.results = results
        self.page = page
        self.version = version
    }
    
    init() {
        self.seed = nil
        self.results = nil
        self.page = nil
        self.version = nil
        
    }
    
}

struct UserCharacter: Decodable {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let login: Login?
    let dob: Dob?
    let registered: Dob?
    let phone: String?
    let id: Id?
    let picture: Picture?
    let nat: String?
    
    var description: String {
        """
        gender: \(gender ?? "nil")
        name: \(name?.description ?? Name().description)
        location: \(location?.description ?? Location().description)
        email: \(email ?? "nil")
        login: \(login?.description ?? Login().description)
        dob: \(dob?.description ?? Dob().description)
        registered: \(dob?.description ?? Dob().description)
        phone: \(phone ?? "nil")
        id: \(id?.description ?? Id().description)
        picture: \(picture?.description ?? Picture().description)
        nat: \(nat ?? "nil")
        """
    }
    
    init(gender: String?,
         name: Name?,
         location: Location?,
         email: String?,
         login: Login?,
         dob: Dob?,
         registered: Dob?,
         phone: String?,
         id: Id?,
         picture: Picture?,
         nat: String?
    ) {
        self.gender = gender
        self.name = name
        self.location = location
        self.email = email
        self.login = login
        self.dob = dob
        self.registered = registered
        self.phone = phone
        self.id = id
        self.picture = picture
        self.nat = nat
    }
    
}


struct Name: Decodable {
    let title: String?
    let first: String?
    let last: String?
    
    var description: String {
        """
        title: \(title ?? "nil")
        first: \(first ?? "nil")
        last: \(last ?? "nil")
        """
    }
    
    init(title: String?, first: String?, last: String?) {
        self.title = title
        self.first = first
        self.last = last
    }
    
    init() {
        self.title = nil
        self.first = nil
        self.last = nil
    }
    
}

struct Location: Decodable {
    let street: Street?
    let city: String?
    let state: String?
    let country: String?
    let postcode: Int?
    let coordinates: Coordinates?
    let timezone: TimeZone?
    
    var description: String {
        """
        street: \(street?.description ?? Street().description)
        city: \(city ?? "nil")
        state: \(state ?? "nil")
        country: \(country ?? "nil")
        postcode: \(postcode ?? 0)
        coordinates: \(coordinates?.description ?? Coordinates().description)
        timezone: \(timezone?.descriptionInfo ?? TimeZone().descriptionInfo)
        """
    }
    
    init(street: Street?,
         city: String?,
         state: String?,
         country: String?,
         postcode: Int?,
         coordinates: Coordinates?,
         timezone: TimeZone?
    ) {
        self.street = street ?? Street()
        self.city = city
        self.state = state
        self.country = country
        self.postcode = postcode
        self.coordinates = coordinates ?? Coordinates()
        self.timezone = timezone ?? TimeZone()
    }
    
    init() {
        self.street = Street()
        self.city = nil
        self.state = nil
        self.country = nil
        self.postcode = nil
        self.coordinates = Coordinates()
        self.timezone = TimeZone()
    }
    
}

struct Street: Decodable {
    let number: Int?
    let name: String?
    
    var description: String {
        """
        number: \(number ?? 0)
        name: \(name ?? "nil")
        """
    }
    
    init(number: Int?, name: String?) {
        self.number = number
        self.name = name
    }
    
    init() {
        self.number = nil
        self.name = nil
    }
    
}

struct Coordinates: Decodable {
    let latitude: String?
    let longitude: String?
    
    var description: String {
        """
        number: \(latitude ?? "nil")
        name: \(longitude ?? "nil")
        """
    }
    
    init(latitude: String?, longitude: String?) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init() {
        self.latitude = nil
        self.longitude = nil
    }
    
}

struct TimeZone: Decodable {
    let offset: String?
    let description: String?
    
    
    var descriptionInfo: String {
        """
        offset: \(offset ?? "nil")
        description: \(description ?? "nil")
        """
    }
    
    init(offset: String?, description: String?) {
        self.offset = offset
        self.description = description
    }
    
    init() {
        self.offset = nil
        self.description = nil
    }
    
}

struct Login: Decodable {
    let uuid: String?
    let username: String?
    let password: String?
    let salt: String?
    let md5: String?
    let sha1: String?
    let sha256: String?
    
    var description: String {
        """
        uuid: \(uuid ?? "nil")
        username: \(username ?? "nil")
        password: \(password ?? "nil")
        salt: \(salt ?? "nil")
        md5: \(md5 ?? "nil")
        sha1: \(sha1 ?? "nil")
        sha256: \(sha256 ?? "nil")
        """
    }
    
    init(
        uuid: String?,
        username: String?,
        password: String?,
        salt: String?,
        md5: String?,
        sha1: String?,
        sha256: String?
    ) {
        self.uuid = uuid
        self.username = username
        self.password = password
        self.salt = salt
        self.md5 = md5
        self.sha1 = sha1
        self.sha256 = sha256
    }
    
    init() {
        self.uuid = nil
        self.username = nil
        self.password = nil
        self.salt = nil
        self.md5 = nil
        self.sha1 = nil
        self.sha256 = nil
    }
    
}

struct Dob: Decodable {
    let date: String?
    let age: Int?
    
    var description: String {
        """
        date: \(date ?? "nil")
        age: \(age ?? 0)
        """
    }
    
    init(date: String?, age: Int?) {
        self.date = date
        self.age = age
    }
    
    init() {
        self.date = nil
        self.age = nil
    }
    
}

struct Id: Decodable {
    let name: String?
    let value: String?
    
    var description: String {
        """
        name: \(name ?? "nil")
        value: \(value ?? "nil")
        """
    }
    
    init(name: String?, value: String?) {
        self.name = name
        self.value = value
    }
    
    init() {
        self.name = nil
        self.value = nil
    }
    
}

struct Picture: Decodable {
    let large: String?
    let medium: String?
    let thumbnail: String?
    
    var description: String {
        """
        large: \(large ?? "nil")
        medium: \(medium ?? "nil")
        thumbnail: \(thumbnail ?? "nil")
        """
    }
    
    init(large: String?, medium: String?, thumbnail: String?) {
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
    
    init() {
        self.large = nil
        self.medium = nil
        self.thumbnail = nil
    }
    
}
