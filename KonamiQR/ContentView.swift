//
//  ContentView.swift
//  KonamiQR
//
//  Created by Atsushi Nagase on 2022/03/11.
//

import SwiftUI

struct ContentView: View {
    @State var inputUsername = ""
    @State var inputPassword = ""
    @State var username = UserDefaults.standard.string(forKey: "username")
    @State var password = UserDefaults.standard.string(forKey: "password")
    @State var url: KonamiURL = .qr
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        if
            let username = username,
            let password = password {
            WebView(url: url, username: username, password: password)
                .onChange(of: scenePhase) { newValue in
                    if newValue == .active {
                        url = .qr
                    }
                }
        } else {
            VStack(alignment: .center, spacing: 20) {
                TextField("Username", text: $inputUsername)
                    .padding(10)
                    .background(Color("TextFieldBackground"))
                SecureField("Password", text: $inputPassword)
                    .padding(10)
                    .background(Color("TextFieldBackground"))
                Button {
                    let d = UserDefaults.standard
                    d.set(inputUsername, forKey: "username")
                    d.set(inputPassword, forKey: "password")
                    d.synchronize()
                    username = inputUsername
                    password = inputPassword
                } label: {
                    Text("Login")
                }
            }.padding(20)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
