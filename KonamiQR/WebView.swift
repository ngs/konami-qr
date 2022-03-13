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

    var url: KonamiURL
    var username: String
    var password: String
    let webViewDelegate = WebViewDelegate()
    var webView: WKWebView? = nil

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webViewDelegate.username = username
        webViewDelegate.password = password
        webView.navigationDelegate = webViewDelegate
        let request = URLRequest(url: url.url)
        webView.load(request)
    }
}

class WebViewDelegate: NSObject {
    var username = ""
    var password = ""

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
