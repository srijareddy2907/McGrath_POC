//
//  360VideoViewController.swift
//  McGrath_POC
//
//  Created by Avula Srinivasa Reddy on 09/08/21.
//

import UIKit
import AVKit
import Swifty360Player

class Video360ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    var swifty360ViewController: Swifty360ViewController!
       
    override func viewDidLoad() {
            super.viewDidLoad()

            let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "office_demo", ofType: "mp4")!)
            let player = AVPlayer(url: videoURL)

            let motionManager = Swifty360MotionManager.shared
            // set motionManager nil to skip motion changes
            swifty360ViewController = Swifty360ViewController(withAVPlayer: player, motionManager: motionManager)

            addChild(swifty360ViewController)
            videoView.addSubview(swifty360ViewController.view)
            swifty360ViewController.didMove(toParent: self)

            player.play()

            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(reorientVerticalCameraAngle))
            swifty360ViewController.view.addGestureRecognizer(tapGestureRecognizer)
        }

        @objc func reorientVerticalCameraAngle() {
            swifty360ViewController.reorientVerticalCameraAngleToHorizon(animated: true)
        }

    @IBAction func backButton(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
