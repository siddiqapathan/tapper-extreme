//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Siddiqa on 1/22/16.
//  Copyright (c) 2016 Siddiqa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Properties
    var maxTaps = 0
    var currentTaps = 0
    
    //Outlets
    @IBOutlet weak var logoImg : UIImageView!
    @IBOutlet weak var howManyTapsTxt : UITextField!
    @IBOutlet weak var playBtn : UIButton!
    
    @IBOutlet weak var tapBtn : UIButton!
    @IBOutlet weak var tapsLbl : UILabel!
    
    @IBAction func onPlayBtnPressed(sender : UIButton!)
    {
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != ""
        {
            logoImg.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
            
            tapBtn.hidden = false
            tapsLbl.hidden = false
            
            maxTaps = (howManyTapsTxt.text.toInt()!)
            currentTaps = 0
            
            updateTapsLbl()
        }
    }
    
    @IBAction func onCoinTapped(sender : UIButton!)
    {
        currentTaps++
        updateTapsLbl()
        
        if isGameOver()
        {
            restartGame()
        }
    }
    
    func restartGame()
    {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        howManyTapsTxt.hidden = false
        playBtn.hidden = false
        
        tapBtn.hidden = true
        tapsLbl.hidden = true
    }
    
    func isGameOver() -> Bool
    {
        return currentTaps >= maxTaps ? true : false
    }
    
    func updateTapsLbl()
    {
        tapsLbl.text = "\(currentTaps) Taps"
    }

}

