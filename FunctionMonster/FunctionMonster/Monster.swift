//
//  Monster.swift
//  FunctionMonster
//
//  Created by Ben Smith on 16/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import Foundation

class Monster{
    var age: Int
    var name: String
    var monsterTeeth: Teeth
    
    //global var to hold all crunch bones
    var allCrunchedBones: [Bone] = []

    init(age: Int, name: String, monsterTeeth: Teeth) {
        self.age = age
        self.name = name
        self.monsterTeeth = monsterTeeth
    }
    
    func eatHuman(human: Human) -> [Bone] {
        if human.type == .boy {
            print("Yummy i like eating boys")
        } else {
            print("Yuck")
        }
        
        crunchBones(bones: human.bones)
        return allCrunchedBones
    }
    
    func eatManyHumans(humans: [Human]) -> [Bone] {
        
        for human in humans {
            crunchBones(bones: human.bones)
        }
        return allCrunchedBones
    }
    
    func crunchBones(bones: [Bone]) {
        for currentBone in bones {
            crunchBone(bone: currentBone)
        }
    }
    
    func crunchBone(bone: Bone) {
        bone.crunched = true
        allCrunchedBones.append(bone)
        switch bone.type {
        case .boyBone:
                print("crunching boy")
        case .manBone:
                print("crunching man")
        case .womanBone:
                print("crunching woman")
        }
    }
}
