//
//  ContentView.swift
//  AuthFirebase
//
//  Created by Sherozbek on 09/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    @State var email = ""
    @State var pswd = ""
    let fbmanager = FirebaseManager()
    @EnvironmentObject var appViewModel: AppViewModel
    var isSignUpDisabled: Bool {
        return name.isEmpty || email.isEmpty || pswd.isEmpty
    }
    var body: some View {
        VStack{
            TextField("Name", text: $name)
                .padding(10)
                .background()
                .cornerRadius(10)
            TextField("Email", text: $email)
                .padding(10)
                .background()
                .cornerRadius(10)
            
            TextField("Password", text: $pswd)
                .padding(10)
                .background()
                .cornerRadius(10)
            
            Button {
                guard !isSignUpDisabled else {
                    return
                }
                fbmanager.registerNewUser(user: UserData(name: name, email: email, password: pswd))
                UserDefaults.standard.set(true, forKey: "isLogin")
                appViewModel.isLogin = true
            }label: {
                Text("Sign Up")
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
    ContentView()
}
