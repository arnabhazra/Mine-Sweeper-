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


class Board
{
    
    let size: Int;
    var squareForBoard:[[Square]] = []
    var numberOfMines = 0;
    
    init(size:Int)
    {
        
        self.size = size;
        
        for row in 0 ..< size{
        var squareRow: [Square] = []
        for col in 0 ..< size{
            
            let square = Square(row:row,col:col)
             squareRow.append(square)
            }
             squareForBoard.append(squareRow)
        }
    }
    
    // added here
    
    func resetBoard() {
        // assign mines to squares
        // let <#name#> = <#value#>
       // let sizeOfBoard = 10;
       // let board = Board(size:sizeOfBoard);
       // let size = 10
        
        for row in 0 ..< size {
            for col in 0 ..< size {
                self.calculateIsMineLocationForSquare(squareForBoard[row][col])
            }
        }
        // count number of neighboring squares
        for row in 0 ..< size {
            for col in 0 ..< size {
                self.calculateNumNeighborMinesForSquare(squareForBoard[row][col])
            }
        }
    }
    
    
    func calculateIsMineLocationForSquare(sqrObj :Square){
        
        if(arc4random() % UInt32(self.size) == 0)
        {
            print("mine at row:\(sqrObj.row) and column:\(sqrObj.column)")
            
            sqrObj.isMineLocation = true
            numberOfMines = numberOfMines + 1
        }
        
    }
    
    
    // calculates number of mines adjacent to a square
    func calculateNumNeighborMinesForSquare(sqrObj : Square){
        
        let numberOfAdjacentSquares:[Square] = getAdjacentSquares(sqrObj); // need to be modified
        var numberOfAdjacentMines = 0;
        
        for square in numberOfAdjacentSquares{
            if (square.isMineLocation){
                numberOfAdjacentMines = numberOfAdjacentMines + 1
                
            }
            
        }
        
        sqrObj.numberOfAdjacentMines = numberOfAdjacentMines;
    }
    
    
    // function for calculating mines
    
    func  getAdjacentSquares(square : Square) -> [Square] {
        var neighbors:[Square]=[]
        let adjacentOffsets = [(-1,-1),(0,-1),(1,-1),(-1,0),(1,0),(1,1),(0,1),(-1,1)]
        
        for (rowOff, colOff) in adjacentOffsets {
            let optionalAdjacentSquare : Square? = getSquareAtLocation(square.row+rowOff, col: square.column+colOff)
            
            if let neighbor = optionalAdjacentSquare{
                
                neighbors.append(neighbor)
            }
        }
        
        
        return neighbors
        
    }
    
    // function for checking existing of adjacent cells
    
    func getSquareAtLocation(row:Int, col: Int) -> Square? {
        
        if(row >= 0 && row < self.size && col >= 0 && col < self.size)
        {
            return squareForBoard[row][col]
            
        }
        
        
        else{
            
            return nil
        }
    }
    
    
}