//
//  main.swift
//  FunctionMonster
//
//  Created by Ben Smith on 16/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import Foundation
//Exercise here: https://docs.google.com/document/d/1txrgI2NEimlw3D7Rf_IupzXObUpgsk1IQvRQvLWaTsw/edit?usp=sharing

//create bones
var boyBones: [Bone] = [ ]
for loopCounter in 1...10{
    var bone = Bone.init(type: .boyType, crunched: false)
    boyBones.insert(bone, at: loopCounter)
    boyBones.append(bone)
}

var womanBones: [Bone] = []
for i in 1...10{
    var bone = Bone.init(type: .womanType, crunched: false)
    womanBones.append(bone)
}

var manBones: [Bone] = []
for i in 1...10{
    var bone = Bone.init(type: .manType, crunched: false)
    manBones.append(bone)
}

var aBoy = Boy.init(age: 12, name: "Ben", bones: boyBones)
var aMan = Man.init(age: 32, name: "Chris", bones: manBones)
var aWomen = Woman.init(age: 32, name: "Maya", bones: womanBones)

var arrayOfHumans: [Human] = [aBoy, aMan, aWomen]

var monster = Monster.init(age: 1000, name: "The Function Monster")

var bonesReturned = monster.eatHuman(human: aBoy)
var manyHumansBonesReturned = monster.eatManyHumans(humans: arrayOfHumans)
