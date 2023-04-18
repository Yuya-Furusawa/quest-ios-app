//
//  LoginButton.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/17.
//

import SwiftUI

struct LoginButton: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationLink{
            LoginPage()
        } label: {
            Text("LogIn")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(/*@START_MENU_TOKEN@*/.all, 8.0/*@END_MENU_TOKEN@*/)
                .background(Color(red: 0.125, green: 0.517, blue: 0.78))
                .cornerRadius(/*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            LoginButton()
        }
    }
}
