//
//  ContentView.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/08.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appState = AppState()
    
    var body: some View {
        NavigationStack {
            VStack {
                Header()
                Spacer(minLength: 0).fixedSize()
                QuestCardList()
                Spacer(minLength: 10)
            }
        }
        .environmentObject(appState)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
