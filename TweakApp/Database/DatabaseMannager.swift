//
//  DatabaseMannager.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 09/01/22.
//

import Foundation
import FirebaseDatabase
final class DatabaseMannager{
    
    static let shared = DatabaseMannager()
    private let database = Database.database().reference()
    
    func insertUser(with user: User){
        database.child(user.fullname).setValue([
            "full_name": user.fullname,
            "email" : user.emailAddress,
            "password" : user.password
        ])
    }
    
    
}
