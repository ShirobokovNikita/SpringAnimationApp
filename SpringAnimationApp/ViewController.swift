//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Nikita Shirobokov on 23.11.22.
//

import Spring

class ViewController: UIViewController {
    

    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var springButton: SpringButton!
    @IBOutlet var springView: SpringView!
    
    private var animationSettings = AnimationSettings.createAnimation()
    private var animationIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        springView.layer.cornerRadius = 10
    }
    
    private func performAnimation(_ animation: AnimationSettings) {
        springView.animation = animation.preset.rawValue
        springView.curve = animation.curve.rawValue
        springView.delay = animation.delay
        springView.duration = animation.duration
        springView.force = animation.force
        springView.repeatCount = animation.repeatCount
        
        infoLabel.text = animation.getSettingsAsString()
        springView.animate()
    }
    
    private func updateButton(animationIndex index: Int) {
        springButton.setTitle("\(animationSettings[index].preset.rawValue)", for: .normal)
    }

    @IBAction func springButtonAction(_ sender: SpringButton) {
        
        let animation = animationSettings[animationIndex]
        performAnimation(animation)
        if animationIndex == animationSettings.count - 1 {
            animationIndex = 0
            updateButton(animationIndex: animationIndex)
        } else {
            animationIndex += 1
            updateButton(animationIndex: animationIndex)
        }
    }
}

