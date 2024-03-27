//
//  DataModel.swift
//  Memento
//
//  Created by Zhang on 2024/2/25.
//

import Foundation

struct Level: Identifiable {
    let id: Int
    let name: String
    var isUnlocked: Bool
    var hasCompleted: Bool
}

class DataModel: ObservableObject {
    
    static var shared = DataModel()
    
    @Published var levels = [
        Level(id: 0, name: "Prologue", isUnlocked: true, hasCompleted: false),
        Level(id: 1, name: "HotPot", isUnlocked: false, hasCompleted: false),
        Level(id: 2, name: "Camera", isUnlocked: false, hasCompleted: false),
        Level(id: 3, name: "Medal", isUnlocked: false, hasCompleted: false),
        Level(id: 4, name: "Magic", isUnlocked: false, hasCompleted: false)
    ]
    
    @Published var index: Int = 0
    
    @Published var puzzle: [Puzzle] = [
        Puzzle(title: "placeHolder", solvedImages: ["food1","food2","food3","food4"]),
                                                  
        Puzzle(title: "food", solvedImages: ["food1","food2","food3","food4"]),
                                                  
        Puzzle(title: "camera", solvedImages: ["camera1","camera2","camera3","camera4","camera5",
                                                                                            "camera6","camera7","camera8","camera9"]) ,
        Puzzle(title: "medal", solvedImages: ["medal1","medal2","medal3","medal4","medal5","medal6","medal7",
                                                                                          "medal8","medal9","medal10","medal11","soldier12","medal13","medal14",
                                                                                          "medal15","medal16"])]
    
    func completePuzzle(){
        levels[index].hasCompleted = true
        index += 2
        levels[index].isUnlocked = true
        print("run?>>")
        print(levels[index].isUnlocked)
    }
}
