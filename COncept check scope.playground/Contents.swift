//: Playground - noun: a place where people can play

import UIKit

enum Bone {
    case boyType
    case manType
    case womanType
}


class Monster{
    var age: Int
    var name: String
    
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    
    func crunchBones(bones: [Bone]) {
        var howManyBonesCrunched = 0
        for currentBone in bones {
            howManyBonesCrunched += 1
            crunchBone(bone: currentBone)
        }
    }
}
    "dsfsdf\()"