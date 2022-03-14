//
//  ViewModel.swift
//  KonamiQR
//
//  Created by Atsushi Nagase on 2022/03/14.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var username: String?
    @Published var password: String?
    @Published var autoNavigate = true
    @Published var url: KonamiURL = .qrcode

    private var cancellables: Set<AnyCancellable> = []

    init() {
        let defaults = UserDefaults.standard
        defaults.register(defaults: ["autoNavigate": true])

        username = defaults.string(forKey: "username")
        password = defaults.string(forKey: "password")
        autoNavigate = defaults.bool(forKey: "autoNavigate")

        $autoNavigate.sink { value in
            defaults.set(value, forKey: "autoNavigate")
        }.store(in: &cancellables)

        $username.sink { value in
            defaults.set(value, forKey: "username")
        }.store(in: &cancellables)

        $password.sink { value in
            defaults.set(value, forKey: "password")
        }.store(in: &cancellables)
    }

    func logout() {
        username = nil
        password = nil
    }

}
