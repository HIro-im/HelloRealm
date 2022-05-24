//
//  User.swift
//  HelloRealm
//
//  Created by 今橋浩樹 on 2022/05/25.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
