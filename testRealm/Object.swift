//
//  Object.swift
//  testRealm
//
//  Created by Мира Зейнурова on 13.02.2023.
//

import Foundation
import RealmSwift

class User: Object {
    @Persisted var name: String?
    @Persisted var surname: String?
    @Persisted var age: Int?
    @Persisted var pets: List<Pet>
    
    
    
    convenience init(name: String, surname: String, age: Int, pets: [Pet]) {
        self.init()
        self.name = name
        self.surname = surname
        self.age = age
        self.pets.append(objectsIn: pets)
    }
    
}

class Pet: Object {
    @Persisted var name: String?
    @Persisted var owner: User?
}
