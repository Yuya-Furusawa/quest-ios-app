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
    var participate_quest: [QuestFromRow]
}

struct QuestFromRow: Codable, Identifiable {
    let id: String
    let title:String
    let description:String
    let difficulty:String
    let num_participate:Int
    let num_clear:Int
}
