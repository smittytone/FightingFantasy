
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2023 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016 Steve Jackson and Ian Livingstone


import Foundation


// MARK: Enumerations

enum FFGameType: Int {
    case kGameNone              = -1
    case kGameWarlock           = 0
    case kGameCitadel           = 1
    case kGameForestDoom        = 2
    case kGameDeathtrap         = 3
    case kGameCityThieves       = 4
    case kGameHouseHell         = 5
    case kGameCavernsSnow       = 6
    case kGameIslandLizard      = 7
    case kGameTempleTerror      = 8
    case kGameTrialChampions    = 9
    case kGameCreatureHavoc     = 10
    case kGameReturnFiretop     = 11
    case kGameEyeDragon         = 12
    case kGamePortPeril         = 13
    case kGameSorceryWizard     = 20
    case kGameSorceryFighter    = 21
}

enum FFPotionType: Int {
    case kPotionNone            = -1
    case kPotionDexterity       = 0
    case kPotionStrength        = 1
    case kPotionFortune         = 2
}

// Game Types

let kGameNone = -1
let kGameWarlock = 0
let kGameCitadel = 1
let kGameForestDoom = 2
let kGameDeathtrap = 3
let kGameCityThieves = 4
let kGameHouseHell = 5
let kGameCavernsSnow = 6
let kGameIslandLizard = 7
let kGameTempleTerror = 8
let kGameTrialChampions = 9
let kGameCreatureHavoc = 10
let kGameReturnFiretop = 11
let kGameEyeDragon = 12
let kGamePortPeril = 13
let kGameSorceryWizard = 20
let kGameSorceryFighter = 21

// Potions

let kPotionNone = -1
let kPotionDexterity = 0
let kPotionStrength = 1
let kPotionFortune = 2
