//
//  UserModel.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/20.
//

struct User: Codable, Identifiable {
    let id: String
    let username: String
    let email: String
    let password: String
    var participate_quest: [Quest]
}
