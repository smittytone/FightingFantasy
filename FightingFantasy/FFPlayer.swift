
//  FightingFantasy
//  Created by Tony Smith on 26/10/2017.


import Cocoa

class FFPlayer: NSObject {

    var skill: Int = 0
    var initialSkill: Int = 0
    var stamina: Int = 0
    var initialStamina: Int = 0
    var luck: Int = 0
    var initialLuck: Int = 0
    var fear: Int = 0
    var magic: Int = 0

    var maxSkill: Int = 12
    var maxStamina: Int = 24
    var maxLuck: Int = 12
    var maxFear: Int = 12
    var maxMagic: Int = 24

    var provisions: Int = 10
    var gold: Int = 20
    var potion: Int = -1
    var drinks: Int = 2

    var pack: [String] = []
    var citadelSpellMatrix: [Int] = []
    var modMatrix: [Int] = []
    var templeSpellMatrix: [Int] = []

    var name: String = "Wonko"
    var gameName: String = "None"
    var gamekind: Int = -1

    var isDead: Bool = false

    override init() {
        super.init()

        skill = 8
        stamina = 10
        luck = 2
    }
}
