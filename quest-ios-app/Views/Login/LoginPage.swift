//
//  LoginPage.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/17.
//

import SwiftUI

struct LoginPage: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = UserViewModel()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            TextField("メールアドレス", text: $email)
                .padding()
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .border(Color.gray, width: 1)
            
            SecureField("パスワード", text: $password)
                .padding()
                .border(Color.gray, width: 1)
            
            Button(action: {
                Task {
                    let isValidated = await validate(email: email, password: password)
                    if isValidated {
                        // ログイン成功
                        loginUser()
                    } else {
                        // ログイン失敗
                        alertTitle = "ログイン失敗"
                        alertMessage = "メールアドレスまたはパスワードが正しくありません。"
                        showAlert = true
                    }
                }
            }) {
                Text("ログイン")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            })
        }
        .padding()
    }
    
    func validate(email: String, password: String) async -> Bool {
        await viewModel.login(email: email, password: password)
        return viewModel.user != nil
    }
    
    func loginUser() {
        appState.user = viewModel.user
        appState.isLoggedIn = true
        presentationMode.wrappedValue.dismiss()
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage().environmentObject(AppState())
    }
}

