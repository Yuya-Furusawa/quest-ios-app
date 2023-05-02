//
//  ChallengeViewModel.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/05/01.
//

import Foundation

class ChallengeAPI {
    static let shared = ChallengeAPI()
    
    func fetchChallanges(id: String, completion: @escaping ([Challenge]) -> ()) {
        let url = URL(string: "https://salty-gorge-50730.herokuapp.com/challenges?quest_id=\(id)")!

        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                if let challenges = try? decoder.decode([Challenge].self, from: data){
                    DispatchQueue.main.async {
                        completion(challenges)
                    }
                }
            }
        }.resume()
    }
}

class ChallengeViewModel: ObservableObject {
    @Published var challenges: [Challenge] = []
    
    func fetchChallenges(id: String) {
        ChallengeAPI.shared.fetchChallanges(id: id) { challenges in
            self.challenges = challenges
        }
    }
}
