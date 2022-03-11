//
//  ContentView.swift
//  KonamiQR
//
//  Created by Atsushi Nagase on 2022/03/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WebView(url: KonamiURL.qr.url)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
