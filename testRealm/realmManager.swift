//
//  realmManager.swift
//  testRealm
//
//  Created by Мира Зейнурова on 13.02.2023.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    
    func saveData(name: String,surname:String, age: Int, pets: [Pet]) {
            let config = Realm.Configuration(schemaVersion: 2)
            Realm.Configuration.defaultConfiguration = config
            let realm = try! Realm()
            let user = User(name: name, surname: surname, age: age, pets: pets)
            try! realm.write({
                realm.add(user)
            })
        }
    
    func updateSchema() {
        let config = Realm.Configuration(schemaVersion: 2)
            Realm.Configuration.defaultConfiguration = config
        _ = try! Realm()
//        let user = User(name: name, surname: surname, age: age, pets: pets)
//        try! realm.write({
//            realm.add(user)
//        })
    }

    
    func getData() -> Results<User> {
        let config = Realm.Configuration(schemaVersion: 2)
            Realm.Configuration.defaultConfiguration = config
        let realm = try! Realm()
       let data = realm.objects(User.self)
        return data
    }
//
//    func deleteAll(){
//       try! realm.write {
//            realm.deleteAll()
//        }
//    }
}
