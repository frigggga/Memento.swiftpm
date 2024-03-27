import Foundation
import AVFoundation
import MediaPlayer
import SwiftUI

var player: AVAudioPlayer!

// TODO: Play music

func play(_ sound: String) {
    let url = Bundle.main.url(forResource: sound, withExtension: "mp4")
    guard url != nil else {
        return
    }
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player.volume = 0.4
        if sound == "toEdinburgh"{
            player?.play()
            player.numberOfLoops = -1
        } else {
            player?.play()
        }
    } catch {
        print("error")
    }
}
