//
//  Human.swift
//  FunctionMonster
//
//  Created by Ben Smith on 16/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import Foundation

class Human{
    var name: String
    var type: humanType
    var bones: [Bone]
    
    init(name: String, type: humanType, bones: [Bone]) {
        self.name = name
        self.type = type
        self.bones = bones
    }
}
