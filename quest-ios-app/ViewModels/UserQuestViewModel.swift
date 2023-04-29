//
//  UserQuestViewModel.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/27.
//

import Foundation

struct ParticipateQuest: Codable {
    let user_id: String
    let quest_id: String
}

class UserQuestAPI {
    static let shared = UserQuestAPI()
    
    func participate(user_id: String, quest_id: String) async -> Result<UserQuest, APIError> {
        return await withCheckedContinuation{ continuation in
            let url = URL(string: "https://salty-gorge-50730.herokuapp.com/participate")!
            let participateQuest = ParticipateQuest(user_id: user_id, quest_id: quest_id)
            let jsonData = try? JSONEncoder().encode(participateQuest)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request){ (data, response, error ) in
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201, let data = data {
                    do {
                        let user_quest = try JSONDecoder().decode(UserQuest.self, from: data)
                        continuation.resume(returning: .success(user_quest))
                    } catch {
                        continuation.resume(returning: .failure(.unknown))
                    }
                } else {
                    continuation.resume(returning: .failure(.unknown))
                }
            }
            
            task.resume()
        }
    }
}

class UserQuestViewModel: ObservableObject {
    func participate(user_id: String, quest_id: String) async -> Bool {
        let result = await UserQuestAPI.shared.participate(user_id: user_id, quest_id: quest_id)
        switch result {
        case .success(_):
            return true
        case .failure(_):
            return false
        }
    }
}
