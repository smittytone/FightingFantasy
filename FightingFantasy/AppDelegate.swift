
//  FightingFantasy
//  Created by Tony Smith on 26/10/2017.
//  Copyright © 2005-2017 Tony Smith. All rights reserved.


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

class AppDelegate:  NSObject, NSApplicationDelegate, NSTableViewDelegate, NSTableViewDataSource,
                    NSTextFieldDelegate {

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

    // MARK: Test Tab Items

    @IBOutlet weak var testSkillValue: NSTextField!
    @IBOutlet weak var testLuckValue: NSTextField!
    @IBOutlet weak var testSkillMod: NSPopUpButton!
    @IBOutlet weak var testLuckMod: NSPopUpButton!
    @IBOutlet weak var dieOne: NSImageView!
    @IBOutlet weak var dieTwo: NSImageView!

    // MARK: Pack Tab Items

    @IBOutlet weak var packTable: NSTableView!
    @IBOutlet weak var addItemField: NSTextField!

    // MARK: Magic Tab Items

    @IBOutlet weak var creatureCopyField: NSTextField!
    @IBOutlet weak var creatureCopyCell: NSButtonCell!
    @IBOutlet weak var espField: NSTextField!
    @IBOutlet weak var espCell: NSButtonCell!
    @IBOutlet weak var fireField: NSTextField!
    @IBOutlet weak var fireCell: NSButtonCell!
    @IBOutlet weak var illusionField: NSTextField!
    @IBOutlet weak var illusionCell: NSButtonCell!
    @IBOutlet weak var levitationField: NSTextField!
    @IBOutlet weak var levitationCell: NSButtonCell!
    @IBOutlet weak var luckField: NSTextField!
    @IBOutlet weak var luckCell: NSButtonCell!
    @IBOutlet weak var shieldingField: NSTextField!
    @IBOutlet weak var shieldingCell: NSButtonCell!
    @IBOutlet weak var skillField: NSTextField!
    @IBOutlet weak var skillCell: NSButtonCell!
    @IBOutlet weak var staminaField: NSTextField!
    @IBOutlet weak var staminaCell: NSButtonCell!
    @IBOutlet weak var strengthField: NSTextField!
    @IBOutlet weak var strengthCell: NSButtonCell!
    @IBOutlet weak var weaknessField: NSTextField!
    @IBOutlet weak var weaknessCell: NSButtonCell!
    @IBOutlet weak var magicSpellsValue: NSTextField!
    @IBOutlet weak var spellOnePopup: NSPopUpButton!
    @IBOutlet weak var spellTwoPopup: NSPopUpButton!
    @IBOutlet weak var spellThreePopup: NSPopUpButton!
    @IBOutlet weak var spellFourPopup: NSPopUpButton!
    @IBOutlet weak var magicCitadelBox: NSBox!
    @IBOutlet weak var magicTempleBox: NSBox!

    // MARK: Player Creation Sheet

    @IBOutlet weak var createSheet: NSWindow!
    @IBOutlet weak var startGoldField: NSTextField!
    @IBOutlet weak var startFoodField: NSTextField!
    @IBOutlet weak var startSkillField: NSTextField!
    @IBOutlet weak var startStaminaField: NSTextField!
    @IBOutlet weak var startLuckField: NSTextField!
    @IBOutlet weak var startGamePopup: NSPopUpButton!
    @IBOutlet weak var startPotionPopup: NSPopUpButton!
    
    @IBOutlet weak var aboutSheet: NSWindow!

    // MARK: Globals

    var player: FFPlayer?
    var needToSave: Bool = false
    var gameInProgress: Bool = false
    var firstRun: Bool = true
    var heldTabs: [String:NSTabViewItem] = [:]
    var combatLuckMonster: Int = 0
    var combatLuckOutcome: Int = 0
    var combatLuckCheck: Bool = false
    var dice: [NSImage] = []
    var rollCount: Int = -1
    var packAddFlag: Bool = false

    var savePanel: NSSavePanel? = nil
    var savePath: String = ""

    // MARK: App Lifecycle Functions

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // Load dice images
        var image: NSImage? = NSImage.init(named: NSImage.Name("one"))
        dice.append(image!)
        image = NSImage.init(named: NSImage.Name("two"))
        dice.append(image!)
        image = NSImage.init(named: NSImage.Name("three"))
        dice.append(image!)
        image = NSImage.init(named: NSImage.Name("four"))
        dice.append(image!)
        image = NSImage.init(named: NSImage.Name("five"))
        dice.append(image!)
        image = NSImage.init(named: NSImage.Name("six"))
        dice.append(image!)

        // Set up pack table view
        packTable.target = self
        //packTable.doubleAction = #selector(tableViewDoubleClick(_:))

        // Select the first tab
        tabs.selectFirstTabViewItem(self)

        // Set up the UI
        initUI()

        // Are we starting a new game?
        if !gameInProgress { showPlayerCreate() }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


    func initUI() {

        // Set the UI to its default state

        // Disable elements by game type
        citadelBox.isHidden = true
        hellBox.isHidden = true

        // Now work through each of the tabs
        initUIstats()
        initUICombat()
        initUITests()
        initUIMagic()
    }

    func initUIstats() {

        // Update the stats readouts
        updateStatsSteppers()
        updateStats()

        // Hide the game-specific panels
        hellBox.isHidden = true
        citadelBox.isHidden = true
    }

    func updateStatsSteppers() {

        // Set the steppers' maximum values to the character's
        // expected values
        if player != nil {
            skillStepper.maxValue = Double(player!.maxSkill)
            skillStepper.integerValue = player!.skill

            staminaStepper.maxValue = Double(player!.maxStamina)
            staminaStepper.integerValue = player!.stamina

            luckStepper.maxValue = Double(player!.maxLuck)
            luckStepper.integerValue = player!.luck

            fearStepper.maxValue = Double(player!.maxFear)
            fearStepper.integerValue = player!.fear
        }
    }

    func initUICombat() {

        combatReadoutOne.stringValue = ""
        combatReadoutTwo.stringValue = ""
    }

    func initUITests() {

        // NOTE skill and luck readouts set by updateStats()

        dieOne.image = dice[Int(arc4random() % 6)]
        dieTwo.image = dice[Int(arc4random() % 6)]
    }


    func initUIMagic() {

        magicSpellsValue.stringValue = "0"
    }

    func updateStats() {

        var colour: NSColor = NSColor.black
        let tps = NSMutableParagraphStyle()
        tps.alignment = .center

        if let zplayer = player {

            // Status tab
            skillValue.stringValue = "\(zplayer.skill)"

            if zplayer.luck < 1 { zplayer.luck = 0 }
            colour = zplayer.luck < 5 ? NSColor.red : NSColor.black
            var astring = NSAttributedString.init(string: "\(zplayer.luck)", attributes: [ NSAttributedStringKey.foregroundColor : colour, NSAttributedStringKey.paragraphStyle : tps ])
            luckValue.attributedStringValue = astring
            testLuckValue.attributedStringValue = astring


            colour = zplayer.stamina < 5 ? NSColor.red : NSColor.black
            astring = NSAttributedString.init(string: "\(zplayer.stamina)", attributes: [ NSAttributedStringKey.foregroundColor : colour, NSAttributedStringKey.paragraphStyle : tps ])
            staminaValue.attributedStringValue = astring

            colour = zplayer.fear > zplayer.maxFear - 5 ? NSColor.red : NSColor.black
            astring = NSAttributedString.init(string: "\(zplayer.fear)", attributes: [ NSAttributedStringKey.foregroundColor : colour, NSAttributedStringKey.paragraphStyle : tps ])
            fearValue.attributedStringValue = astring
            maxFearValue.stringValue = "\(zplayer.maxFear)"

            magicValue.stringValue = "\(zplayer.magic)"
            foodAmountField.stringValue = "\(zplayer.provisions)"
            goldAmountField.stringValue = "\(zplayer.gold)"

            var ps: String = ""
            switch (zplayer.potion) {
            case kPotionDexterity:
                ps = "Potion of Dexterity"
            case kPotionStrength:
                ps = "Potion of Strength"
            case kPotionFortune:
                ps = "Potion of Fortune"
            default:
                ps = "None"
            }

            ps = ps + (zplayer.drinks > 0 ? " x \(zplayer.drinks)" : "")
            potionTypeLabel.stringValue = ps

            // Test tab
            testSkillValue.stringValue = "\(zplayer.skill)"
            
            // Pack tab
            packTable.reloadData()
            packTable.needsDisplay = true

            // Magic tab
            magicSpellsValue.stringValue = "\(zplayer.magic)"

            // This section is run when any stat changes, so centralise death checks here
            // FirstRun is sampled so we don't present the death box before a character's been rolled or loaded

            if zplayer.stamina < 1 && !firstRun {
                // Death by weakness

                //[deathBox showWindow:self];

                zplayer.isDead = true
                needToSave = false
                firstRun = true
                return
            }

            if zplayer.gamekind == kGameHouseHell {
                // Are we playing House of Hell? If not we don't need the following check
                if zplayer.fear >= zplayer.maxFear && !firstRun {
                    // Death by insanity
                    //[madBox showWindow:self];

                    zplayer.isDead = true
                    needToSave = false
                    firstRun = true
                    return
                }
            }
        }

        window.isDocumentEdited = needToSave
    }

    // MARK: Stats Tab Functions

    @IBAction func adjustSkill(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        if let stepper = (sender as? NSStepper) {

            let stepperValue = stepper.integerValue
            player!.skill = stepperValue

            if player!.skill > player!.maxSkill { player!.skill = player!.maxSkill }
            if player!.skill < 0 { player!.skill = 0 }

            needToSave = true
            updateStats()
        }
    }

    @IBAction func adjustStamina(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        if let stepper = (sender as? NSStepper) {

            let stepperValue = stepper.integerValue
            player!.stamina = stepperValue

            if player!.stamina > player!.maxStamina { player!.stamina = player!.maxStamina }
            if player!.stamina < 0 { player!.stamina = 0 }

            needToSave = true
            updateStats()
        }
    }

    @IBAction func adjustLuck(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        if let stepper = (sender as? NSStepper) {

            let stepperValue = stepper.integerValue
            player!.luck = stepperValue

            if player!.luck > player!.maxLuck { player!.luck = player!.maxLuck }
            if player!.luck < 0 { player!.luck = 0 }

            needToSave = true
            updateStats()
        }
    }

    @IBAction func adjustFood(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        if let asender = (sender as? NSButton) {
            if asender == foodEatButton {
                if player!.provisions > 0 {
                    player!.provisions = player!.provisions - 1
                    foodAmountField.stringValue = "\(player!.provisions)"
                    player!.stamina = player!.stamina + 4
                    if player!.stamina > player!.maxStamina { player!.stamina = player!.maxStamina }

                    needToSave = true
                    updateStats()
                }
            }
        }

        if let asender = (sender as? NSTextField) {
            if asender == foodAmountField {
                player!.provisions = foodAmountField.integerValue
                if player!.provisions < 0 { player!.provisions = 0 }
                needToSave = true
            }
        }
    }

    @IBAction func drinkPotion(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        if player!.drinks > 0 {
            switch (player!.potion) {
            case kPotionDexterity:
                // Potion of Dexterity - skill returned to initial value
                player!.skill = player!.initialSkill
            case kPotionStrength:
                // Potion of strength - stamina returned to initial value
                player!.stamina = player!.initialStamina
            case kPotionFortune:
                // Potion of fortune - Initial luck increased by 1, luck set to new initial
                player!.initialLuck = player!.initialLuck + 1
                player!.luck = player!.initialLuck
            default:
                player!.luck = player!.luck
            }

            player!.drinks = player!.drinks - 1
            if player!.drinks == 0 { player!.potion = kPotionNone }

            needToSave = true
            updateStats()
        }
    }

    @IBAction func adjustGold(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        if let asender = (sender as? NSStepper) {
            if asender == goldStepper {
                if player!.gold == 0 && asender.integerValue == -1 { return }

                player!.gold = player!.gold + asender.integerValue
                asender.integerValue = 0

                needToSave = true;
                updateStats()
            }
        }

        if let asender = (sender as? NSTextField) {
            if asender == goldAmountField {
                player!.gold = goldAmountField.integerValue
                asender.integerValue = 0

                needToSave = true;
                updateStats()
            }
        }
    }

    @IBAction func adjustFear(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        if let stepper = (sender as? NSStepper) {

            let stepperValue = stepper.integerValue
            player!.fear = stepperValue

            if player!.fear > player!.maxFear { player!.fear = player!.maxFear }
            if player!.fear < 0 { player!.fear = 0 }

            needToSave = true
            updateStats()
        }
    }

    // MARK: Combat Tab Functions

    @IBAction func setTarget(_ sender: Any) {

        // Make sure only one monster can be targetted at once
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

        if !gameInProgress { return }

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
        var playerAttackStrength : Int = player!.skill + Int(arc4random() % 6 + arc4random() % 6) + 2

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
                player!.stamina = player!.stamina - 2
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
                    player!.stamina = player!.stamina - 2
                    combatReadoutTwo.stringValue = "You take another hit..."
                }
            }

            if monsterTwoCombatCheck.state == NSControl.StateValue.on && target != 2 {
                // Monster Two's in the game but not the target
                monsterAttackStrength = monsterTwoSkillField.integerValue + Int(arc4random() % 6) + Int(arc4random() % 6) + 2

                // Only care if it hits the character
                if monsterAttackStrength > playerAttackStrength {
                    player!.stamina = player!.stamina - 2
                    combatReadoutTwo.stringValue = "You take another hit..."
                }
            }

            if monsterThreeCombatCheck.state == NSControl.StateValue.on && target != 3 {
                // Monster Three's in the game but not the target
                monsterAttackStrength = monsterThreeSkillField.integerValue + Int(arc4random() % 6) + Int(arc4random() % 6) + 2

                // Only care if it hits the character
                if monsterAttackStrength > playerAttackStrength {
                    player!.stamina = player!.stamina - 2
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
            combatReadoutThree.stringValue = "Your Stamina is \(player!.stamina). Your Luck is \(player!.luck)"
        } else {
            combatReadoutOne.stringValue = "No monster has been selected to fight..."
            combatLuckCheck = true
        }
    }

    // MARK: Test Tab Functions

    @IBAction func testLuck(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        var roll: Int = Int(arc4random() % 6 + arc4random() % 6) + 2
        roll = roll + 3 - testLuckMod.indexOfSelectedItem
        player!.luck = player!.luck - 1
        needToSave = true
        showAlert((roll <= player!.luck ? "Destiny smiles upon you..." : "You are ill-favoured..."), "", true)
    }

    @IBAction func testSkill(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        var roll: Int = Int(arc4random() % 6 + arc4random() % 6) + 2
        roll = roll + 3 - testSkillMod.indexOfSelectedItem
        needToSave = true
        showAlert((roll <= player!.skill ? "You were skilfull..." : "You fumble the test..."), "", true)
    }

    @IBAction func rollDice(_ sender: Any) {

        if let asender = (sender as? AppDelegate) {
            if asender == self {
                // We are here through a timer call
                if rollCount > 0 {
                    var roll: Int = Int(arc4random() % 6)
                    dieOne.image = dice[roll]

                    roll = Int(arc4random() % 6)
                    dieTwo.image = dice[roll]

                    rollCount = rollCount - 1
                    _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { (timer) in
                        self.rollDice(self)
                    })
                } else {
                    rollCount = -1
                }
            }

            return
        }

        if rollCount == -1 {

            // We have clicked the button, but we check against rollcount so that
            // subsequent (fast) clicks don't trigger the sequence
            rollCount = 10
            _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { (timer) in
                self.rollDice(self)
            })
        }
    }

    // MARK: Pack Tab Functions

    @IBAction func addPackItem(_ sender: Any) {

        if let zplayer = player {
            var item = addItemField.stringValue;
            if item.characters.count == 0 { item = "New pack item" }

            zplayer.pack.append(item)

            packTable.reloadData()
            packTable.needsDisplay = true

            addItemField.stringValue = ""

            needToSave = true
            updateStats()
        }
    }

    @IBAction func usePackItem(_ sender: Any) {

        if let zplayer = player {
            zplayer.pack.remove(at: zplayer.packSelectedItem)

            packTable.reloadData()
            packTable.needsDisplay = true

            needToSave = true
            updateStats()
        }
    }

    // Data Source Delegate Functions

    func numberOfRows(in tableView: NSTableView) -> Int {

        return (player != nil ? player!.pack.count : 0)
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        if let zplayer = player {

            if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "packcell"), owner: nil) as? NSTableCellView {

                cell.textField?.stringValue = zplayer.pack[row]

                let cls = zplayer.pack[row].lowercased()
                var range = cls.range(of: "sword")

                if  range != nil {
                    let image: NSImage? = NSImage.init(named: NSImage.Name("icon_sword"))
                    cell.imageView?.image = image ?? nil
                }

                range = cls.range(of: "lantern")

                if  range != nil {
                    let image: NSImage? = NSImage.init(named: NSImage.Name("icon_lantern"))
                    cell.imageView?.image = image ?? nil
                }

                range = cls.range(of: "armour")

                if  range != nil {
                    let image: NSImage? = NSImage.init(named: NSImage.Name("icon_armour"))
                    cell.imageView?.image = image ?? nil
                }

                range = cls.range(of: "armor")

                if  range != nil {
                    let image: NSImage? = NSImage.init(named: NSImage.Name("icon_armour"))
                    cell.imageView?.image = image ?? nil
                }

                return cell
            }
        }

        return nil
    }

    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {

        if let zplayer = player { zplayer.packSelectedItem = row }
        return true
    }

    @objc func tableViewDoubleClick(_ sender:AnyObject) {

        // Make sure user has double-clicked on a non-empty row
        if packTable.selectedRow >= 0 {
            //usePackItem(self)
            if let cell = packTable.view(atColumn: 0, row: packTable.selectedRow, makeIfNecessary: false) {
                let item = cell as! NSTableCellView
                item.textField?.isEditable = true
                item.textField?.delegate = self
            }
        }
    }

    // MARK: Magic Tab Functions

    @IBAction func castSpell(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        var success: Bool = false

        if player!.gamekind != kGameCitadel {
            // Not a Citadel of Chaos game? Then ignore click
            showAlert("This section is only for Citadel of Chaos games", "", false)
            return
        }

        if creatureCopyCell.state == NSControl.StateValue.on {
            if creatureCopyField.integerValue > 0 {
                success = true
                player!.magic = player!.magic - 1
                creatureCopyField.stringValue = "\(creatureCopyField.integerValue - 1)"
            }
        }

        if espCell.state == NSControl.StateValue.on {
            if espField.integerValue > 0 {
                success = true
                player!.magic = player!.magic - 1
                espField.stringValue = "\(espField.integerValue - 1)"
            }
        }

        if fireCell.state == NSControl.StateValue.on {
            if fireField.integerValue > 0 {
                success = true
                player!.magic = player!.magic - 1
                fireField.stringValue = "\(fireField.integerValue - 1)"
            }
        }

        if illusionCell.state == NSControl.StateValue.on {
            if illusionField.integerValue > 0 {
                success = true
                player!.magic = player!.magic - 1
                illusionField.stringValue = "\(illusionField.integerValue - 1)"
            }
        }

        if levitationCell.state == NSControl.StateValue.on {
            if levitationField.integerValue > 0 {
                success = true
                player!.magic = player!.magic - 1
                levitationField.stringValue = "\(levitationField.integerValue - 1)"
            }
        }

        if luckCell.state == NSControl.StateValue.on {
            if luckField.integerValue > 0 {
                success = true
                player!.luck = player!.luck + (player!.initialLuck / 2)
                player!.magic = player!.magic - 1
                luckField.stringValue = "\(luckField.integerValue - 1)"
            }
        }

        if shieldingCell.state == NSControl.StateValue.on {
            if shieldingField.integerValue > 0 {
                success = true
                player!.magic = player!.magic - 1
                shieldingField.stringValue = "\(shieldingField.integerValue - 1)"
            }
        }

        if skillCell.state == NSControl.StateValue.on {
            if skillField.integerValue > 0 {
                success = true
                player!.skill = player!.skill + (player!.initialSkill / 2)
                player!.magic = player!.magic - 1
                skillField.stringValue = "\(skillField.integerValue - 1)"
            }
        }

        if staminaCell.state == NSControl.StateValue.on {
            if staminaField.integerValue > 0 {
                success = true
                player!.stamina = player!.stamina + (player!.initialStamina / 2)
                player!.magic = player!.magic - 1
                staminaField.stringValue = "\(staminaField.integerValue - 1)"
            }
        }

        if strengthCell.state == NSControl.StateValue.on {
            if strengthField.integerValue > 0 {
                success = true
                player!.magic = player!.magic - 1
                strengthField.stringValue = "\(strengthField.integerValue - 1)"
            }
        }

        if weaknessCell.state == NSControl.StateValue.on {
            if weaknessField.integerValue > 0 {
                success = true
                player!.magic = player!.magic - 1
                weaknessField.stringValue = "\(weaknessField.integerValue - 1)"
            }
        }

        if (success) {
            needToSave = true
            showAlert("You cast the spell...", "The gamebook will tell you the outcome of your success", true)
        } else {
            showAlert("You could not cast the spell...", "The gamebook will tell you the outcome of your failure", true)
        }
    }

    @IBAction func magicTotaliser(_ sender: Any) {

        // This routine is called when the user types in a number into a magic spell Uses field.
        // It adds up all the points entered thus far to make sure they don't exceed the Magic value.

        if let zplayer = player {

            if zplayer.gamekind != kGameCitadel {
                // Not a Citadel of Chaos game? Then ignore click
                showAlert("This section is only for Citadel of Chaos games", "", false)
                return
            }

            let magicTotal: Int = zplayer.magic
            var points: Int = 0

            points = creatureCopyField.integerValue + espField.integerValue + fireField.integerValue + illusionField.integerValue +
                levitationField.integerValue + luckField.integerValue + shieldingField.integerValue + skillField.integerValue +
                staminaField.integerValue + strengthField.integerValue + weaknessField.integerValue

            if points > magicTotal {
                // Zero the points just entered
                if let asender = (sender as? NSTextField) { asender.stringValue = "0" }
                showAlert("You have assigned more magic points than you have available to spend", "", false)
                return
            }

            // Update the 'total points left' field
            magicSpellsValue.stringValue = "\(magicTotal - points)"
        }
    }

    func showAlert(_ title: String, _ message: String, _ update: Bool) {

        let alert: NSAlert = NSAlert.init()
        alert.messageText = title
        if message.characters.count > 0 { alert.informativeText = message }

        alert.beginSheetModal(for: window, completionHandler: { (modalResponse) in
            if update { self.updateStats() }
        })
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

    @IBAction func savePlayer(_ sender: Any) {

        // Don't continue if the player is dead or nothing has changed
        // since the last save
        if player == nil || !needToSave { return }
        if player!.isDead { return }

        if savePath.characters.count == 0 {
            // We have no save path for some reason, so force a Save As...
            savePlayerAs(self)
            return
        }

        // Save the player
        let result: Bool = save(savePath)

        if result {
            needToSave = false
            window.isDocumentEdited = false
        }

    }

    @IBAction func savePlayerAs(_ sender: Any) {

        // Only proceed if the player isn't dead
        if player == nil { return }

        if !player!.isDead {
            if savePanel == nil { savePanel = NSSavePanel.init() }
            if let panel = savePanel {
                panel.nameFieldLabel = "Character name"
                panel.isExtensionHidden = true
                panel.beginSheetModal(for: window, completionHandler: { (response) in

                    var path: String = ""
                    var result: Bool

                    if response == NSApplication.ModalResponse.OK {
                        if let url = panel.url {
                            path = url.path
                            path = (path as NSString).lastPathComponent
                            path = (path as NSString).deletingPathExtension
                            self.player!.name = path
                        }

                        if let url = panel.url {
                            path = url.path
                            result = self.save(path)
                            self.needToSave = result

                            if result {
                                self.needToSave = false
                                self.window.isDocumentEdited = false
                            }
                        }
                    }
                })
            }
        }
    }

    func save(_ path: String) -> Bool {

        var result: Bool = false

        if let zplayer = player {

            // Back-up Citadel of Chaos magic spell uses table
            zplayer.citadelSpellMatrix[0] = creatureCopyField.integerValue
            zplayer.citadelSpellMatrix[1] = espField.integerValue
            zplayer.citadelSpellMatrix[2] = fireField.integerValue
            zplayer.citadelSpellMatrix[3] = illusionField.integerValue
            zplayer.citadelSpellMatrix[4] = levitationField.integerValue
            zplayer.citadelSpellMatrix[5] = luckField.integerValue
            zplayer.citadelSpellMatrix[6] = shieldingField.integerValue
            zplayer.citadelSpellMatrix[7] = skillField.integerValue
            zplayer.citadelSpellMatrix[8] = staminaField.integerValue
            zplayer.citadelSpellMatrix[9] = strengthField.integerValue
            zplayer.citadelSpellMatrix[10] = weaknessField.integerValue

            // Back up Skill/Luck Test Modifiers
            zplayer.modMatrix[0] = testLuckMod.indexOfSelectedItem
            zplayer.modMatrix[1] = testSkillMod.indexOfSelectedItem
            zplayer.modMatrix[2] = playerMod.indexOfSelectedItem
            zplayer.modMatrix[3] = monsterMod.indexOfSelectedItem

            // Back up Temple of Terror spells
            zplayer.templeSpellMatrix[0] = spellOnePopup.indexOfSelectedItem
            zplayer.templeSpellMatrix[1] = spellTwoPopup.indexOfSelectedItem
            zplayer.templeSpellMatrix[2] = spellThreePopup.indexOfSelectedItem
            zplayer.templeSpellMatrix[3] = spellFourPopup.indexOfSelectedItem

            // Save theCharacter object

            result = NSKeyedArchiver.archiveRootObject(zplayer, toFile: path)
        }
        return result
    }

    @IBAction func openCharacter(_ sender: Any) {

        let openPanel: NSOpenPanel = NSOpenPanel.init()
        openPanel.allowedFileTypes = ["ffc"]
        openPanel.allowsMultipleSelection = false
        openPanel.beginSheetModal(for: window, completionHandler: { (response) in

            var path: String = ""

            if response == NSApplication.ModalResponse.OK {
                path = openPanel.urls[0].path
                self.player = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? FFPlayer

                if let zplayer = self.player {
                    // Update the Citadel of Chaos magic spell matrix
                    if zplayer.gamekind == kGameCitadel {
                        self.creatureCopyField.stringValue = "\(zplayer.citadelSpellMatrix[0])"
                        self.espField.stringValue = "\(zplayer.citadelSpellMatrix[1])"
                        self.fireField.stringValue = "\(zplayer.citadelSpellMatrix[2])"
                        self.illusionField.stringValue = "\(zplayer.citadelSpellMatrix[3])"
                        self.levitationField.stringValue = "\(zplayer.citadelSpellMatrix[4])"
                        self.luckField.stringValue = "\(zplayer.citadelSpellMatrix[5])"
                        self.shieldingField.stringValue = "\(zplayer.citadelSpellMatrix[6])"
                        self.skillField.stringValue = "\(zplayer.citadelSpellMatrix[7])"
                        self.staminaField.stringValue = "\(zplayer.citadelSpellMatrix[8])"
                        self.strengthField.stringValue = "\(zplayer.citadelSpellMatrix[9])"
                        self.weaknessField.stringValue = "\(zplayer.citadelSpellMatrix[10])"
                    }

                    // Update the Temple of Terror magic spell readout
                    if zplayer.gamekind == kGameTempleTerror {
                        self.spellOnePopup.selectItem(at: zplayer.templeSpellMatrix[0])
                        self.spellTwoPopup.selectItem(at: zplayer.templeSpellMatrix[1])
                        self.spellThreePopup.selectItem(at: zplayer.templeSpellMatrix[2])
                        self.spellFourPopup.selectItem(at: zplayer.templeSpellMatrix[3])
                    }

                    // Handle tab hiding/unhiding
                    if zplayer.gamekind == kGameTempleTerror || zplayer.gamekind == kGameCitadel {
                        // Add back the Magic tab if necessary
                        if !self.tabs.tabViewItems.contains(self.magicTab) {
                            self.tabs.insertTabViewItem(self.heldTabs["magictab"]!, at: 2)
                        }
                    } else {
                        // Remove the Magic tab
                        self.heldTabs["magictab"] = self.magicTab!
                        if self.tabs.tabViewItems.contains(self.magicTab) { self.tabs.removeTabViewItem(self.magicTab) }
                    }

                    // Update the modifiers
                    self.testLuckMod.selectItem(at: zplayer.modMatrix[0])
                    self.testSkillMod.selectItem(at: zplayer.modMatrix[1])
                    self.playerMod.selectItem(at: zplayer.modMatrix[2])
                    self.monsterMod.selectItem(at: zplayer.modMatrix[3])

                    self.updateStats()
                    self.updateStatsSteppers()
                }
            }
        })
    }

    @IBAction func closeCharacter(_ sender: Any) {

        if gameInProgress {
            // There's a game going on, so warn the player
            let alert = NSAlert.init()
            alert.messageText = needToSave ? "You have a game in progress with unsaved changes" : "You have a game in progress"
            alert.informativeText = needToSave ? "If you close the character now, unsaved changes will be lost" : "Are you sure?"
            alert.addButton(withTitle: "Continue")
            alert.addButton(withTitle: "Cancel")
            alert.beginSheetModal(for: window, completionHandler: { (response) in
                if response == NSApplication.ModalResponse.alertFirstButtonReturn { self.doClose() }
            })

            return
        }

        // Otherwise, just close
        doClose()
    }

    func doClose() {

        // Clear the player and refresh the UI
        player = nil
        initUI()
    }

    // MARK: Player Creation Functions

    @IBAction func newPlayer(_ sender: Any) {

        if gameInProgress {
            // There's a game in progress, so warn the user
            let alert = NSAlert.init()
            alert.messageText = needToSave ? "You have a game in progress with unsaved changes" : "You have a game in progress with unsaved changes"
            alert.informativeText = needToSave ? "If you create a new character now, unsaved changes will be lost" : "Are you sure?"
            alert.addButton(withTitle: "Continue")
            alert.addButton(withTitle: "Cancel")
            alert.beginSheetModal(for: window) { (response) in
                if response == NSApplication.ModalResponse.alertFirstButtonReturn {
                    self.showPlayerCreate()
                }
            }

            return
        }

        // Otherwise just present the New Player sheet
        showPlayerCreate()
    }

    func showPlayerCreate() {

        // Initialise the New Player UI
        startGoldField.stringValue = ""
        startFoodField.stringValue = ""
        startGamePopup.selectItem(at: 0)
        startPotionPopup.selectItem(at: 0)
        startSkillField.stringValue = "0"
        startStaminaField.stringValue = "0"
        startLuckField.stringValue = "0"

        // Present the New Player sheet
        window.beginSheet(createSheet, completionHandler: nil)
    }

    @IBAction func rollStats(sender: Any) {

        // Roll basic stats
        var roll: Int

        roll = Int(arc4random() % 6) + 7
        startSkillField.stringValue = "\(roll)"

        roll = Int(arc4random() % 6 + arc4random() % 6) + 14
        startStaminaField.stringValue = "\(roll)"

        roll = Int(arc4random() % 6) + 7
        startLuckField.stringValue = "\(roll)"
    }

    @IBAction func cancelSheet(sender: Any) {
        window.endSheet(createSheet)
    }

    @IBAction func setPlayer(sender: Any) {

        // Initialise the game
        needToSave = true
        firstRun = false
        gameInProgress = true

        // Create a new player instance
        player = FFPlayer()
        player!.gold = startGoldField.integerValue
        player!.provisions = startFoodField.integerValue
        player!.potion = startPotionPopup.indexOfSelectedItem - 1
        player!.drinks = 2

        player!.skill = startSkillField.integerValue
        player!.initialSkill = player!.skill
        player!.stamina = startStaminaField.integerValue
        player!.initialStamina = player!.stamina
        player!.luck = startLuckField.integerValue
        player!.initialLuck = player!.luck

        // We make sure elsewhere that only one or none of these options are seleced
        // Note that all of these 'non-default' game types do not use potions, so
        // remove them if the user has selected one

        let gameType: Int = startGamePopup.indexOfSelectedItem
        player!.gamekind = gameType
        if gameType == kGameWarlock || gameType == kGameDeathtrap || gameType == kGameCityThieves || gameType == kGameForestDoom {
            if gameType == kGameWarlock { player!.gameName = "The Warlock of Firetop Mountain" }
            if gameType == kGameDeathtrap { player!.gameName = "Deathtrap Dungeon" }
            if gameType == kGameCityThieves { player!.gameName = "City of Thieves" }
            if gameType == kGameForestDoom { player!.gameName = "Forest of Doom" }
        }

        if gameType != kGameCitadel && gameType != kGameTempleTerror {
            // Remove the Magic tab for all but Citadel of Chaos and Temple of Terror
            heldTabs["magictab"] = magicTab!
            if tabs.tabViewItems.contains(magicTab) { tabs.removeTabViewItem(magicTab) }
        } else {
            // Add back the Magic tab if necessary
            if !tabs.tabViewItems.contains(magicTab) { tabs.insertTabViewItem(heldTabs["magictab"]!, at: 2) }
        }

        if gameType == kGameCitadel {
            player!.magic = Int(arc4random() % 6 + arc4random() % 6) + 8
            player!.potion = kPotionNone
            player!.drinks = 0
            player!.gold = 0
            player!.gameName = "Citadel of Chaos"
            citadelBox.isHidden = false

            // Place an image in the gap to the left
            let image: NSImageView = NSImageView.init(frame: NSMakeRect(161, 10, 267, 106))
            image.image = NSImage.init(named: NSImage.Name("coc_stats"))
            statsTabView.addSubview(image)

            magicSpellsValue.stringValue = "\(player!.magic)"
        }

        if gameType == kGameHouseHell {
            player!.skill = player!.skill - 3
            player!.initialSkill = player!.skill + 3
            player!.maxFear = Int(arc4random() % 6) + 7
            player!.fear = 0
            player!.potion = kPotionNone
            player!.drinks = 0
            player!.gold = 0
            player!.provisions = 0
            player!.gameName = "House of Hell"
            hellBox.isHidden = false

            // Place an image in the gap to the left
            let image: NSImageView = NSImageView.init(frame: NSMakeRect(8, 14, 146, 96))
            image.image = NSImage.init(named: NSImage.Name("hell"))
            statsTabView.addSubview(image)
        }

        if gameType == kGameCavernsSnow {
            player!.drinks = 1
            player!.gold = 0
            player!.gameName = "Caverns of the Snow Witch"
        }

        if gameType == kGameReturnFiretop {
            player!.potion = kPotionNone
            player!.drinks = 0
            player!.gold = 0
            player!.provisions = 0
            player!.gameName = "Return to Firetop Mountain"

        }

        if gameType == kGameTempleTerror {
            player!.potion = kPotionNone
            player!.drinks = 0
            player!.gold = 25
            player!.gameName = "Temple of Terror"
        }

        if gameType == kGameEyeDragon {
            player!.potion = kPotionNone
            player!.drinks = 0
            player!.gold = 10
            player!.gameName = "Eye of the Dragon"
        }

        // Sorcery! games - always the last two in the menu

        if gameType == kGameSorceryWizard {
            player!.skill = player!.skill - 2
            player!.potion = kPotionNone
            player!.drinks = 0
            player!.gold = 20
            player!.provisions = 2
            player!.gameName = "Sorcery! Wizard"

        }

        if gameType == kGameSorceryFighter {
            player!.potion = kPotionNone
            player!.drinks = 0
            player!.gold = 20
            player!.provisions = 2
            player!.gameName = "Sorcery! Fighter"
        }

        // Initialise the backpack
        if player!.pack.count > 0 { player!.pack.removeAll() }

        // Only House of Hell starts you out with no kit
        if gameType != kGameHouseHell {
            player!.pack.append("Lantern")
            player!.pack.append("Sword")
            player!.pack.append("Leather armour")
        }

        updateStatsSteppers()
        updateStats()

        window.title = "Fighting Fantasy - " + player!.gameName
        window.endSheet(createSheet)
    }
}


