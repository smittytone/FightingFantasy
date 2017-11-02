
//  FightingFantasy
//  Created by Tony Smith on 26/10/2017.
//  Copyright © 2005-2017 Tony Smith. All rights reserved.


import Cocoa

class FFPlayer: NSObject, NSCoding {

    // MARK: Player properties

    var skill: Int = 0
    var initialSkill: Int = 0
    var stamina: Int = 0
    var initialStamina: Int = 0
    var luck: Int = 0
    var initialLuck: Int = 0
    var fear: Int = 0
    var maxFear: Int = 0
    var magic: Int = 0
    var initialMagic: Int = 0

    var provisions: Int = 10
    var gold: Int = 20
    var potion: Int = -1
    var drinks: Int = 2

    var pack: [[String:Any]] = []
    var packIcon: [Int] = []
    var packSelectedItem: Int = 0
    var citadelSpellMatrix: [Int] = []
    var modMatrix: [Int] = []
    var templeSpellMatrix: [Int] = []

    var name: String = "Untitled"
    var gameName: String = "None"
    var gamekind: Int = -1

    var isDead: Bool = false

    // MARK: Functions

    override init() {

        super.init()

        // This matrix records the Citadel of Chaos spells the player can use
        for _ in 0...10 { citadelSpellMatrix.append(0) }

        // This matrix records the game combat and test modifiers
        for _ in 0...3 { modMatrix.append(0) }

        // This matrix records the Temple of Terror spells the player can use
        for _ in 0...3 { templeSpellMatrix.append(0) }
    }

    // MARK: NSCoding Functions

    func encode(with aCoder: NSCoder) {
        // Called to archive the properties of the player instance
        aCoder.encode(pack, forKey:"ff.pack")
        aCoder.encode(citadelSpellMatrix, forKey:"ff.cspellmatrix")
        aCoder.encode(templeSpellMatrix, forKey: "ff.tspellmatrix")
        aCoder.encode(modMatrix, forKey: "ff.modmatrix")
        aCoder.encode(gameName, forKey: "ff.gamename")
        aCoder.encode(name, forKey: "ff.name")
        aCoder.encode(NSNumber(value: gamekind), forKey: "ff.gamekind")
        aCoder.encode(NSNumber(value: skill), forKey: "ff.skill")
        aCoder.encode(NSNumber(value: initialSkill), forKey: "ff.iskill")
        aCoder.encode(NSNumber(value: stamina), forKey: "ff.stamina")
        aCoder.encode(NSNumber(value: initialStamina), forKey: "ff.istamina")
        aCoder.encode(NSNumber(value: luck), forKey: "ff.luck")
        aCoder.encode(NSNumber(value: initialLuck), forKey: "ff.iluck")
        aCoder.encode(NSNumber(value: fear), forKey: "ff.fear")
        aCoder.encode(NSNumber(value: maxFear), forKey: "ff.mfear")
        aCoder.encode(NSNumber(value: magic), forKey: "ff.magic")
        aCoder.encode(NSNumber(value: initialMagic), forKey: "ff.imagic")
        aCoder.encode(NSNumber(value: provisions), forKey: "ff.provisions")
        aCoder.encode(NSNumber(value: gold), forKey: "ff.gold")
        aCoder.encode(NSNumber(value: potion), forKey: "ff.potion")
        aCoder.encode(NSNumber(value: drinks), forKey: "ff.drinks")
        aCoder.encode(NSNumber(value: packSelectedItem), forKey: "ff.psm")
    }

    required init(coder aDecoder: NSCoder) {

        // Called to de-archive the properties of the player instance
        self.pack = aDecoder.decodeObject(forKey: "ff.pack") as! [[String:Any]]
        self.gameName = aDecoder.decodeObject(forKey: "ff.gamename") as! String
        self.name = aDecoder.decodeObject(forKey: "ff.name") as! String
        self.gamekind = (aDecoder.decodeObject(forKey: "ff.gamekind") as! NSNumber).intValue
        self.skill = (aDecoder.decodeObject(forKey: "ff.skill") as! NSNumber).intValue
        self.initialSkill = (aDecoder.decodeObject(forKey: "ff.iskill") as! NSNumber).intValue
        self.initialStamina = (aDecoder.decodeObject(forKey: "ff.istamina") as! NSNumber).intValue
        self.stamina = (aDecoder.decodeObject(forKey: "ff.stamina") as! NSNumber).intValue
        self.luck = (aDecoder.decodeObject(forKey: "ff.luck") as! NSNumber).intValue
        self.initialLuck = (aDecoder.decodeObject(forKey: "ff.iluck") as! NSNumber).intValue
        self.fear = (aDecoder.decodeObject(forKey: "ff.fear") as! NSNumber).intValue
        self.maxFear = (aDecoder.decodeObject(forKey: "ff.mfear") as! NSNumber).intValue
        self.magic = (aDecoder.decodeObject(forKey: "ff.magic") as! NSNumber).intValue
        self.initialMagic = (aDecoder.decodeObject(forKey: "ff.imagic") as! NSNumber).intValue
        self.provisions = (aDecoder.decodeObject(forKey: "ff.provisions") as! NSNumber).intValue
        self.gold = (aDecoder.decodeObject(forKey: "ff.gold") as! NSNumber).intValue
        self.potion = (aDecoder.decodeObject(forKey: "ff.potion") as! NSNumber).intValue
        self.drinks = (aDecoder.decodeObject(forKey: "ff.drinks") as! NSNumber).intValue
        self.packSelectedItem = (aDecoder.decodeObject(forKey: "ff.psm") as! NSNumber).intValue

        var csm = aDecoder.decodeObject(forKey: "ff.cspellmatrix") as! [NSNumber]
        for i in 0...10 { citadelSpellMatrix.append(csm[i].intValue) }
        csm = aDecoder.decodeObject(forKey: "ff.tspellmatrix") as! [NSNumber]
        for i in 0...3 { templeSpellMatrix.append(csm[i].intValue) }
        csm = aDecoder.decodeObject(forKey: "ff.modmatrix") as! [NSNumber]
        for i in 0...3 { modMatrix.append(csm[i].intValue) }
    }
}
