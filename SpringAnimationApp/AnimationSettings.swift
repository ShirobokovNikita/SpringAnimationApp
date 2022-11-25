//
//  AnimationSettings.swift
//  SpringAnimationApp
//
//  Created by Nikita Shirobokov on 24.11.22.
//

import Spring

enum Option: String {
    
    case Preset = "Preset"
    case Curve = "Curve"
    case Delay = "Delay"
    case Duration = "Duration"
    case Force = "Force"
    case Repeat = "Repeat"
}

struct AnimationSettings {
    
    var preset: Spring.AnimationPreset
    var curve: Spring.AnimationCurve
    var delay: CGFloat
    var duration: CGFloat
    var force: CGFloat
    var repeatCount: Float
    
    static func createAnimation() -> [AnimationSettings] {
        
        let presets = DataManager.shared.presets.shuffled()
        let curves = DataManager.shared.curves.shuffled()
        let delays = DataManager.shared.delays.shuffled()
        let durations = DataManager.shared.durations.shuffled()
        let forces = DataManager.shared.forces.shuffled()
        let repeatCounts = DataManager.shared.repeatCounts.shuffled()
        
        var animations = [AnimationSettings]()
        
        for index in 0 ..< presets.count {
            let input = AnimationSettings(preset: presets[index],
                                           curve: curves[index],
                                           delay: delays[index],
                                           duration: durations[index],
                                           force: forces[index],
                                           repeatCount: repeatCounts[index])
            animations.append(input)
        }
        return animations
    }
    
    func getSettingsAsString() -> String {
        let settings = "\(getOptionAsString(Option.Preset, preset.rawValue) + getOptionAsString(Option.Curve, curve.rawValue) + getOptionAsString(Option.Delay, "\(delay)") + getOptionAsString(Option.Duration, "\(duration)") + getOptionAsString(Option.Force, "\(force)") + getOptionAsString(Option.Repeat, "\(repeatCount)"))"
        return settings
    }
    
    private func getOptionAsString(_ optionName: Option, _ optionValue: String) -> String {
        switch optionName {
        case .Preset:
            return "\(Option.Preset.rawValue): \(optionValue)\n"
        case .Curve:
            return "\(Option.Curve.rawValue): \(optionValue)\n"
        case .Delay:
            return "\(Option.Delay.rawValue): \(optionValue)\n"
        case .Duration:
            return "\(Option.Duration.rawValue): \(optionValue)\n"
        case .Force:
            return "\(Option.Force.rawValue): \(optionValue)\n"
        case .Repeat:
            return "\(Option.Repeat.rawValue): \(optionValue)\n"
        }
    }
}





