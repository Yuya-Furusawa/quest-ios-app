//
//  AppState.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/18.
//

import Combine

class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
}
