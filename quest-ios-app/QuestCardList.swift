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
        NavigationView{
            VStack{
                ScrollView {
                    ForEach(viewModel.quests) { quest in
                        NavigationLink(destination: QuestDetail(quest: quest)){
                            QuestCard(quest: quest)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchQuests()
        }
    }
}

struct QuestCardList_Preview: PreviewProvider {
    static var previews: some View {
        QuestCardList()
    }
}
