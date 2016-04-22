//
//  ViewController.swift
//  MineSweeper1
//  Controller file of the apllication
//  Aurthor:Arnab Hazra , Syracuse University
//  Course: CIS 651
//  Mine Sweeper in iOS
//  Copyright © 2016 Arnab Hazra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
     //defining outlets
  //  @IBOutlet weak var mineCounter: UILabel!
    
   // @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var customView: UICollectionView!
   
    let BOARD_SIZE : Int = 16
    
    var boardObj: Board
    
    var squareButtons:[SquareButton] = []
   // var mineCounts = 0
    

    
    required init(coder aDecoder : NSCoder)
    {
        self.boardObj = Board(size: BOARD_SIZE)
        super.init(coder: aDecoder)!
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        lblResult.text=""
        self.initilizeBoard()
        self.startNewGame()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // defining actions
    
    
    @IBAction func startNewGame(sender: AnyObject) {
        print("new game started")
        self.initilizeBoard()
       self.startNewGame() // will start new game
        
    }
    
    //event handler
    func buttonPressed (sender: SquareButton) {
        var mineNotFound = 0;
       // print("pressed row: \(sender.square.row), column:\(sender.square.column)")
        //sender.setTitle("", forState: .Normal)
        
        if(!sender.square.hasExplored){
            sender.square.hasExplored = true
            sender.setTitle("\(sender.getTextForDisplay(sender.square))", forState: .Normal)
            
        }
        
        if sender.square.isMineLocation{
            self.mineFound()
            
        }
        
        self.hasWon(mineNotFound)
        
    }

    func singleTapHandler(sender : SquareButton){
        if(!sender.square.hasExplored){
        sender.setTitle("F", forState: .Normal)
        }
    }
    
    // for initializing board
    
    func  initilizeBoard() {
        for row in 0 ..< boardObj.size {
            for col in 0 ..< boardObj.size {
                
                let square = boardObj.squareForBoard[row][col]
                let squareSize:CGFloat = self.customView.frame.width/CGFloat(BOARD_SIZE)
                let squareButton = SquareButton(sqr: square,squareSize: squareSize, squareMargin: CGFloat(0.3))
                squareButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
                squareButton.addTarget(self, action: "buttonPressed:" , forControlEvents: .TouchDownRepeat)
                squareButton.addTarget(self, action: "singleTapHandler:" , forControlEvents: .TouchUpInside)
                self.customView.addSubview(squareButton)
                self.squareButtons.append(squareButton)
                
            }
        }
    }
    
   
    
    // for resetting board
    
    func resetBoard()
    {
        self.boardObj.resetBoard()
        for squareButton in self.squareButtons{
            squareButton.setTitle("[x]", forState: .Normal)
            squareButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
            
        }
        
    }
    
    // start new game
    func startNewGame()
    {
        self.resetBoard()
    }
    
    func mineFound(){
      
        for squareBtn in self.squareButtons{
            if squareBtn.square.isMineLocation
            {
                squareBtn.setTitle("M", forState: .Normal)
                squareBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
            }
        }
        
        // showing alert
        lblResult.sizeToFit()
        lblResult.text = "LOST!"
        lblResult.textColor = UIColor.redColor()
        
        let customView = UIAlertView()
        customView.delegate = self
        customView.addButtonWithTitle("Start new game")
        customView.title = "GAME IS LOST!"
        customView.message = "You clicked a mine."
        customView.show()
       // let alertCtrl = UIAlertController(title: "LOST", message: "Mine", preferredStyle:mo)
    }
    
    
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        //start new game
        lblResult.text = ""
        self.startNewGame()
    }
    
    // function to check wining
    func hasWon(notMines : Int)
    {
        var nMines = notMines
        for squareBtn in self.squareButtons{
            if squareBtn.square.hasExplored && !squareBtn.square.isMineLocation
            {
                nMines = nMines + 1
            }
        }
        
        if ((boardObj.size * boardObj.size - boardObj.numberOfMines) == nMines)
        {
            
            lblResult.text="WON!"
            lblResult.textColor = UIColor.greenColor()  
        }
        
    }
    
}

