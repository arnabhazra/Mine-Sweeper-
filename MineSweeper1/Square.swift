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

class Square
{
    var row: Int// row for the board
    var column: Int // column for board
    
    var numberOfAdjacentMines = 0;
    var isMineLocation = false;
    var hasExplored = false;
    
    init(row:Int, col: Int){
        
        self.row = row;
        self.column = col;
        
    }
    
   
    
}
