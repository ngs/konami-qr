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
            LoginForm(username: $username, password: $password)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
