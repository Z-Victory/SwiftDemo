//
//  Person.swift
//  SwiftDemo
//
//  Created by mana on 2020/6/18.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name = ""
    init(name:String) {
        self.name = name
    }
    
    func printt() {
        print("A")
    }
}
struct Singer {
    var musicName = ""
    init(musicName:String) {
        self.musicName = musicName
    }
    
}
