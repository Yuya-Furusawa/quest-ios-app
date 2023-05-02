//
//  ChallengeModel.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/05/01.
//

struct Challenge: Codable, Identifiable {
    let id:String
    let name:String
    let description:String
    let quest_id:String
}
