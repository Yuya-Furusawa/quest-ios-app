//
//  QuestViewModel.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/13.
//

import Foundation

class QuestAPI {
    static let shared = QuestAPI()

    func fetchQuests(completion: @escaping ([Quest]) -> ()) {
        let url = URL(string: "https://salty-gorge-50730.herokuapp.com/quests")!

        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                if let quests = try? decoder.decode([Quest].self, from: data){
                    DispatchQueue.main.async {
                        completion(quests)
                    }
                }
            }
        }.resume()
    }
}

class QuestViewModel: ObservableObject {
    @Published var quests: [Quest] = []

    func fetchQuests() {
        QuestAPI.shared.fetchQuests { quests in
            self.quests = quests
        }
    }
}
