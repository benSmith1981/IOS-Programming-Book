//
//  Human.swift
//  FunctionMonster
//
//  Created by Ben Smith on 16/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import Foundation

class Human{
    var age: Int
    var name: String
    var bones: [Bone]
    
    init(age: Int, name: String, bones: [Bone]) {
        self.age = age
        self.name = name
        self.bones = bones
    }
}
