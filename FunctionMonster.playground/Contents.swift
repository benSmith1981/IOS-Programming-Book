//: Playground - noun: a place where people can play

import UIKit

enum boneType {
    case boyType
    case manType
    case womanType
}

class Bone{
    var type: boneType
    
    init(boneType: boneType) {
        self.type = boneType
    }
}

class Human{
    var age: Int
    var name: String
    var bones: [Bone]
    
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
}

class Monster{
    var age: Int
    var name: String
    
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    
    func eatHuman(boy: Human) -> Bone {
        crunchBone(bone: boy)
    }
    
    
    func crunchBone(bone: Bone){
        if bone.type == .boyType {
            print("eating boy bones")
        }
    }
}