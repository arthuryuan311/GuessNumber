//
//  GuessNumberViewController.swift
//  GuessNumber
//
//  Created by Ariel Tang on 2017/3/31.
//  Copyright © 2017年 ArthurYuan. All rights reserved.
//

import UIKit

class GuessNumberViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var up = "100"
    var low = "1"
    var randNum:UInt32 = arc4random_uniform(101)
    var answer = 29
    var times = 1
    
    @IBOutlet weak var guessNumber: UITextField!
    @IBOutlet weak var startAgain: UITextField!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func goButton(_ sender: Any) {
        let answer:Int = Int(randNum)
        if times < 6 {
            remainTimes.isHidden = false
            remainTimesText.isHidden = false
            range.isHidden = false
            remainTimes.text = "\(6 - times)"
            if Int(guessNumber.text!)! == answer {
                loss.isHidden = true
                win.isHidden = false
                range.text = ""
                remainTimesText.isHidden = true
                remainTimes.isHidden = true
                playAgainButton.isHidden = false
            }
            else {
                loss.isHidden = false
                win.isHidden = true
                if Int(guessNumber.text!)! > answer {
                    range.text = "range: \(low) - \(Int(guessNumber.text!)!)"
                    up = guessNumber.text!
                }
                else {
                    range.text = "range: \(Int(guessNumber.text!)!) - \(up)"
                    low = guessNumber.text!
                }
                guessNumber.text = ""
            }
            times += 1
        }
        else {
            startAgain.isHidden = false
            loss.isHidden = true
            playAgainButton.isHidden = false
            range.isHidden = true
            remainTimes.isHidden = true
            remainTimesText.isHidden = true
        }
        
    }
    
    @IBOutlet weak var remainTimes: UITextField!
    @IBOutlet weak var remainTimesText: UILabel!
    @IBOutlet weak var loss: UITextField!
    @IBOutlet weak var range: UITextField!
    @IBOutlet weak var win: UITextField!
    
    @IBAction func playAgain(_ sender: Any) {
        
        times = 1
        startAgain.isHidden = true
        remainTimes.text = "6"
        playAgainButton.isHidden = true
        up = "100"
        low = "1"
        guessNumber.text = ""
        win.isHidden = true
        randNum = arc4random_uniform(101)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
