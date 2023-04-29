//
//  UseQuestModel.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/29.
//

struct UserQuest: Codable, Identifiable {
    let id: Int
    let user_id: String
    let quest_id: String
}
