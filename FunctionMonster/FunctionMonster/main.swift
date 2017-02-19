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
var boyBones: [Bone] = []

for loopCounter in 1...10 {
    var bone = Bone.init(type: boneType.boyBone, crunched: false)
    boyBones.append(bone)
}

var theBoy = Boy.init(name: "Ben", type: humanType.boy, bones: boyBones)

var BonePod = Monster.init(age: 1000, name: "The Function Monster", monsterTeeth: .sharp)

var bonesReturned = BonePod.eatHuman(human: theBoy)
print(bonesReturned)
