//
//  ContentView.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Header()
            Spacer(minLength: 15).fixedSize()
            QuestCard()
            Spacer(minLength: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
