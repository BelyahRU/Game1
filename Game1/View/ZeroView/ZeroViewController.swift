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

    // MARK: - Properties
    var webView: WKWebView!
    var isPageLoaded = false

    // MARK: - Initialize
    init(urlString: String) {
        super.init(nibName: nil, bundle: nil)
        setupUI()
        setupUrl(urlString: urlString)
        observeScreenCapture()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Methods
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Страница загружена")
        isPageLoaded = true
    }

    private func setupUrl(urlString: String) {
        // Загрузка URL
        print(urlString)
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
    
    private func observeScreenCapture() {
        NotificationCenter.default.addObserver(self, selector: #selector(didDetectScreenCapture), name: UIScreen.capturedDidChangeNotification, object: nil)
    }
    
    @objc private func didDetectScreenCapture() {
        if UIScreen.main.isCaptured {
            webView.isHidden = true
            showAlert()
        } else {
            webView.isHidden = false
        }
    }

    private func showAlert() {
        let alert = UIAlertController(title: "Screen Capture Detected", message: "Screen recording or screenshot is not allowed in this app.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIScreen.capturedDidChangeNotification, object: nil)
    }
}
