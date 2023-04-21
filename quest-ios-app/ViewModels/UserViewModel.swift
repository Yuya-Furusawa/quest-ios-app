//
//  UserViewModel.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/20.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let password: String
}

enum APIError: Error {
    case unknown
}

class UserAPI {
    static let shared = UserAPI()
    
    func login(email: String, password: String) async -> Result<User, APIError> {
        return await withCheckedContinuation { continuation in
            let url = URL(string: "https://salty-gorge-50730.herokuapp.com/login")!
            let loginRequest = LoginRequest(email: email, password: password)
            let jsonData = try? JSONEncoder().encode(loginRequest)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201, let data = data {
                    do {
                        let user = try JSONDecoder().decode(User.self, from: data)
                        continuation.resume(returning: .success(user))
                    } catch {
                        continuation.resume(returning: .failure(.unknown))
                    }
                } else {
                    continuation.resume(returning: .failure(.unknown))
                }
            }
            
            task.resume()
        }
    }
}

class UserViewModel: ObservableObject {
    @Published var user: User? = nil
    
    func login(email: String, password: String) async {
        let result = await UserAPI.shared.login(email: email, password: password)
        DispatchQueue.main.async {
            switch result {
            case .success(let user):
                self.user = user
            case .failure(_):
                self.user = nil
            }
        }
    }
}
