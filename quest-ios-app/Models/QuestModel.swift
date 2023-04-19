//
//  QuestModel.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/20.
//

struct Quest: Codable, Identifiable {
    let id:String

    let title:String
    let description:String
    let difficulty:String
    let num_participate:Int
    let num_clear:Int
    let challenges: [Challenge]
}

struct Challenge: Codable, Identifiable {
    let id:String
    let name:String
    let description:String
    let quest_id:String
}