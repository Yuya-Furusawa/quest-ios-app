//
//  ChallengeCard.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/22.
//

import SwiftUI

struct ChallengeCard: View {
    let challenge: Challenge
    
    var body: some View {
        VStack(alignment: .leading){
            Text(challenge.name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 1.0)
            
            Text(challenge.description)
                .font(.footnote)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .truncationMode(.tail)
                .padding(.bottom, 1.0)
        }
        .frame(maxWidth: .infinity)
        .padding(.all, 16.0)
        .border(/*@START_MENU_TOKEN@*/Color(red: 0.8980392156862745, green: 0.9058823529411765, blue: 0.9215686274509803)/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

struct ChallengeCard_Previews: PreviewProvider {
    static var previews: some View {
        let challenge = Challenge(
            id: "1",
            name: "スターバックス渋谷センター街店に行く",
            description: "スターバックス渋谷センター街店で買い物をして滞在する",
            quest_id: "LLi9PEyXneHRrm6Elny1I"
        )
        ChallengeCard(challenge: challenge)
            .padding()
    }
}
