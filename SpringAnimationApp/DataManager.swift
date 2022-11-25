//
//  SpringConstruction.swift
//  SpringAnimationApp
//
//  Created by Nikita Shirobokov on 23.11.22.
//

import Spring

class DataManager {
    
    static let shared = DataManager()
    
    let presets: [Spring.AnimationPreset] = [.Shake, .Pop, .FlipX, .SlideDown, .FadeIn]
    let curves: [Spring.AnimationCurve] = [.EaseInOut, .EaseIn, .EaseInOutQuad, .EaseInQuad, .EaseInCirc]
    let delays: [CGFloat] = [0.1, 0.2, 0.3, 0.4, 0.5]
    let durations: [CGFloat] = [1.0, 1.5, 2.0, 2.5, 3.0]
    let forces: [CGFloat] = [1.2, 1.7, 2.2, 2.7, 3.2]
    let repeatCounts: [Float] = [1, 2, 3, 4, 5]
}
