
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2023 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016 Steve Jackson and Ian Livingstone


import Cocoa

class FFPlayer: NSObject, NSCoding {

    // TODO -- Support NSSecureCoding, but this appears to have issues de-archiving
    //         the Swift arrays-of-dictionaries, and possibly arrays too.

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

    var notes: String = ""

    var isDead: Bool = false
    var bookmark: Int = -1

    // MARK: Functions

    override init() {

        super.init()

        // This matrix records the Citadel of Chaos spells the player can use
        for _ in 0...10 { self.citadelSpellMatrix.append(0) }

        // This matrix records the game combat and test modifiers
        for _ in 0...3 { self.modMatrix.append(0) }

        // This matrix records the Temple of Terror spells the player can use
        for _ in 0...3 { self.templeSpellMatrix.append(0) }
    }

    // MARK: NSCoding Functions

    func encode(with aCoder: NSCoder) {
        // Called to archive the properties of the player instance
        //aCoder.encode(self.pack, forKey:"ff.pack")
        aCoder.encode(self.pack, forKey:"ff.pack")
        aCoder.encode(self.citadelSpellMatrix, forKey:"ff.cspellmatrix")
        aCoder.encode(self.templeSpellMatrix, forKey: "ff.tspellmatrix")
        aCoder.encode(self.modMatrix, forKey: "ff.modmatrix")
        aCoder.encode(self.gameName, forKey: "ff.gamename")
        aCoder.encode(self.name, forKey: "ff.name")
        aCoder.encode(self.notes, forKey: "ff.notes")
        aCoder.encode(NSNumber(value: self.gamekind), forKey: "ff.gamekind")
        aCoder.encode(NSNumber(value: self.skill), forKey: "ff.skill")
        aCoder.encode(NSNumber(value: self.initialSkill), forKey: "ff.iskill")
        aCoder.encode(NSNumber(value: self.stamina), forKey: "ff.stamina")
        aCoder.encode(NSNumber(value: self.initialStamina), forKey: "ff.istamina")
        aCoder.encode(NSNumber(value: self.luck), forKey: "ff.luck")
        aCoder.encode(NSNumber(value: self.initialLuck), forKey: "ff.iluck")
        aCoder.encode(NSNumber(value: self.fear), forKey: "ff.fear")
        aCoder.encode(NSNumber(value: self.maxFear), forKey: "ff.mfear")
        aCoder.encode(NSNumber(value: self.magic), forKey: "ff.magic")
        aCoder.encode(NSNumber(value: self.initialMagic), forKey: "ff.imagic")
        aCoder.encode(NSNumber(value: self.provisions), forKey: "ff.provisions")
        aCoder.encode(NSNumber(value: self.gold), forKey: "ff.gold")
        aCoder.encode(NSNumber(value: self.potion), forKey: "ff.potion")
        aCoder.encode(NSNumber(value: self.drinks), forKey: "ff.drinks")
        aCoder.encode(NSNumber(value: self.bookmark), forKey: "ff.bookmark")
        aCoder.encode(NSNumber(value: self.packSelectedItem), forKey: "ff.psm")
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
        self.bookmark = (aDecoder.decodeObject(forKey: "ff.bookmark") as! NSNumber).intValue
        self.packSelectedItem = (aDecoder.decodeObject(forKey: "ff.psm") as! NSNumber).intValue

        // Check for opening old games files with no 'notes' field
        if let ns = aDecoder.decodeObject(forKey: "ff.notes") {
            self.notes = ns as! String
        } else {
            self.notes = ""
        }

        var csm = aDecoder.decodeObject(forKey: "ff.cspellmatrix") as! [NSNumber]
        for i in 0...10 { self.citadelSpellMatrix.append(csm[i].intValue) }
        csm = aDecoder.decodeObject(forKey: "ff.tspellmatrix") as! [NSNumber]
        for i in 0...3 { self.templeSpellMatrix.append(csm[i].intValue) }
        csm = aDecoder.decodeObject(forKey: "ff.modmatrix") as! [NSNumber]
        for i in 0...3 { self.modMatrix.append(csm[i].intValue) }
    }


}
