//
//  AudioManager.swift
//  Game1
//
//  Created by Александр Андреев on 08.08.2024.
//

import Foundation
import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    
    private var backgroundMusicPlayer: AVAudioPlayer?
    private var effectPlayers: [String: AVAudioPlayer] = [:]
    
    private init() {
        // Инициализация аудио менеджера
    }
    
    // MARK: - Background Music
    
    private func playBackgroundMusic(filename: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
            print("Could not find file: \(filename)")
            return
        }
        
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer?.numberOfLoops = -1 // Зацикливание
            backgroundMusicPlayer?.prepareToPlay()
            backgroundMusicPlayer?.play()
        } catch let error {
            print("Could not create audio player: \(error)")
        }
    }
    
    func startBackgroundMusic() {
        AudioManager.shared.playBackgroundMusic(filename: "backgroundMusic.mp3")
    }
    
    func stopBackgroundMusic() {
        backgroundMusicPlayer?.stop()
    }
    
    // MARK: - Sound Effects
    
    private func playEffect(filename: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
            print("Could not find file: \(filename)")
            return
        }
        
        do {
            let effectPlayer = try AVAudioPlayer(contentsOf: url)
            effectPlayers[filename] = effectPlayer
            effectPlayer.prepareToPlay()
            effectPlayer.play()
        } catch let error {
            print("Could not create audio player: \(error)")
        }
    }
    
    func stopEffect(filename: String) {
        if let effectPlayer = effectPlayers[filename] {
            effectPlayer.stop()
            effectPlayers.removeValue(forKey: filename)
        }
    }
    
    func ballMissedEffect() {
        AudioManager.shared.playEffect(filename: "ballMissed.mp3")
    }
    
    func ballBasketEffect() {
        AudioManager.shared.playEffect(filename: "ballBasket.mp3")
    }
    
    func buttonClickEffect() {
        AudioManager.shared.playEffect(filename: "buttonClick.mp3")
    }
    
    func gameOverEffect() {
        AudioManager.shared.playEffect(filename: "gameOver.wav")
    }
    
}
