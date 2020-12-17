//
//  ViewController.swift
//  RANDOM
//
//  Created by Henit Work on 12/12/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var HIT: UIButton!
    @IBOutlet weak var WelcomeI: UIImageView!
    
    @IBOutlet weak var firstBI: UIImageView!
    @IBOutlet weak var board: UILabel!
    
    
    
    var player: AVPlayer?
    var player1 : AVAudioPlayer?
    func playSound(soundname : String) {
        let url = Bundle.main.url(forResource: soundname, withExtension: "wav")

        do {
            player1 = try AVAudioPlayer(contentsOf: url!)
            guard player != nil else { return }

            player1?.prepareToPlay()
            player1?.play()

        } catch let error as NSError {
            print(error.description)
        }
    }

    
    

    
    
    
           
        

            func loadVideo() {

            //this line is important to prevent background music stop
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
            } catch { }

            let path = Bundle.main.path(forResource: "hhhh", ofType:"m4v")

            player = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
            let playerLayer = AVPlayerLayer(player: player)

            playerLayer.frame = self.view.frame
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            playerLayer.zPosition = -1

            self.view.layer.addSublayer(playerLayer)

            player?.seek(to: CMTime.zero)
            player?.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                playerLayer.opacity = 0
                
               
               
                    
                }
                
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo()
        WelcomeI.alpha = 0
        HIT.alpha = 0
        firstBI.alpha = 0
        board.alpha = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.playSound(soundname: "welcome")
            self.WelcomeI.alpha = 1
            self.HIT.alpha = 1
            self.firstBI.alpha = 1
            self.board.textColor = UIColor.init(cgColor:#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) )
            self.board.alpha = 1
            
            
            UIView.animate(withDuration: 0.3,
                animations: {
                    self.HIT.transform = CGAffineTransform(scaleX: 1, y: 0.9)
                    
                },
                completion: { _ in
                    UIView.animate(withDuration: 0.3) {
                        self.HIT.transform = CGAffineTransform.identity
                        
                    }
                })
           
            
            }
        
        
        
    }
    
   
    
    }

    
    
    




