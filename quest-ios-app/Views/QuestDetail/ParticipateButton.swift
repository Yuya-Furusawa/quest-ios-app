//
//  ParticipateButton.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/27.
//

import SwiftUI

struct ParticipateButton: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel = UserQuestViewModel()
    let user: User
    let quest: Quest
    
    var body: some View {
        Button(action: {
            Task{
                let result = await viewModel.participate(user_id: user.id, quest_id: quest.id)
                if result {
                    appState.user?.participate_quest.append(quest)
                }
            }
        }){
            Text("参加する")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                .border(/*@START_MENU_TOKEN@*/Color(red: 0.125, green: 0.5176470588235295, blue: 0.7803921568627451)/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.12549019607843137, green: 0.5176470588235295, blue: 0.7803921568627451)/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/6.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ParticipateButton_Previews: PreviewProvider {
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
        ParticipateButton(user: user, quest: quest).environmentObject(AppState())
    }
}
