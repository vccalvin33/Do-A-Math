//
//  ViewController.swift
//  Nano 1
//
//  Created by Vincentius Calvin on 04/03/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet weak var timeBar: UIImageView!
    @IBOutlet weak var tempView: UIView!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button9: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var ButtonComma: UIButton!
    @IBOutlet weak var Button0: UIButton!
    @IBOutlet weak var ViewButton: UIView!
    @IBOutlet weak var ViewAnswer: UIView!
    @IBOutlet weak var AnswerBox: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var delButton: UIButton!
    @IBOutlet weak var ViewSubmit: UIView!
    @IBOutlet weak var HiddenAnswerBox: UILabel!
    @IBOutlet weak var QuestionView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var Number2: UILabel!
    @IBOutlet weak var equationlabel: UILabel!
    @IBOutlet weak var Number1: UILabel!
    @IBOutlet weak var life1: UIImageView!
    @IBOutlet weak var life2: UIImageView!
    @IBOutlet weak var life3: UIImageView!
    @IBOutlet weak var timerlabel: UILabel!
    
    var answer = ""
    var a = 0
    var b = 0
    var equation = 0
    var answerkey = 0
    var score = 0
    var falseans = 0
    var counter = 10
    
    var levelinput = 0
    var username = ""
    var highscore = [[0],[0],[0],[0]]
    
    //var timebarwidth = 374
    
    func showAlert() {
        let alert = UIAlertController(title: "GAME OVER", message: "Play Again?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes!", style: .default, handler: { action in
            self.counter = 10
            self.life1.isHidden = false
            self.life3.isHidden = false
            self.life2.isHidden = false
            self.answer = ""
            self.falseans = 0
            self.score = 0
            self.scoreLabel.text = "\(self.score)"
            self.AnswerBox.text = ""
            self.HiddenAnswerBox.isHidden = false
       })
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tempOperation()
    {
        Number1.text = String(0)
        Number2.text = String(0)
        equationlabel.text = "+"
        timerlabel.text = String(0)
    }
    
    func equationgenerator(_ score: Int, _ a: Int, _ b: Int) -> Int
    {
        
        equation = Int.random(in: 1...100)
        switch score{
        case 0...20:
            if equation <= 40{
                equationlabel.text = "+"
                answerkey = a+b
                Number1.text = String(a)
                Number2.text = String(b)
                
            } else if equation > 40 && equation <= 80{
                equationlabel.text = "-"
                answerkey = a-b
                Number1.text = String(a)
                Number2.text = String(b)
                
            } else if equation > 80 && equation <= 90{
                equationlabel.text = "x"
                answerkey = a*b
                Number1.text = String(a)
                Number2.text = String(b)
                
            } else {
                equationlabel.text = ":"
                answerkey = a*b
                Number1.text = String(answerkey)
                Number2.text = String(a)
                answerkey = b
            }
        case 21...40:
            if equation <= 30{
                equationlabel.text = "+"
                answerkey = a+b
                Number1.text = String(a)
                Number2.text = String(b)
                
            } else if equation > 30 && equation <= 60{
                equationlabel.text = "-"
                answerkey = a-b
                Number1.text = String(a)
                Number2.text = String(b)
                
            } else if equation > 60 && equation <= 80{
                equationlabel.text = "x"
                answerkey = a*b
                Number1.text = String(a)
                Number2.text = String(b)
                
            } else {
                equationlabel.text = ":"
                answerkey = a*b
                Number1.text = String(answerkey)
                Number2.text = String(a)
                answerkey = b
            }
        default:
            if equation <= 25{
                equationlabel.text = "+"
                answerkey = a+b
                Number1.text = String(a)
                Number2.text = String(b)
                
            } else if equation > 25 && equation <= 50{
                equationlabel.text = "-"
                answerkey = a-b
                Number1.text = String(a)
                Number2.text = String(b)
                
            } else if equation > 50 && equation <= 75{
                equationlabel.text = "x"
                answerkey = a*b
                Number1.text = String(a)
                Number2.text = String(b)
                
            } else {
                equationlabel.text = ":"
                answerkey = a*b
                Number1.text = String(answerkey)
                Number2.text = String(a)
                answerkey = b
            }
        }
        return answerkey
    }
    
    func randomizer(_ score: Int = 0,_ level: Int) -> (Int, Int)
    {
        switch level{
        case 1:
            a = Int.random(in: 2...10)
            b = Int.random(in: 2...a)

        case 2:
            a = Int.random(in: 11...30)
            b = Int.random(in: 11...a)

        case 3:
            a = Int.random(in: 31...50)
            b = Int.random(in: 31...a)
    
        default:
            falseans = 2
            life3.isHidden = true
            life2.isHidden = true
            if score <= 15{
                a = Int.random(in: 2...10)
                b = Int.random(in: 2...a)

                
            } else if score > 15 && score <= 40{
                a = Int.random(in: 11...30)
                b = Int.random(in: 11...a)

                
            } else {
                a = Int.random(in: 31...50)
                b = Int.random(in: 31...a)

            
            }
        }
        return (a,b)
    }
    //override func viewDidAppear(_ animated: Bool) {
        
        //Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
        //UIView.animate(withDuration: TimeInterval(counter), delay: 0, options: [], animations: {
            //self.timeBar.frame = CGRect(x: 20, y: 178, width: 0, height: 34)
       // })
        
        //imeBar.layer.removeAllAnimations()
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Button7.layer.cornerRadius = 18
        Button7.layer.borderWidth = 7
        Button7.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        Button6.layer.cornerRadius = 18
        Button6.layer.borderWidth = 7
        Button6.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        Button8.layer.cornerRadius = 18
        Button8.layer.borderWidth = 7
        Button8.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        Button9.layer.cornerRadius = 18
        Button9.layer.borderWidth = 7
        Button9.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        Button5.layer.cornerRadius = 18
        Button5.layer.borderWidth = 7
        Button5.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        Button4.layer.cornerRadius = 18
        Button4.layer.borderWidth = 7
        Button4.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        Button1.layer.cornerRadius = 18
        Button1.layer.borderWidth = 7
        Button1.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        Button2.layer.cornerRadius = 18
        Button2.layer.borderWidth = 7
        Button2.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        Button3.layer.cornerRadius = 18
        Button3.layer.borderWidth = 7
        Button3.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        ViewButton.layer.cornerRadius = 18
        Button0.layer.cornerRadius = 18
        Button0.layer.borderWidth = 7
        Button0.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        ButtonComma.layer.cornerRadius = 18
        ButtonComma.layer.borderWidth = 7
        ButtonComma.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        ViewSubmit.layer.cornerRadius = 18
        delButton.layer.cornerRadius = 18
        delButton.layer.borderWidth = 7
        delButton.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        enterButton.layer.cornerRadius = 18
        enterButton.layer.borderWidth = 7
        enterButton.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.8)
        ViewAnswer.layer.cornerRadius = 18
        AnswerBox.layer.masksToBounds = true
        AnswerBox.layer.cornerRadius = 18
        HiddenAnswerBox.layer.masksToBounds = true
        HiddenAnswerBox.layer.cornerRadius = 18
        QuestionView.layer.cornerRadius = 18

        let question = randomizer(score,levelinput)
        
        equationgenerator(score, question.0, question.1)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
        if score >= 20 && score < 40 {
            counter = 7
        } else if score >= 40 && score < 60{
            counter = 5
        } else if score >= 60{
            counter = 3
        } else {
            counter = 10
        }
    }
    
    @objc func updateCounter() {
        //example functionality
        let question = randomizer(score,levelinput)
        if counter > 0 {
            timerlabel.textColor = UIColor.black
            timerlabel.text = "\(counter)"
            counter -= 1
            
           
        }else if counter == 0 {
            timerlabel.text = "TIME'S UP"
            timerlabel.textColor = UIColor.red
            if answer == "" && answerkey == 0{
                
                AnswerBox.textColor = UIColor(red: 21/255, green: 150/255, blue: 29/255, alpha: 1)
                AnswerBox.text = "Correct"
                score += 1
                
            }else if Int(answer) == answerkey{
                AnswerBox.textColor = UIColor(red: 21/255, green: 150/255, blue: 29/255, alpha: 1)
                AnswerBox.text = "Correct"
                score += 1
            }else{
                AnswerBox.textColor = UIColor.red
                AnswerBox.text = "Wrong"
                falseans += 1
            }
            scoreLabel.text = String(score)
            answer = ""
            if falseans == 1{
                life3.image = #imageLiteral(resourceName: "like 2")
                equationgenerator(score, question.0, question.1)
                if score >= 20 && score < 40{
                    counter = 7
                } else if score >= 40 && score < 60{
                    counter = 5
                } else if score >= 60{
                    counter = 3
                } else {
                    counter = 10
                }
            }else if falseans == 2{
                life2.image = #imageLiteral(resourceName: "like 2")
                equationgenerator(score, question.0, question.1)
                if score >= 20 && score < 40 {
                    counter = 7
                } else if score >= 40 && score < 60{
                    counter = 5
                } else if score >= 60{
                    counter = 3
                } else {
                    counter = 10
                }
            }else if falseans == 3{
                life1.image = #imageLiteral(resourceName: "like 2")
                counter = -1
                //showAlert()
            } else {
                equationgenerator(score, question.0, question.1)
                if score >= 20 && score < 40 {
                    counter = 7
                } else if score >= 40 && score < 60{
                    counter = 5
                } else if score >= 60{
                    counter = 3
                } else {
                    counter = 10
                }
            }
            
        } else if counter == -1 {
            highscore[levelinput-1].append(score)
            performSegue(withIdentifier: "toHighScore", sender: self)
        }
        //timebarwidth = (counter/10)*374
        
    }


    @IBAction func ShowingAnswer(_ sender: Any) {
        HiddenAnswerBox.isHidden = true
    }
    
    @IBAction func Button7act(_ sender: Any) {
        AnswerBox.textColor = UIColor.black
        answer = answer+"7"
        AnswerBox.text = answer
    }

    @IBAction func Button8act(_ sender: Any) {
        AnswerBox.textColor = UIColor.black
        answer = answer+"8"
        AnswerBox.text = answer
    }
    
    @IBAction func Button9act(_ sender: Any) {
        AnswerBox.textColor = UIColor.black
        answer = answer+"9"
        AnswerBox.text = answer
    }
    
    @IBAction func Button4act(_ sender: Any) {
        AnswerBox.textColor = UIColor.black
        answer = answer+"4"
        AnswerBox.text = answer
    }
    
    @IBAction func Button5act(_ sender: Any) {
        AnswerBox.textColor = UIColor.black
        answer = answer+"5"
        AnswerBox.text = answer
    }
    @IBAction func Button6act(_ sender: Any) {
        AnswerBox.textColor = UIColor.black
        answer = answer+"6"
        AnswerBox.text = answer
    }
    
    @IBAction func Button1act(_ sender: Any) {
        AnswerBox.textColor = UIColor.black
        answer = answer+"1"
        AnswerBox.text = answer
    }
    @IBAction func Button2act(_ sender: Any) {
        AnswerBox.textColor = UIColor.black
        answer = answer+"2"
        AnswerBox.text = answer
    }
    @IBAction func Button3act(_ sender: Any) {
        AnswerBox.textColor = UIColor.black
        answer = answer+"3"
        AnswerBox.text = answer
    }
    @IBAction func Button0act(_ sender: Any) {
        AnswerBox.textColor = UIColor.black
        if answer != "0"{
            answer = answer+"0"
        }
        
        AnswerBox.text = answer
    }
    @IBAction func backspace(_ sender: Any) {
        if answer == ""{
            HiddenAnswerBox.isHidden = false
        }else{
            answer.removeLast()
            AnswerBox.text = answer
            if answer == ""{
                HiddenAnswerBox.isHidden = false
            }
        }
    }
    @IBAction func delButton(_ sender: Any) {
        answer = ""
        AnswerBox.text = answer
        HiddenAnswerBox.isHidden = false

    }
    
    @IBAction func enterAction(_ sender: Any) {
        let question = randomizer(score,levelinput)
        if answer == "" && answerkey == 0{
            AnswerBox.textColor = UIColor(red: 21/255, green: 150/255, blue: 29/255, alpha: 1)
            HiddenAnswerBox.isHidden = true
            AnswerBox.text = "Correct"
            score += 1
        }else if Int(answer) == answerkey{
            AnswerBox.textColor = UIColor(red: 21/255, green: 150/255, blue: 29/255, alpha: 1)
            AnswerBox.text = "Correct"
            score += 1
        }else{
            AnswerBox.textColor = UIColor.red
            AnswerBox.text = "Wrong"
            falseans += 1
        }
        scoreLabel.text = String(score)
        answer = ""
        if falseans == 1{
            life3.image = #imageLiteral(resourceName: "like 2")
            equationgenerator(score, question.0, question.1)
            if score >= 20 && score < 40 {
                counter = 7
            } else if score >= 40 && score < 60{
                counter = 5
            } else if score >= 60{
                counter = 3
            } else {
                counter = 10
            }
        }else if falseans == 2{
            life2.image = #imageLiteral(resourceName: "like 2")
            equationgenerator(score, question.0, question.1)
            if score >= 20 && score < 40 {
                counter = 7
            } else if score >= 40 && score < 60{
                counter = 5
            } else if score >= 60{
                counter = 3
            } else {
                counter = 10
            }
        }else if falseans == 3{
            life1.image = #imageLiteral(resourceName: "like 2")
            counter = -1
            //showAlert()
        } else {
            equationgenerator(score, question.0, question.1)
            if score >= 20 && score < 40 {
                counter = 7
            } else if score >= 40 && score < 60{
                counter = 5
            } else if score >= 60{
                counter = 3
            } else {
                counter = 10
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationView = segue.destination as? ScoreViewController
        
        destinationView?.username = username
        destinationView?.highscore = highscore
        destinationView?.levelinput = levelinput
        
    }
}


