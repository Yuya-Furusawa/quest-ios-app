//
//  QuestDetail.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/08.
//

import SwiftUI

struct QuestDetail: View {
    let quest:Quest
    
    var body: some View {
        VStack(alignment: .leading){
            Text(quest.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 1.0)
            Text(quest.description)
                .foregroundColor(Color.gray)
                .padding(.bottom, 1.0)
            Text(quest.difficulty)
                .fontWeight(.bold)
                .padding(.bottom, 1.0)
            HStack {
                Text("参加人数：\(quest.num_participate)人")
                Text("クリア人数：\(quest.num_clear)人")
            }
            Spacer(minLength: 30).fixedSize()
            
            ForEach(quest.challenges){ challenge in
                ChallengeCard(challenge: challenge)
            }
        }
        .padding()
        
        Spacer(minLength: 10)
    }
}

struct QuestDetail_Preview: PreviewProvider {
    static var previews: some View {
        let challenge_1 = Challenge(
            id: "1",
            name: "スターバックス渋谷センター街店に行く",
            description: "スターバックス渋谷センター街店で買い物をして滞在する",
            quest_id: "LLi9PEyXneHRrm6Elny1I"
        )
        
        let challenge_2 = Challenge(
            id: "2",
            name: "STARBUCKS RESERVE ROASTERY TOKYOに行く",
            description: "STARBUCKS RESERVE ROASTERY TOKYOで買い物をして滞在する",
            quest_id: "LLi9PEyXneHRrm6Elny1I"
        )
        
        let quest = Quest(
            id: "1",
            title: "This is a test",
            description: "This is a test",
            difficulty: "Normal",
            num_participate: 12345,
            num_clear: 678,
            challenges: [challenge_1, challenge_2]
        )
        VStack {
            QuestDetail(quest: quest)
            Spacer(minLength: 10)
        }
    }
}
