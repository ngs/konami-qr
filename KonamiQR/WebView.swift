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
    var autoNavigate: Bool
    var webView: WKWebView?
    var webViewDelegate = WebViewDelegate() // swiftlint:disable:this all

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.navigationDelegate = webViewDelegate
        webViewDelegate.username = username
        webViewDelegate.password = password
        webViewDelegate.autoNavigate = autoNavigate
        let request = URLRequest(url: url.url)
        webView.load(request)
    }
}

class WebViewDelegate: NSObject {
    var username = ""
    var password = ""
    var autoNavigate = true

    func login(webView: WKWebView) {
        webView.evaluateJavaScript("""
            document.getElementById('username').value = '\(username)';
            document.getElementById('password').value = '\(password)';
            document.getElementById('formLogin').submit();
        """)
    }
}

extension WebViewDelegate: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if !autoNavigate {
            return
        }
        guard let url = KonamiURL(url: webView.url) else {
            webView.load(konami: .qrcode)
            return
        }

        switch url {
        case .qrcode:
            return
        case .login:
            login(webView: webView)
        case .error:
            webView.load(konami: .login)
        }
    }
}

extension WKWebView {
    func load(konami: KonamiURL) {
        load(URLRequest(url: konami.url))
    }
}
