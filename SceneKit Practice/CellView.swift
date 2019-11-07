//
//  Tile.swift
//  SceneKit Practice
//
//  Created by Eloisa Falcão on 01/11/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import Foundation
import SceneKit

class CellView: Cell{

    var cellNode: CellNode
    var body: SCNBox
    var isAlive: Bool
    var position: SCNVector3{
        didSet{
            self.cellNode.position = self.position
        }
    }
    
    init(x: Int, y: Int, xPosition: Int, yPosition: Int ) {
        
        self.body = SCNBox(width: 1, height: 1, length: 0, chamferRadius: 0.0)
        self.cellNode = CellNode()
        self.cellNode.geometry = body
        self.isAlive = false
        self.position = SCNVector3(xPosition, yPosition, 1)
        
        super.init(x: x, y: y)
        self.cellNode.cellView = self
        self.cellNode.position = position
    }
    
    func chanceCellState(state: Bool){
        if state == true {
            isAlive = true
            self.body.firstMaterial?.diffuse.contents = UIColor.magenta
        } else {
             isAlive = false
             self.body.firstMaterial?.diffuse.contents = UIColor.gray
        }
    }
    
//    func copy(with zone: NSZone? = nil) -> Any {
//        let copy = CellView(x: x, y: y, xPosition: Int(position.x), yPosition: Int(position.y))
//        return copy
//      }
}
