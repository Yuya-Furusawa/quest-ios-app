//
//  ParticipateButton.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/27.
//

import SwiftUI
import Combine

struct ParticipateButton: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel = UserQuestViewModel()
    @State var showModal = false
    let user: User
    let quest: Quest
    @Binding var isParticipated: Bool
    
    var body: some View {
        Button(action: {
            showModal = true
        }){
            Text("参加する")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.all, 9.0)
                .border(Color(red: 0.125, green: 0.5176470588235295, blue: 0.7803921568627451), width: 3)
                .background(Color(red: 0.12549019607843137, green: 0.5176470588235295, blue: 0.7803921568627451))
                .cornerRadius(6.0)
        }
        .alert(isPresented: $showModal, content: {
            Alert(title: Text("クエスト（\(quest.title)）に参加しました！"), dismissButton: .default(Text("OK"), action: {
                Task {
                    let result = await viewModel.participate(user_id: user.id, quest_id: quest.id)
                    if result {
                        appState.user?.participate_quest.append(
                            QuestFromRow(
                                id: quest.id,
                                title: quest.title,
                                description: quest.description,
                                difficulty: quest.difficulty,
                                num_participate: quest.num_participate,
                                num_clear: quest.num_clear
                            )
                        )
                        isParticipated = true
                    }
                }
            }))
        })
    }
}

struct ParticipateButton_Previews: PreviewProvider {
    @State static private var isParticipated = false
    
    static var previews: some View {
        let user = User(
            id: "1",
            username: "Test User",
            email: "test@test.com",
            password: "password",
            participate_quest: []
        )
        let quest = Quest(
            id: "1",
            title: "This is a test",
            description: "This is a test",
            difficulty: "Normal",
            num_participate: 12345,
            num_clear: 678,
            challenges: []
        )
        ParticipateButton(user: user, quest: quest, isParticipated: $isParticipated).environmentObject(AppState())
    }
}
