//
//  QuestDetail.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/08.
//

import SwiftUI

struct QuestDetail: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel = ChallengeViewModel()
    let quest:Quest
    
    @State var isParticipated: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(quest.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 1.0)
                
                Spacer(minLength: 10)
                
                if appState.isLoggedIn {
                    if isParticipated {
                        Text("参加中")
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.23921568627450981, green: 0.7568627450980392, blue: 0.5568627450980392))
                            .padding(/*@START_MENU_TOKEN@*/.all, 6.0/*@END_MENU_TOKEN@*/)
                            .border(/*@START_MENU_TOKEN@*/Color(red: 0.23921568627450981, green: 0.7568627450980392, blue: 0.5568627450980392)/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .cornerRadius(/*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
                    } else {
                        ParticipateButton(user: appState.user!, quest: quest, isParticipated: $isParticipated)
                    }
                }
            }
            .onAppear{
                if appState.user != nil {
                    isParticipated = (appState.user?.participate_quest.contains { element in
                        element.id == quest.id
                    }) != false
                }
            }
            
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
            
            ForEach(viewModel.challenges){ challenge in
                ChallengeCard(challenge: challenge)
            }
            .onAppear {
                viewModel.fetchChallenges(id: quest.id)
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
            QuestDetail(quest: quest).environmentObject(AppState())
            Spacer(minLength: 10)
        }
    }
}
