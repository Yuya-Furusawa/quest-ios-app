//
//  LogoutButton.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/22.
//

import SwiftUI

struct LogoutButton: View {
    @EnvironmentObject var appState: AppState
    @State private var showAlert: Bool = false
    
    var body: some View {
        Button(action: {
            self.showAlert = true
        }) {
            Text("LogOut")
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.125, green: 0.517, blue: 0.78))
                .padding(/*@START_MENU_TOKEN@*/.all, 8.0/*@END_MENU_TOKEN@*/)
                .background(.white)
                .border(Color(red: 0.125, green: 0.517, blue: 0.78), width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
        }
        .alert(isPresented: $showAlert, content: {
            Alert(
                title:Text("ログアウトしますか？"),
                primaryButton: .destructive(Text("ログアウト")) {
                    appState.user = nil
                    appState.isLoggedIn = false
                },
                secondaryButton: .cancel(Text("キャンセル"))
            )
        })
    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton()
    }
}
