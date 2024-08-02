//
//  LoadingViewController.swift
//  Game1
//
//  Created by Александр Андреев on 02.08.2024.
//

import Foundation
import UIKit

class LoadingViewController: UIViewController {
    
    private let background: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Resources.Back.mainBackground)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Resources.Images.crazyBallImage))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .white
        progressView.trackTintColor = .clear
        progressView.setProgress(0.0, animated: false)
        progressView.makeBorders(width: 4)
        progressView.makeBordersColor(color: Resources.Colors.darkRedColor.cgColor)
        return progressView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        DispatchQueue.main.async {
            self.applyGradientToProgressBarTrack()
            self.startLoadingAnimation()
        }
    }

    private func setupSubviews() {
        view.addSubview(background)
        view.addSubview(logoImageView)
        view.addSubview(progressBar)
    }
    
    
    private func applyGradientToProgressBarTrack() {
        // Создание градиентного слоя
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Resources.Colors.redGradientColor2.cgColor,
                                        Resources.Colors.redGradientColor1.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: progressBar.bounds.width, height: progressBar.bounds.height)
        gradientLayer.cornerRadius = 8 // Закругление углов градиента
        
        let trackLayer = CALayer()
        trackLayer.frame = progressBar.bounds
        trackLayer.addSublayer(gradientLayer)
        progressBar.layer.insertSublayer(trackLayer, at: 0)
        
        progressBar.layer.cornerRadius = 8
        progressBar.layer.masksToBounds = true
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 188),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
            logoImageView.widthAnchor.constraint(equalToConstant: 291),
            logoImageView.heightAnchor.constraint(equalToConstant: 238),
            
            progressBar.widthAnchor.constraint(equalToConstant: 320),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            progressBar.heightAnchor.constraint(equalToConstant: 23),
        ])
    }

    private func startLoadingAnimation() {
        progressBar.setProgress(0.0, animated: false)
        UIView.animate(withDuration: 4.0, animations: {
            self.progressBar.setProgress(1.0, animated: true)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.presentMainContent()
        }
    }
    
    private func presentMainContent() {
        // Переход на основной экран или загрузка основной информации
        let mainViewController = MainViewController() // Ваш основной контроллер
        mainViewController.modalTransitionStyle = .crossDissolve
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: true, completion: nil)
    }
}
