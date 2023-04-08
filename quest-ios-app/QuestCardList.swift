//
//  QuestCardList.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/09.
//

import SwiftUI

struct QuestCardList: View {
    let quests:[Quest] = [
        Quest(
            id: 1,
            title: "This is a test",
            description: "This is a test",
            difficulty: "Normal",
            num_participate: 12345,
            num_clear: 678
        ),
        Quest(
            id: 2,
            title: "This is a test",
            description: "This is a test",
            difficulty: "Normal",
            num_participate: 12345,
            num_clear: 678
        ),
        Quest(
            id: 3,
            title: "This is a test",
            description: "This is a test",
            difficulty: "Normal",
            num_participate: 12345,
            num_clear: 678
        ),
        Quest(
            id: 4,
            title: "This is a test",
            description: "This is a test",
            difficulty: "Normal",
            num_participate: 12345,
            num_clear: 678
        ),
        Quest(
            id: 5,
            title: "This is a test",
            description: "This is a test",
            difficulty: "Normal",
            num_participate: 12345,
            num_clear: 678
        )
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView {
                    ForEach(quests) { quest in
                        NavigationLink(destination: QuestDetail(quest: quest)){
                            QuestCard(quest: quest)
                        }
                    }
                }
                
            }
            
        }
    }
}

struct QuestCardList_Preview: PreviewProvider {
    static var previews: some View {
        QuestCardList()
    }
}
