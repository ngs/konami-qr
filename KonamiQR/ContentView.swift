//
//  ContentView.swift
//  KonamiQR
//
//  Created by Atsushi Nagase on 2022/03/11.
//

import SwiftUI

struct ContentView: View {
    @State var username = UserDefaults.standard.string(forKey: "username")
    @State var password = UserDefaults.standard.string(forKey: "password")
    @State var autoNavigate = UserDefaults.standard.bool(forKey: "autoNavigate")
    @State var url: KonamiURL = .qrcode
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        if
            let username = username,
            let password = password {
            VStack {
                Toggle("Auto Navigate", isOn: $autoNavigate)
                    .padding([.top, .bottom], 10)
                    .padding([.leading, .trailing], 20)
                WebView(
                    url: url,
                    username: username,
                    password: password,
                    autoNavigate: autoNavigate)
                    .onChange(of: scenePhase) { newValue in
                        if newValue == .active && autoNavigate {
                            url = .qrcode
                        }
                    }
            }.onAppear {
                UserDefaults.standard.register(defaults: ["autoNavigate": true])
            }
        } else {
            LoginForm(username: $username, password: $password)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
