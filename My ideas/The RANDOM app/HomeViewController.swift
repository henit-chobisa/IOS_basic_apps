//
//  HomeViewController.swift
//  
//
//  Created by Henit Work on 12/12/20.
//

import UIKit
import AVFoundation
var player: AVAudioPlayer?


class HomeViewController: UIViewController {
    var color : CGColor = #colorLiteral(red: 0, green: 1, blue: 0.8440468907, alpha: 1)
    var k: String = ""
    var l: String = ""
   
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var falsebutton: UIButton!
    @IBOutlet weak var truebutton: UIButton!
    let quiz = [Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")]
    var questionN = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        question.textColor = UIColor.white
        updateUI()
        

        // Do any additional setup after loading the view.
    }
    @IBAction func `true`(_ sender: UIButton) {
        if sender.currentTitle == quiz[questionN].answer{
            k = "wow"
            l = "mp3"
            
            color = #colorLiteral(red: 0, green: 1, blue: 0.2240906656, alpha: 1)
            
            
        }else{
            k = "no"
            l = "wav"
            
            
            color = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            
            
            
        }
        
        if questionN < quiz.count - 1{
            questionN = questionN + 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                
                self.updateUI()
            }
        }
        else{
            questionN = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                self.updateUI()
                
            }
            
        }
        
    
    }
    func updateUI(){
        question.text = quiz[questionN].text
        
        
        
        
    }
    func cornerRadius(view1: UIView, radius: CGFloat = 10) {
        view1.layer.cornerRadius = radius
    }
    
    func showAnimation() {
        let pulse = PulseAnimation(numberOfPulse: 1, radius: 200, postion: self.view.center)
        pulse.animationDuration = 1.0
        pulse.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0.9473536611, alpha: 1)
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
    }
    func playSound(soundname : String , format : String) {
        let url = Bundle.main.url(forResource: soundname, withExtension: format)

        do {
            player = try AVAudioPlayer(contentsOf: url!)
            guard let player = player else { return }

            player.prepareToPlay()
            player.play()

        } catch let error as NSError {
            print(error.description)
        }
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        
    @IBAction func truebuttonpressed(_ sender: UIButton) {
        playSound(soundname: k, format: l)
        let pulse = PulseAnimation(numberOfPulse: 1, radius: 250, postion: sender.center)
        
        pulse.animationDuration = 0.3
        pulse.backgroundColor = color
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
    }
    
    @IBAction func falsebuttonpressed(_ sender: Any) {
        playSound(soundname: k, format: l)
        let pulse = PulseAnimation(numberOfPulse: 1, radius: 250, postion: (sender as AnyObject).center)
        pulse.animationDuration = 0.3
        pulse.backgroundColor = color
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
       
        
    }
    

}
