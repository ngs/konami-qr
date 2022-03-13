//
//  KonamiURL.swift
//  KonamiQR
//
//  Created by Atsushi Nagase on 2022/03/11.
//

import Foundation

let baseURL =  URL(string: "https://member.konamisportsclub.jp/")!

enum KonamiURL: String {
    case login = "login.php"
    case qrcode = "digital_memberscard_barcode.php"
    case myPage = "my_page.php"
    case error = "sp_error.php"

    init?(url: URL?) {
        guard let url = url else { return nil }
        self.init(rawValue: url.lastPathComponent)
    }

    var url: URL {
        return baseURL.appendingPathComponent(self.rawValue)
    }
}
