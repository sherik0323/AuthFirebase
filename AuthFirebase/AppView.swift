//
//  AppView.swift
//  AuthFirebase
//
//  Created by Sherozbek on 12/12/23.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack{
            Text("App")
                .padding(10)
                .background()
                .cornerRadius(10)
            
            Button {
                UserDefaults.standard.set(false , forKey: "isLogin")
                appViewModel.isLogin = false
            } label: {
                Text("Sign Out")
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal, 20)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray)
        
    }
}

#Preview {
    AppView()
}
