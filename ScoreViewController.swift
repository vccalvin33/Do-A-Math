//
//  ScoreViewController.swift
//  Do-A-Math
//
//  Created by Vincentius Calvin on 17/03/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var hs1 = [["Calvin",0]]
    var usr = ["nama"]
    var highscore = [[0],[0],[0],[0]]
    var username = ""
    var levelinput = 0
    var highscore1 = 0
    var highscore2 = 0
    var highscore3 = 0
    var highscore4 = 0

    @IBOutlet weak var highScore1: UILabel!
    @IBOutlet weak var highScore2: UILabel!
    @IBOutlet weak var highScore3: UILabel!
    @IBOutlet weak var highScore4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for lists in highscore[levelinput-1]{
            if lists > highscore1 {
                highscore1 = lists
            } else if lists > highscore2{
                highscore2 = lists
            }else if lists > highscore3{
                highscore3 = lists
            }else{
                highscore4 = lists
            }
        }
        highScore1.text = "\(username) - \(highscore1)"
        highScore2.text = "\(username) - \(highscore2)"
        highScore3.text = "\(username) - \(highscore3)"
        highScore4.text = "\(username) - \(highscore4)"
        if (highscore[levelinput-1].count-1) < 2{
            highScore2.isHidden = true
            highScore3.isHidden = true
            highScore4.isHidden = true
        } else if (highscore[levelinput-1].count-1) == 2{
            
            highScore3.isHidden = true
            highScore4.isHidden = true
        } else if (highscore[levelinput-1].count-1) == 3{
          
            highScore4.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func restartButton(_ sender: Any) {
        performSegue(withIdentifier: "toRestart", sender: self)
    }
    
    @IBAction func homeButton(_ sender: Any) {
        performSegue(withIdentifier: "toChooseLevelAgain", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let restartView = segue.destination as? ViewController
        let homeView = segue.destination as? ChooseLevelViewController
        
        restartView?.username = username
        restartView?.highscore = highscore
        restartView?.levelinput = levelinput
        
        homeView?.username = username
        homeView?.highscore = highscore
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
