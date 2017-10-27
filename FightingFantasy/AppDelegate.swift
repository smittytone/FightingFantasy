
//  FightingFantasy
//  Created by Tony Smith on 26/10/2017.
//  Copyright © 2017 Tony Smith. All rights reserved.


import Cocoa

// MARK: Constants

// Game types

let kGameNone = -1
let kGameWarlock = 0
let kGameCitadel = 1
let kGameForestDoom = 2
let kGameDeathtrap = 3
let kGameCityThieves = 4
let kGameHouseHell = 5
let kGameCavernsSnow = 6
let kGameReturnFiretop = 7
let kGameTempleTerror = 8
let kGameEyeDragon = 9
let kGameSorceryWizard = 20
let kGameSorceryFighter = 21

// Colours for text

let kTextColourBlack = 0
let kTextColourRed = 1
let kTextColourGrey = 2

// Potions

let kPotionNone = -1
let kPotionDexterity = 0
let kPotionStrength = 1
let kPotionFortune = 2



@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var tabs: NSTabView!
    @IBOutlet weak var magicTab: NSTabViewItem!

    // MARK: Stats Tab Items

    @IBOutlet weak var statsTabView: NSView!

    @IBOutlet weak var skillValue: NSTextField!
    @IBOutlet weak var staminaValue: NSTextField!
    @IBOutlet weak var luckValue: NSTextField!

    @IBOutlet weak var skillStepper: NSStepper!
    @IBOutlet weak var staminaStepper: NSStepper!
    @IBOutlet weak var luckStepper: NSStepper!

    @IBOutlet weak var potionTypeLabel: NSTextField!
    @IBOutlet weak var potionDrinksField: NSTextField!
    @IBOutlet weak var foodAmountField: NSTextField!
    @IBOutlet weak var foodEatButton: NSButton!
    @IBOutlet weak var goldAmountField: NSTextField!
    @IBOutlet weak var goldStepper: NSStepper!

    @IBOutlet weak var citadelBox: NSBox!
    @IBOutlet weak var magicValue: NSTextField!

    @IBOutlet weak var hellBox: NSBox!
    @IBOutlet weak var fearValue: NSTextField!
    @IBOutlet weak var maxFearValue: NSTextField!
    @IBOutlet weak var fearStepper: NSStepper!

    // MARK: Combat Tab Items

    @IBOutlet weak var monsterOneSkillField: NSTextField!
    @IBOutlet weak var monsterOneStamField: NSTextField!
    @IBOutlet weak var monsterOneTargetCheck: NSButton!
    @IBOutlet weak var monsterOneCombatCheck: NSButton!
    @IBOutlet weak var monsterTwoSkillField: NSTextField!
    @IBOutlet weak var monsterTwoStamField: NSTextField!
    @IBOutlet weak var monsterTwoTargetCheck: NSButton!
    @IBOutlet weak var monsterTwoCombatCheck: NSButton!
    @IBOutlet weak var monsterThreeSkillField: NSTextField!
    @IBOutlet weak var monsterThreeStamField: NSTextField!
    @IBOutlet weak var monsterThreeTargetCheck: NSButton!
    @IBOutlet weak var monsterThreeCombatCheck: NSButton!
    @IBOutlet weak var playerMod: NSPopUpButton!
    @IBOutlet weak var monsterMod: NSPopUpButton!
    @IBOutlet weak var combatReadoutOne: NSTextField!
    @IBOutlet weak var combatReadoutTwo: NSTextField!
    @IBOutlet weak var combatReadoutThree: NSTextField!

    // MARK: Player Creation Sheet

    @IBOutlet weak var createSheet: NSWindow!
    @IBOutlet weak var startGoldField: NSTextField!
    @IBOutlet weak var startFoodField: NSTextField!
    @IBOutlet weak var startSkillField: NSTextField!
    @IBOutlet weak var startStaminaField: NSTextField!
    @IBOutlet weak var startLuckField: NSTextField!
    @IBOutlet weak var gamePopup: NSPopUpButton!
    @IBOutlet weak var potionPopup: NSPopUpButton!
    
    @IBOutlet weak var aboutSheet: NSWindow!

    // MARK: Globals

    var player: FFPlayer = FFPlayer.init()
    var needToSave: Bool = false
    var gameInProgress: Bool = false
    var firstRun: Bool = true
    var heldTabs: [String:NSTabViewItem] = [:]
    var combatLuckMonster: Int = 0
    var combatLuckOutcome: Int = 0
    var combatLuckCheck: Bool = false

    // MARK: App Lifecycle Functions

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        initUI()

        if !gameInProgress { showPlayerCreate() }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


    func initUI() {

        // Set the UI to its default state
        window.title = player.name.characters.count > 0
            ? "FightingFantasy - \(player.name)"
            : "FightingFantasy"

        // Disable elements by game type

        citadelBox.isHidden = true
        hellBox.isHidden = true

        // Now work through each of the tabs
        initUIstats()
        initUICombat()
    }

    func initUIstats() {

        skillStepper.maxValue = Double(player.maxSkill)
        skillStepper.intValue = Int32(player.skill)

        staminaStepper.maxValue = Double(player.maxStamina)
        staminaStepper.intValue = Int32(player.stamina)

        luckStepper.maxValue = Double(player.maxLuck)
        luckStepper.intValue = Int32(player.luck)

        foodAmountField.stringValue = "\(player.provisions)"

        updateStats()
    }

    func initUICombat() {

        combatReadoutOne.stringValue = ""
        combatReadoutTwo.stringValue = ""


    }

    func updateStats() {
        var colour: Int = 0

        // Status tab

        skillValue.stringValue = "\(player.skill)"

        colour = player.luck < 5 ? kTextColourRed : kTextColourBlack
        luckValue.stringValue = "\(player.luck)"

        //[luckReadout prepareStringAttributes:colour];
        //[testLuckReadout prepareStringAttributes:colour];
        //[luckReadout setString:[NSString stringWithFormat:@"%u", [theCharacter getLuck]]];

        colour = player.stamina < 5 ? kTextColourRed : kTextColourBlack
        staminaValue.stringValue = "\(player.stamina)"

        //[stamReadout prepareStringAttributes:colour];
        //[stamReadout setString:[NSString stringWithFormat:@"%u", [theCharacter getStam]]];

        fearValue.stringValue = "\(player.fear)"
        maxFearValue.stringValue = "\(player.maxFear)"

        magicValue.stringValue = "\(player.magic)"

        foodAmountField.stringValue = "\(player.provisions)"
        goldAmountField.stringValue = "\(player.gold)"
        potionDrinksField.stringValue = player.drinks > 0 ? "\(player.drinks)" : ""

        switch (player.potion) {
        case kPotionDexterity:
            potionTypeLabel.stringValue = "Dexterity"
        case kPotionStrength:
            potionTypeLabel.stringValue = "Strength"
        case kPotionFortune:
            potionTypeLabel.stringValue = "Fortune"
        default:
            potionTypeLabel.stringValue = "None"
        }

        // Magic tab

        //[magicMagicReadout setStringValue:@" "];
        //[magicMagicTotal setIntValue:[theCharacter getMagic]];

        // Test tab

        //[testSkillReadout setString:[NSString stringWithFormat:@"%u", [theCharacter getSkill]]];
        //[testLuckReadout setString:[NSString stringWithFormat:@"%u", [theCharacter getLuck]]];

        // Pack tab

        //[tableView reloadData];
        //[mainWindowTab setNeedsDisplay:YES];

        // This section is run when any stat changes, so centralise death checks here
        // FirstRun is sampled so we don't present the death box before a character's been rolled or loaded

        if player.stamina < 1 && !firstRun {
            // Death by weakness

            //[deathBox showWindow:self];

            player.isDead = true
            needToSave = false
            firstRun = true
            return
        }

        if player.gamekind == kGameHouseHell {
            // Are we playing House of Hell? If not we don't need the following check
            if player.fear == player.maxFear && !firstRun {
                // Death by insanity

                //[madBox showWindow:self];

                player.isDead = true
                needToSave = false
                firstRun = true
                return
            }
        }
    }

    // MARK: Stats Tab Functions

    @IBAction func adjustSkill(_ sender: Any) {

        if let stepper = (sender as? NSStepper) {

            let stepperValue = stepper.integerValue
            player.skill = stepperValue

            if player.skill > player.maxSkill { player.skill = player.maxSkill }
            if player.skill < 0 { player.skill = 0 }

            needToSave = true
            updateStats()
        }
    }

    @IBAction func adjustStamina(_ sender: Any) {

        if let stepper = (sender as? NSStepper) {

            let stepperValue = stepper.integerValue
            player.stamina = stepperValue

            if player.stamina > player.maxStamina { player.stamina = player.maxStamina }
            if player.stamina < 0 { player.stamina = 0 }

            needToSave = true
            updateStats()
        }
    }

    @IBAction func adjustLuck(_ sender: Any) {

        if let stepper = (sender as? NSStepper) {

            let stepperValue = stepper.integerValue
            player.luck = stepperValue

            if player.luck > player.maxLuck { player.luck = player.maxLuck }
            if player.luck < 0 { player.luck = 0 }

            needToSave = true
            updateStats()
        }
    }

    @IBAction func adjustFood(_ sender: Any) {

        if let asender = (sender as? NSButton) {
            if asender == foodEatButton {
                if player.provisions > 0 {
                    player.provisions = player.provisions - 1
                    foodAmountField.stringValue = "\(player.provisions)"
                    player.stamina = player.stamina + 4

                    if player.stamina > player.maxStamina { player.stamina = player.maxStamina }

                    needToSave = true
                    updateStats()
                }
            }
        }

        if let asender = (sender as? NSTextField) {
            if asender == foodAmountField {
                player.provisions = foodAmountField.integerValue
                if player.provisions < 0 { player.provisions = 0 }
                needToSave = true
            }
        }
    }

    @IBAction func drinkPotion(_ sender: Any) {
        // Player drinks their magic potion
        if player.drinks > 0 {
            switch (player.potion) {
            case kPotionDexterity:
                // Potion of Dexterity - skill returned to initial value
                player.skill = player.initialSkill
            case kPotionStrength:
                // Potion of strength - stamina returned to initial value
                player.stamina = player.initialStamina
            case kPotionFortune:
                // Potion of fortune - Initial luck increased by 1, luck set to new initial
                player.initialLuck = player.initialLuck + 1
                player.luck = player.initialLuck
            default:
                player.luck = player.luck
            }

            needToSave = true
            player.drinks = player.drinks - 1

            if player.drinks == 0 { player.potion = kPotionNone }

            updateStats()
        }
    }

    @IBAction func adjustGold(_ sender: Any) {

        if let asender = (sender as? NSStepper) {
            if asender == goldStepper {
                if player.gold == 0 && asender.integerValue == -1 { return }

                player.gold = player.gold + asender.integerValue
                asender.integerValue = 0
                needToSave = true;

                updateStats()
            }
        }

        if let asender = (sender as? NSTextField) {
            if asender == goldAmountField {
                player.gold = goldAmountField.integerValue
                asender.integerValue = 0
                needToSave = true;

                updateStats()
            }
        }
    }

    // MARK: Combat Tab Functions

    @IBAction func setTarget(_ sender: Any) {

        // Just make sure only one monster can be targetted at once
        if let asender = (sender as? NSButton) {
            if asender == monsterOneTargetCheck {
                monsterTwoTargetCheck.state = NSControl.StateValue.off
                monsterThreeTargetCheck.state = NSControl.StateValue.off
            } else if asender == monsterTwoTargetCheck {
                monsterOneTargetCheck.state = NSControl.StateValue.off
                monsterThreeTargetCheck.state = NSControl.StateValue.off
            } else if asender == monsterThreeTargetCheck {
                monsterTwoTargetCheck.state = NSControl.StateValue.off
                monsterOneTargetCheck.state = NSControl.StateValue.off
            }
        }
    }

    @IBAction func strike(_ sender: Any) {

        // Clear the result readout
        combatReadoutOne.stringValue = " "
        combatReadoutTwo.stringValue = " "

        // Some housekeeping: if any monster's Stamina is zero, they can't be a target or in the fight
        // We have to apply this in case the user changes it mid-fight

        if monsterOneStamField.integerValue < 1 {
            monsterOneTargetCheck.state = NSControl.StateValue.off
            monsterOneCombatCheck.state = NSControl.StateValue.off
        }

        if monsterTwoStamField.integerValue < 1 {
            monsterTwoTargetCheck.state = NSControl.StateValue.off
            monsterTwoCombatCheck.state = NSControl.StateValue.off
        }

        if monsterThreeStamField.integerValue < 1 {
            monsterThreeTargetCheck.state = NSControl.StateValue.off
            monsterThreeCombatCheck.state = NSControl.StateValue.off
            }

        // Roll the character's Attack Strength
        var playerAttackStrength : Int = player.skill + Int(arc4random() % 6) + Int(arc4random() % 6) + 2

        // Add in modifier
        playerAttackStrength = playerAttackStrength + 6 - playerMod.indexOfSelectedItem

        // Select target. Note these are controlled elsewhere to ensure only one or no
        // Target checks are selected
        var target: Int = 0

        if monsterOneTargetCheck.state == NSControl.StateValue.on { target = 1 }
        if monsterTwoTargetCheck.state == NSControl.StateValue.on { target = 2 }
        if monsterThreeTargetCheck.state == NSControl.StateValue.on { target = 3 }

        // Save target for combat-related Luck tests
        combatLuckMonster = target;
        var monsterAttackStrength: Int = 0
        var monsterStrength: Int = 0

        switch (target) {
        case 1:
            monsterAttackStrength = monsterOneSkillField.integerValue + Int(arc4random() % 6) + Int(arc4random() % 6) + 2
            monsterStrength = monsterOneStamField.integerValue
        case 2:
            monsterAttackStrength = monsterTwoSkillField.integerValue + Int(arc4random() % 6) + Int(arc4random() % 6) + 2
            monsterStrength = monsterTwoStamField.integerValue
        case 3:
            monsterAttackStrength = monsterThreeSkillField.integerValue + Int(arc4random() % 6) + Int(arc4random() % 6) + 2
            monsterStrength = monsterThreeStamField.integerValue
        default:
            combatReadoutTwo.stringValue = "You didn't select a target..."
        }

        monsterAttackStrength = monsterAttackStrength + 6 - monsterMod.indexOfSelectedItem

        // Preserve the outcome of the round in case a Luck test is made
        // 1 indicates character victory - ie. Luck test to increase damage on monster
        // 2 indicated monster victory - ie. Luck test to reduce damage to character
        combatLuckOutcome = 0
        var roll: Int = 0

        // Compare Attack Strength values, find the combat round's winner and apply damage
        // First make sure at least one monster has been checked as in the fight
        if monsterOneCombatCheck.state == NSControl.StateValue.on ||
            monsterTwoCombatCheck.state == NSControl.StateValue.on ||
            monsterThreeCombatCheck.state == NSControl.StateValue.on {
            if playerAttackStrength > monsterAttackStrength {
                monsterStrength = monsterStrength - 2
                combatReadoutOne.stringValue = "Your weapon strikes home..."
                roll = Int(arc4random() % 6) + 1
                combatLuckOutcome = 1
            } else if (monsterAttackStrength > playerAttackStrength)
            {
                player.stamina = player.stamina - 2
                combatReadoutOne.stringValue = "The creature strikes you..."
                combatLuckOutcome = 2
                needToSave = true
            } else {
                roll = Int(arc4random() % 6) + 1
                combatReadoutOne.stringValue = (roll % 2 == 0) ? "You parry the blow..." : "The creature dodges your attack..."
            }

            // Now check for other monsters' attacks, if anys
            // If character's already dead, it only wastes CPU cycles, result's the same
            if monsterOneCombatCheck.state == NSControl.StateValue.on && target != 1 {
                // Monster One's in the game but not the target
                monsterAttackStrength = monsterOneSkillField.integerValue + Int(arc4random() % 6) + Int(arc4random() % 6) + 2

                // Only care if it hits the character
                if monsterAttackStrength > playerAttackStrength {
                    player.stamina = player.stamina - 2
                    combatReadoutTwo.stringValue = "You take another hit..."
                }
            }

            if monsterTwoCombatCheck.state == NSControl.StateValue.on && target != 2 {
                // Monster Two's in the game but not the target
                monsterAttackStrength = monsterTwoSkillField.integerValue + Int(arc4random() % 6) + Int(arc4random() % 6) + 2

                // Only care if it hits the character
                if monsterAttackStrength > playerAttackStrength {
                    player.stamina = player.stamina - 2
                    combatReadoutTwo.stringValue = "You take another hit..."
                }
            }

            if monsterThreeCombatCheck.state == NSControl.StateValue.on && target != 3 {
                // Monster Three's in the game but not the target
                monsterAttackStrength = monsterThreeSkillField.integerValue + Int(arc4random() % 6) + Int(arc4random() % 6) + 2

                // Only care if it hits the character
                if monsterAttackStrength > playerAttackStrength {
                    player.stamina = player.stamina - 2
                    combatReadoutTwo.stringValue = "You take another hit..."
                }
            }

            // All attacks are done now, so we just need to check if the attacked monster's dead or not.
            // If it is, move target radio button seletion and zero its skill reading
            if monsterStrength < 1 {
                monsterStrength = 0

                switch (target) {
                case 1:
                    monsterOneStamField.stringValue = "\(monsterStrength)"
                    combatReadoutTwo.stringValue = "...killing the beast"

                    // Move target radio button selection along
                    monsterOneTargetCheck.state = NSControl.StateValue.off
                    monsterOneCombatCheck.state = NSControl.StateValue.off
                    monsterTwoTargetCheck.state = NSControl.StateValue.on
                case 2:
                    monsterTwoStamField.stringValue = "\(monsterStrength)"
                    combatReadoutTwo.stringValue = "...killing the beast"
                    monsterTwoTargetCheck.state = NSControl.StateValue.off
                    monsterTwoCombatCheck.state = NSControl.StateValue.off
                    monsterThreeTargetCheck.state = NSControl.StateValue.on
                default:
                    monsterThreeStamField.stringValue = "\(monsterStrength)"
                    combatReadoutTwo.stringValue = "...killing the beast"
                    monsterThreeTargetCheck.state = NSControl.StateValue.off
                    monsterThreeCombatCheck.state = NSControl.StateValue.off
                    monsterOneTargetCheck.state = NSControl.StateValue.on
                }
            }

            // Update monster Stamina readout no matter what - it has to say zero if that's what the number is
            switch (target) {
            case 1:
                monsterOneStamField.stringValue = "\(monsterStrength)"
            case 2:
                monsterTwoStamField.stringValue = "\(monsterStrength)"
            default:
                monsterThreeStamField.stringValue = "\(monsterStrength)"
            }

            // Clear the Luck check flag if the player
            combatLuckCheck = false

            // Update the stats - this checks for player death
            updateStats()

            // Present local stats for the player
            combatReadoutThree.stringValue = "Your Stamina is \(player.stamina). Your Luck is \(player.luck)"
        } else {
            combatReadoutOne.stringValue = "No monster has been selected to fight..."
            combatLuckCheck = true
        }
    }
    
    // MARK: Player Management Functions

    func playerDead() {
        // Perform the death routine
    }

    @IBAction func showAbout(_ sender: Any) {
        window.beginSheet(aboutSheet, completionHandler:nil)
    }

    @IBAction func closeAbout(_ sender: Any) {
        window.endSheet(aboutSheet)
    }

    // MARK: Player Creation Functions

    @IBAction func newPlayer(_ sender: Any) {
        showPlayerCreate()
    }

    func showPlayerCreate() {
        window.beginSheet(createSheet, completionHandler: nil)
    }

    @IBAction func rollStats(sender: Any) {

        // Roll basic stats
        var roll: Int

        roll = Int((arc4random() % 6) + 1) + 6
        startSkillField.stringValue = "\(roll)"

        roll = Int(arc4random() % 6 + arc4random() % 6) + 14
        startStaminaField.stringValue = "\(roll)"

        roll = Int((arc4random() % 6) + 1) + 6
        startLuckField.stringValue = "\(roll)"
    }

    @IBAction func cancelSheet(sender: Any) {
        window.endSheet(createSheet)
    }

    @IBAction func setPlayer(sender: Any) {

        needToSave = false
        firstRun = false
        player.isDead = false

        var gameType: Int = kGameNone;

        player = FFPlayer()
        player.gold = startGoldField.integerValue
        player.provisions = startFoodField.integerValue
        player.potion = potionPopup.indexOfSelectedItem - 1
        player.drinks = 2

        player.fear = 0
        player.stamina = startStaminaField.integerValue
        player.initialStamina = player.stamina
        player.luck = startLuckField.integerValue
        player.initialLuck = player.luck

        // We make sure elsewhere that only one or none of these options are seleced
        // Note that all of these 'non-default' game types do not use potions, so
        // remove them if the user has selected one

        gameType = gamePopup.indexOfSelectedItem

        if gameType == kGameWarlock || gameType == kGameDeathtrap || gameType == kGameCityThieves || gameType == kGameForestDoom {
            // Standard games

            if gameType == kGameWarlock {
                player.gameName = "The Warlock of Firetop Mountain";
            }

            if gameType == kGameDeathtrap {
                player.gameName = "Deathtrap Dungeon";
            }

            if gameType == kGameCityThieves {
                player.gameName = "City of Thieves";
            }

            if gameType == kGameForestDoom {
                player.gameName = "Forest of Doom";
            }
        }

        if gameType == kGameCitadel {
            player.magic = Int((arc4random() % 6) + (arc4random() % 6)) + 8
            player.potion = kPotionNone
            player.drinks = 0
            player.gold = 0
            player.gameName = "Citadel of Chaos"
            citadelBox.isHidden = false
            hellBox.isHidden = true

            // Place an image in the gap to the left
            let image: NSImageView = NSImageView.init(frame: NSMakeRect(161, 10, 267, 106))
            image.image = NSImage.init(named: NSImage.Name("coc_stats"))
            statsTabView.addSubview(image)

            // Add back the Magic tab if necessary
            if !tabs.tabViewItems.contains(magicTab) { tabs.insertTabViewItem(heldTabs["magictab"]!, at: 2) }
        }

        if gameType == kGameHouseHell {
            player.skill = player.skill - 3
            player.maxFear = Int(arc4random() % 6) + 7
            player.fear = 0
            player.potion = kPotionNone
            player.drinks = 0
            player.gold = 0
            player.provisions = 0
            player.gameName = "House of Hell"
            hellBox.isHidden = false
            citadelBox.isHidden = true

            // Place an image in the gap to the left
            let image: NSImageView = NSImageView.init(frame: NSMakeRect(8, 14, 146, 96))
            image.image = NSImage.init(named: NSImage.Name("hell"))
            statsTabView.addSubview(image)

            // Remove the Magic tab
            heldTabs["magictab"] = magicTab!
            if tabs.tabViewItems.contains(magicTab) { tabs.removeTabViewItem(magicTab) }
        }

        if gameType == kGameCavernsSnow {
            player.drinks = 1
            player.gold = 0
            player.gameName = "Caverns of the Snow Witch"
        }

        if gameType == kGameReturnFiretop {
            player.potion = kPotionNone
            player.drinks = 0
            player.gold = 0
            player.provisions = 0
            player.gameName = "Return to Firetop Mountain"

        }

        if gameType == kGameTempleTerror {
            player.potion = kPotionNone
            player.drinks = 0
            player.gold = 25
            player.gameName = "Temple of Terror"
        }

        if gameType == kGameEyeDragon {
            player.potion = kPotionNone
            player.drinks = 0
            player.gold = 10
            player.gameName = "Eye of the Dragon"
        }

        // Sorcery! games - always the last two in the menu

        if gameType == kGameSorceryWizard {
            player.skill = player.skill - 2
            player.potion = kPotionNone
            player.drinks = 0
            player.gold = 20
            player.provisions = 2
            player.gameName = "Sorcery! Wizard"

        }

        if gameType == kGameSorceryFighter {
            player.potion = kPotionNone
            player.drinks = 0
            player.gold = 20
            player.provisions = 2
            player.gameName = "Sorcery! Fighter"
        }

        player.gamekind = gameType
        gameInProgress = true
        player.skill = startSkillField.integerValue
        player.initialSkill = player.skill

        if gameType == kGameHouseHell {
            player.initialSkill = player.skill + 3
        }

        // Initialise the backpack

        if player.pack.count > 0 {
            player.pack.removeAll()
        }

        if gameType != kGameHouseHell {
            player.pack.append("Lantern")
            player.pack.append("Sword")
            player.pack.append("Leather armour")
        }

        updateStats()

        // Hide the sheet
        window.endSheet(createSheet)
    }
}


