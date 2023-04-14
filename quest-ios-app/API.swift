//
//  API.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/13.
//

import Foundation

class API {
    static let shared = API()
    
    func fetchQuests(completion: @escaping ([Quest]) -> ()) {
        let url = URL(string: "https://salty-gorge-50730.herokuapp.com/quests")!
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                if let quests = try? decoder.decode([Quest].self, from: data){
                    DispatchQueue.main.async {
                        completion(quests)
                    }
                    
                    for quest in quests {
                        print("Title: \(quest.title)")
                    }
                }
            }
        }.resume()
    }
}

class QuestViewModel: ObservableObject {
    @Published var quests: [Quest] = []
    
    func fetchQuests() {
        API.shared.fetchQuests { quests in
            self.quests = quests
        }
    }
}
