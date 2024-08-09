//
//  ZeroViewController.swift
//  Game1
//
//  Created by Александр Андреев on 09.08.2024.
//

import Foundation
import UIKit
import WebKit

class ZeroViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var isPageLoaded = false

    init(urlString: String) {
        super.init(nibName: nil, bundle: nil)
        setupUI()
        setupUrl(urlString: urlString)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Страница загружена")
        isPageLoaded = true
    }
    
    private func setupUrl(urlString: String) {
        // Загрузка URL
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        } else if let url = URL(string: "https://www.google.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    private func setupUI() {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.websiteDataStore = WKWebsiteDataStore.default() //для сохранения куки
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        view.addSubview(webView)

        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

