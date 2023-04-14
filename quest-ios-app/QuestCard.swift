//
//  QuestCard.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/08.
//

import Foundation
import SwiftUI

struct Quest: Codable, Identifiable {
    let id:String
    
    let title:String
    let description:String
    let difficulty:String
    let num_participate:Int
    let num_clear:Int
    let challenges: [Challenge]
}

struct Challenge: Codable, Identifiable {
    let id:String
    let name:String
    let description:String
    let quest_id:String
}

struct QuestCard: View {
    let quest: Quest
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text(quest.title)
                    .font(.title3)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 1.0)
                
                Text(quest.description)
                    .font(.callout)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .padding(.bottom, 1.0)
                
                Text(quest.difficulty)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.bottom, 1.0)
                
                HStack {
                    Text("参加人数：\(quest.num_participate)人")
                        .foregroundColor(Color.black)
                    Text("クリア人数：\(quest.num_clear)人")
                        .foregroundColor(Color.black)
                }
            }
            .padding(.all, 16.0)
            .border(/*@START_MENU_TOKEN@*/Color(red: 0.8980392156862745, green: 0.9058823529411765, blue: 0.9215686274509803)/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            Spacer(minLength: 10)
        }
        
    }
}

struct QuestCard_Preview: PreviewProvider {
    static var previews: some View {
        let quest = Quest(
            id: "1",
            title: "This is a test",
            description: "This is a test",
            difficulty: "Normal",
            num_participate: 12345,
            num_clear: 678,
            challenges: []
        )
        QuestCard(quest: quest)
    }
}
