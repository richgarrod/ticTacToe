//
//  ViewController.swift
//  TicTacToe
//
//  Created by Richard Garrod on 31/08/2015.
//  Copyright (c) 2015 RichardGarrod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
    @IBOutlet var playAgainButton: UIButton!
    @IBOutlet var wonText: UILabel!
    
    @IBAction func playAgainButton(sender: AnyObject) {
        gameState = [0,0,0,0,0,0,0,0,0]
        activePlayer = 1
        
        var button : UIButton
        
        for var i = 0; i < 9; i++ {
            
            button = view.viewWithTag(i) as! UIButton
            
            button.setImage(nil, forState: .Normal)
            
        }
        
        wonText.hidden = true
        playAgainButton.hidden = true
        
        wonText.center = CGPointMake(wonText.center.x - 400, wonText.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
        
        gameActive = true
    }

    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var gameActive = true
    
    var winningStates = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    
    var activePlayer = 1
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if(gameState[sender.tag] != 0 || !gameActive)
        {
            return
        }
        
        gameState[sender.tag] = activePlayer
        
        var image = UIImage()
        
        if(activePlayer == 1)
        {
            image = UIImage(named: "nought.png")!
            activePlayer = 2
        }
        else
        {
            image = UIImage(named: "cross.png")!
            activePlayer = 1
        }
        
        var winner = checkIfWon()
        
        if winner != 0 {
            NSLog("The winner is: \(winner)")
        }
        
        sender.setImage(image, forState: .Normal)
        
    }
    
    func checkIfWon() -> Int {
        
        for state in winningStates {
            var winner = gameState[state[0]]
            
            if winner == 0 {
                continue
            }
            
            if(gameState[state[0]] == winner &&
                gameState[state[1]] == winner &&
                gameState[state[2]] == winner) {
                    wonText.text = "Player \(winner) Won!! WOOOO!"
                    wonText.hidden = false
                    playAgainButton.hidden = false
                    
                    UIView.animateWithDuration(1, animations: { () -> Void in
                        self.wonText.center = CGPointMake(self.wonText.center.x + 400, self.wonText.center.y)
                    })
                    UIView.animateWithDuration(1, animations: { () -> Void in
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
                    })
                    
                    
                    gameActive = false
            }
        }
        
        return 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wonText.hidden = true
        playAgainButton.hidden = true
        
        wonText.center = CGPointMake(wonText.center.x - 400, wonText.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)

        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

