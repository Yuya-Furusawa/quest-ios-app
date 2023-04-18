//
//  QuestCardList.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/09.
//

import SwiftUI

struct QuestCardList: View {
    @StateObject var viewModel = QuestViewModel()
    
    var body: some View {
        VStack{
            ScrollView {
                ForEach(viewModel.quests) { quest in
                    NavigationLink{
                        QuestDetail(quest: quest)
                    } label: {
                        QuestCard(quest: quest)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchQuests()
        }
    }
}

struct QuestCardList_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            QuestCardList()
        }
    }
}
