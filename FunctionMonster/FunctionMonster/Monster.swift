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
    var bonesEaten: [Bone] = []

    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    
    func eatHuman(human: Human) -> [Bone] {
        crunchBones(bones: human.bones)
        return bonesEaten
    }
    
    func eatManyHumans(humans: [Human]) -> [Bone] {
        for human in humans {
            crunchBones(bones: human.bones)
        }
        return bonesEaten
    }

    func crunchBones(bones: [Bone]) {
        for currentBone in bones {
            crunchBone(bone: currentBone)
        }
    }
    
    func crunchBone(bone: Bone) {
        switch bone.type {
        case boneType.boyType:
            print("I am eating boy bones")
            bone.crunched = true
        case boneType.manType:
            print("I am eating man bones")
            bone.crunched = true
        case boneType.womanType:
            print("I am eating woman bones")
            bone.crunched = true
        }
        bonesEaten.append(bone)
    }
    
}
