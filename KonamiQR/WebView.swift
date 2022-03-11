//
//  WebView.swift
//  KonamiQR
//
//  Created by Atsushi Nagase on 2022/03/11.
//

import Foundation
import UIKit
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    var url: URL
    let webViewDelegate = WebViewDelegate()

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
        webView.navigationDelegate = webViewDelegate
    }
}

class WebViewDelegate: NSObject {
    func login(webView: WKWebView) {
        webView.evaluateJavaScript("document.getElementById('username').value = '\(username)'; document.getElementById('password').value = '\(password)'; document.getElementById('formLogin').submit()")
    }
}

extension WebViewDelegate: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let url = KonamiURL(url: webView.url) else { return }

        switch url {
        case .login:
            login(webView: webView)
        case .error:
            webView.load(konami: .login)
        case .myPage:
            webView.load(konami: .qr)
        default:
            return
        }
    }
}

extension WKWebView {
    func load(konami: KonamiURL) {
        load(URLRequest(url: konami.url))
    }
}
