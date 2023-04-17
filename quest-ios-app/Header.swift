//
//  Header.swift
//  quest-ios-app
//
//  Created by 古澤優也 on 2023/04/08.
//

import SwiftUI

struct Header: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack{
            HStack(alignment: .center){
                Spacer()
                
                Text("Quest App")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 0.125, green: 0.517, blue: 0.78))
                
                Spacer()
            }
            
            HStack(alignment: .center){
                Spacer()
                
                LoginButton()
                
            }
            .padding(.trailing)
        }
        Divider()
    }
}

struct Header_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            NavigationView{
                Header()
            }
            Spacer(minLength: 10)
        }
    }
}
