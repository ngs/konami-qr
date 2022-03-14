//
//  ContentView.swift
//  KonamiQR
//
//  Created by Atsushi Nagase on 2022/03/11.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        if
            let username = viewModel.username,
            let password = viewModel.password {
            VStack {
                ActionBar(viewModel: viewModel)
                WebView(
                    url: viewModel.url,
                    username: username,
                    password: password,
                    autoNavigate: viewModel.autoNavigate)
                    .onChange(of: scenePhase) { newValue in
                        if newValue == .active && viewModel.autoNavigate {
                            viewModel.url = .qrcode
                        }
                    }
            }.onAppear {
                UserDefaults.standard.register(defaults: ["autoNavigate": true])
                viewModel.autoNavigate = UserDefaults.standard.bool(forKey: "autoNavigate")

            }
        } else {
            LoginForm(username: $viewModel.username, password: $viewModel.password)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
