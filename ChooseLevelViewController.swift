//
//  ChooseLevelViewController.swift
//  Do-A-Math
//
//  Created by Vincentius Calvin on 13/03/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

class ChooseLevelViewController: UIViewController {
    var username = ""
    var highscore = [[0],[0],[0],[0]]
    enum indexlevel{
        case level1
        case level2
        case level3
        case frenzy
    }
    
    var level : indexlevel = .level1
    var transferlevel = 0

    @IBOutlet weak var usernameGreet: UILabel!
    @IBOutlet weak var level1View: UIView!
    @IBOutlet weak var level2View: UIView!
    @IBOutlet weak var level3View: UIView!
    @IBOutlet weak var frenzyModeView: UIView!
    @IBOutlet weak var frenzyButtonOutlet: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        level1View.layer.cornerRadius = 18
        level2View.layer.cornerRadius = 18
        level3View.layer.cornerRadius = 18
        frenzyModeView.layer.cornerRadius = 18
        frenzyButtonOutlet.layer.cornerRadius = 18
        
        usernameGreet.text = "Hi, \(username)"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func level1Button(_ sender: Any) {
        level = .level1
        if level == .level1{
            transferlevel = 1
        }
        performSegue(withIdentifier: "toGameView", sender: self)
    }
    
    @IBAction func level2Button(_ sender: Any) {
        level = .level2
        if level == .level2{
            transferlevel = 2
        }
        performSegue(withIdentifier: "toGameView", sender: self)
    }
    
    @IBAction func level3Button(_ sender: Any) {
        level = .level3
        if level == .level3{
            transferlevel = 3
        }
        performSegue(withIdentifier: "toGameView", sender: self)
    }
    
    @IBAction func frenzyButton(_ sender: Any) {
        level = .frenzy
        if level == .frenzy{
            transferlevel = 4
        }
        performSegue(withIdentifier: "toGameView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationView = segue.destination as? ViewController
        
        destinationView?.levelinput = transferlevel
        destinationView?.username = username
        destinationView?.highscore = highscore
        
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
