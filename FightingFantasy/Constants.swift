
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2023 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016 Steve Jackson and Ian Livingstone


import Foundation


// MARK: Enumerations

// FROM 3.1.1
// Implement these constants as enum members
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

let CURRENT_FILE_VERSION        = 2
