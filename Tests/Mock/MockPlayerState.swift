//
//  FakePlayerState.swift
//  RxAudioPlayerSMTests
//
//  Created by raphael ankierman on 28/02/2018.
//  Copyright © 2018 raphael ankierman. All rights reserved.
//

import Foundation
@testable
import ModernAVPlayer
import AVFoundation

final class MockPlayerState: PlayerState {
    var type: ModernAVPlayer.State
    var context: PlayerContextProtocol

    init(context: PlayerContextProtocol, state: ModernAVPlayer.State = .initialization) {
        self.context = context
        self.type = state
    }
    
    var loadMedialCallCount = 0
    var lastMediaParam: PlayerMediaProtocol?
    var lastShoudlPlayingParam: Bool?
    func loadMedia(media: PlayerMediaProtocol, shouldPlaying: Bool) {
        loadMedialCallCount += 1
        lastMediaParam = media
        lastShoudlPlayingParam = shouldPlaying
    }
    
    var playCallCount = 0
    func play() {
        playCallCount += 1
    }
    
    var pauseCallCount = 0
    func pause() {
        pauseCallCount += 1
    }
    
    var stopCallCount = 0
    func stop() {
        stopCallCount += 1
    }

    var seekCallCount = 0
    var lastPositionParam: Double?
    func seek(position: Double) {
        seekCallCount += 1
        lastPositionParam = position
    }
}
