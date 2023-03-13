//
//  ViewController.swift
//  testRealm
//
//  Created by Мира Зейнурова on 13.02.2023.
//

import UIKit
import RealmSwift
import Realm
import SnapKit

class ViewController: UIViewController {

    let realManager = RealmManager.shared
//    let realm = try! Realm()
    
    var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let users: Results<User>
        let dog = Pet()
        dog.name = "guf"
        print(dog)
        realManager.saveData(name: "Michael", surname: "Jackson", age: 36, pets: [dog])
        let usersData = realManager.getData()
        print(usersData)
        
        realManager.updateSchema()
        print(usersData[9].pets)
       
        view.addSubview(label)
        label.text = usersData[2].surname! + "\(usersData[30].pets[0].name ?? "Not found")"
        label.snp.makeConstraints { make in
            make.height.equalTo(400)
            make.width.equalTo(400)
            make.top.equalToSuperview().offset(250)
            make.leading.equalToSuperview().offset(100)
        }
        
        
//        realManager.saveData(name: "Mira", surname: "Zeynurova", age: 25)
//        print(realManager.getData())
//        var user = users[0]
//        var dog = Pet()
//        dog.name = "Sky"
//        try! realm.write({
//            user.pets.append(dog)
//        })
        
    }
}

