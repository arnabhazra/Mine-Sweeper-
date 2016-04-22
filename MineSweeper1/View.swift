//
//  File.swift
//  MineSweeper1
//
//  Aurthor:Arnab Hazra , Syracuse University
//  Course: CIS 651
//  Mine Sweeper in iOS
//  Copyright © 2016 Arnab Hazra. All rights reserved.
//

import Foundation
import UIKit

class SquareButton : UIButton {
    
    let squareSize: CGFloat
    let squareMargin: CGFloat
    var square: Square
    
    init(sqr:Square, squareSize:CGFloat, squareMargin: CGFloat)
    {
        self.square = sqr;
        self.squareSize = squareSize
        self.squareMargin = squareMargin
        let x = CGFloat(self.square.column) * (squareSize + squareMargin)
        let y = CGFloat(self.square.row) * (squareSize + squareMargin)
        let squareFrame = CGRectMake(x, y, squareSize, squareSize)
        super.init(frame:squareFrame)
        
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder) has not been implemented")
        
    }
    
    func getTextForDisplay(sqr : Square) -> String{
        
        if !sqr.isMineLocation{
            
            if sqr.numberOfAdjacentMines == 0
            {
                return " "
            }
            else
            {
                return "\(sqr.numberOfAdjacentMines)"
            }
            
        }
        
        return "M"
        
    }
    
}
