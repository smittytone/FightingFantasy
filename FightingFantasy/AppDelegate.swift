
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2017 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016 Steve Jackson and Ian Livingstone


import Cocoa


@NSApplicationMain

class AppDelegate:  NSObject, NSApplicationDelegate, NSTableViewDelegate, NSTableViewDataSource,
                    NSTextFieldDelegate, NSPopoverDelegate, NSTabViewDelegate, NSTextViewDelegate {

    @IBOutlet weak var splashWindow: NSWindow!
    
    @IBOutlet weak var menuBar: NSMenu!
    @IBOutlet weak var appMenu: NSMenu!
    @IBOutlet weak var aboutMenuItem: NSMenuItem!
    @IBOutlet weak var fileMenu: NSMenu!
    @IBOutlet weak var gameMenu: NSMenuItem!
    @IBOutlet weak var helpMenu: NSMenu!
    @IBOutlet weak var helpMenuItem: NSMenuItem!
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var tabs: NSTabView!

    @IBOutlet weak var bookmark: FFBookmarkView!
    @IBOutlet weak var bookmarkButtonView: NSView!
    @IBOutlet weak var bookmarkButtonButton: FFBookmarkButton!
    @IBOutlet weak var showBookmarkMenuItem: NSMenuItem!

    @IBOutlet weak var bookmarkWindow: NSWindow!
    @IBOutlet weak var bookmarkCurrentField: NSTextField!

    @IBOutlet weak var deathWindow: NSWindow!
    @IBOutlet weak var deathImageView: NSImageView!
    @IBOutlet weak var reanimateButton: NSButton!

    @IBOutlet weak var helpWindow: NSWindow!
    @IBOutlet weak var helpTextView: NSTextView!

    @IBOutlet weak var yazWindow: NSWindow!
    @IBOutlet weak var yazMatrix: NSMatrix!

    @IBOutlet weak var startSheet: NSWindow!
    @IBOutlet weak var startNewButton: NSButton!
    @IBOutlet weak var startLoadButton: NSButton!
    
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

    @IBOutlet weak var combatTabItem: NSTabViewItem!
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

    // MARK: Tests Tab Items

    @IBOutlet weak var testsTabItem: NSTabViewItem!
    @IBOutlet weak var testSkillValue: NSTextField!
    @IBOutlet weak var testLuckValue: NSTextField!
    @IBOutlet weak var testSkillMod: NSPopUpButton!
    @IBOutlet weak var testLuckMod: NSPopUpButton!
    @IBOutlet weak var dieOne: NSImageView!
    @IBOutlet weak var dieTwo: NSImageView!

    // MARK: Pack Tab Items

    @IBOutlet weak var packTable: NSTableView!
    @IBOutlet weak var iconPopoverController: FFViewController!

    // MARK: Magic Tab Items

    @IBOutlet weak var magicTabItem: NSTabViewItem!
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
    @IBOutlet weak var castSpellButton: NSButton!

    // Mark: Notes Tab

    @IBOutlet weak var notesTextView: NSTextView!

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
    @IBOutlet weak var aboutVersonLabel: NSTextField!
    
    // MARK: Globals

    var player: FFPlayer?

    var mustSave: Bool = false
    var needToSave: Bool {
        get {
            return self.mustSave
        }
        set {
            self.mustSave = newValue
            window.isDocumentEdited = newValue
        }
    }

    var gameInProgress: Bool = false
    var firstRun: Bool = true
    var doubleClickFileLoad: Bool = false

	var combatLuckMonster: Int = 0
    var combatLuckOutcome: Int = 0
    var combatLuckCheck: Bool = false

	var heldTabs: [String:NSTabViewItem] = [:]
	var dice: [NSImage] = []
    var icons: NSMutableArray = NSMutableArray.init()

	var rollCount: Int = -1
    var packAddFlag: Bool = false

    var savePanel: NSSavePanel? = nil
    var savePath: String = ""

    var iconPopover: NSPopover? = nil

    let onlyIntFormatter: FFTextFieldFormatter = FFTextFieldFormatter()

    var statsTabImage: NSImageView? = nil

    var bookmarkViewController: NSTitlebarAccessoryViewController = NSTitlebarAccessoryViewController.init()

    // MARK: - App Lifecycle Functions

    func applicationWillFinishLaunching(_ notification: Notification) {

        // Disable menus to prevent 'pre-window clicking'
        appMenu.autoenablesItems = false
        fileMenu.autoenablesItems = false
        helpMenu.autoenablesItems = false

        aboutMenuItem.isEnabled = false
        helpMenuItem.isEnabled = false

        for item in fileMenu.items {
            item.isEnabled = false
        }

        // Show the splash screen    
        splashWindow.center()
        splashWindow.backgroundColor = NSColor.clear
        splashWindow.alphaValue = 1.0
        splashWindow.isOpaque = true
        splashWindow.hasShadow = true;
        splashWindow.makeKeyAndOrderFront(self)

        // Stop modal sheets from blocking app termination
        startSheet.preventsApplicationTerminationWhenModal = false
        aboutSheet.preventsApplicationTerminationWhenModal = false
        deathWindow.preventsApplicationTerminationWhenModal = false
        helpWindow.preventsApplicationTerminationWhenModal = false
        createSheet.preventsApplicationTerminationWhenModal = false

        // Load up the images here so that they're present if the user double clicks on
        // a .ffc file - which will be loaded BEFORE applicationDidFinishLoading() is called

        // Load dice images into an array for easy access later
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

        // Load pack item icons into an array for easy access later
        image = NSImage.init(named: NSImage.Name("icon_lantern"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_sword"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_armour"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_rope"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_stick"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_skull"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_tooth"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_necklace"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_net"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_whip"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_axe"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_bow"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_quiver"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_hammer"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_dagger"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_mace"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_spear"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_sling"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_shield"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_helm"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_chainmail"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_boots"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_candle"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_horn"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_sack"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_bell"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_mirror"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_glass"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_scroll"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_book"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_staff"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_potion"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_herb"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_capsule"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_flute"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_whistle"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_eye"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_hand"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_chalice"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_gem"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_ring"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_crown"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_coins"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_key"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_pendant"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_chest"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_amulet"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_orb"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_bracelet"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_stone"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_bottle"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_food"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_tankard"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_fruit"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_fungus"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_salt"))
        icons.add(image!)

        // House of Hell specific icons
        image = NSImage.init(named: NSImage.Name("icon_gun"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_torch"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_box"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_bucket"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_flask"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_robe"))
        icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_duck"))
        icons.add(image!)

        // This should always come last
        image = NSImage.init(named: NSImage.Name("icon_generic"))
        icons.add(image!)

        // Set up the File menu
        fileMenu.autoenablesItems = false
        showBookmarkMenuItem.title = "Show Bookmark"
        showBookmarkMenuItem.isEnabled = false

        // Set up the Game menu
        gameMenu.isHidden = true

        // Set up accessory controller for titlebar
        bookmarkViewController.view = bookmarkButtonView
        bookmarkViewController.layoutAttribute = .right
        self.window?.addTitlebarAccessoryViewController(bookmarkViewController)
        bookmark.isHidden = true
        bookmarkButtonButton.bookmarkState = false

        // Set up pack table view
        packTable.target = self
        //packTable.doubleAction = #selector(tableViewDoubleClick(_:))
    }

    func application(_ sender: NSApplication, openFile filename: String) -> Bool {

        // NOTE This is called after applicationWillFinish: and before applicationDidFinish:

        // Set appropriate flags
        // NOTE We set 'gameInProgress' to true here to avoid
        // rolling out the New Character sheet in start()
        doubleClickFileLoad = true
        gameInProgress = true

        // Prep the UI
        start()

        // Load in the double-clicked file
        return self.openFileHander(filename)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // Set up notifications - used when the player selects a pack icon from the popover
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(updatePack), name: NSNotification.Name(rawValue: "set.pack.item.index"), object: nil)

        // Select the first tab
        tabs.selectFirstTabViewItem(self)

        // Close the splash window and exit if we're coming from a file-load
        if doubleClickFileLoad {
            doubleClickFileLoad = false
            return
        }

        // If we're not here from a file load, show the splash for four seconds
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) { (timer) in
            self.start()
        }
    }

    @objc func start() {

        // Refresh the UI
        initUI()

        // Close the splash window
        splashWindow.close()

        // Centre the window, then make it appear
        window.center()
        window.makeKeyAndOrderFront(self)

        // Are we starting a new game? May not be if the player double-clicked a saved file
        if !gameInProgress { showStartSheet() }
    }

    func applicationWillTerminate(_ aNotification: Notification) {

		// Insert code here to tear down your application
    }

    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {

        // Do we need to save the current character before quitting?
        if gameInProgress && needToSave && player != nil {
            let alert = NSAlert.init()
            alert.messageText = "You have a game in progress with unsaved changes"
            alert.informativeText = "If you quit now, unsaved changes will be lost"
            alert.addButton(withTitle: "Cancel")
            alert.addButton(withTitle: "Quit")
            alert.beginSheetModal(for: window, completionHandler: { (response) in
                if response == NSApplication.ModalResponse.alertFirstButtonReturn {
                    self.savePlayer(self)
                } else {
                    NSApp.reply(toApplicationShouldTerminate: true)
                }
            })

            return NSApplication.TerminateReply.terminateLater
        }

        return NSApplication.TerminateReply.terminateNow
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {

        return true
    }

    // MARK: - UI Initialization Functions

    func initUI() {

        // Sort out the menu Items
        aboutMenuItem.isEnabled = true
        helpMenuItem.isEnabled = true

        for item in fileMenu.items {
            item.isEnabled = true
        }

        // Set the UI to its default state
        // Work through each of the tabs
        initUIstats()
        initUICombat()
        initUITests()
        initUIPack()
        initUIMagic()
        initUINotes()

        // Hide the bookmark
        bookmark.isHidden = true
        bookmarkButtonButton.bookmarkState = false

        // Hide the Game menu
        gameMenu.isHidden = true

        // Add back the Magic Tab if necessary (only if we call this after at least one game)
        if !tabs.tabViewItems.contains(magicTabItem) {
            tabs.insertTabViewItem(heldTabs["magicTabItem"]!, at: 4)
        }
    }

    func initUIstats() {

        skillValue.stringValue = ""
        luckValue.stringValue = ""
        staminaValue.stringValue = ""

        goldAmountField.stringValue = ""
        foodAmountField.stringValue = ""
        potionTypeLabel.stringValue = "None"

        goldAmountField.formatter = onlyIntFormatter
        foodAmountField.formatter = onlyIntFormatter

        // Hide the game-specific panels
        hellBox.isHidden = true
        citadelBox.isHidden = true

        let image: NSImageView = NSImageView.init(frame: NSMakeRect(10, 56, 416, 85))
        image.image = NSImage.init(named: NSImage.Name("scroll"))
        statsTabView.addSubview(image)
        statsTabImage = image
    }

    func initUICombat() {

        monsterOneStamField.stringValue = ""
        monsterOneSkillField.stringValue = ""
        monsterTwoStamField.stringValue = ""
        monsterTwoSkillField.stringValue = ""
        monsterThreeStamField.stringValue = ""
        monsterThreeSkillField.stringValue = ""

        monsterOneStamField.formatter = onlyIntFormatter
        monsterOneSkillField.formatter = onlyIntFormatter
        monsterTwoStamField.formatter = onlyIntFormatter
        monsterTwoSkillField.formatter = onlyIntFormatter
        monsterThreeStamField.formatter = onlyIntFormatter
        monsterThreeSkillField.formatter = onlyIntFormatter

        playerMod.selectItem(at: 6)
        monsterMod.selectItem(at: 6)

        combatReadoutOne.stringValue = ""
        combatReadoutTwo.stringValue = ""
        combatReadoutThree.stringValue = ""
    }

    func initUITests() {

        testSkillValue.stringValue = ""
        testLuckValue.stringValue = ""

        dieOne.image = dice[Int(arc4random_uniform(6))]
        dieTwo.image = dice[Int(arc4random_uniform(6))]
    }

    func initUIPack() {

        packTable.reloadData()
        packTable.needsDisplay = true
    }

    func initUIMagic() {

        creatureCopyField.stringValue = ""
        espField.stringValue = ""
        fireField.stringValue = ""
        illusionField.stringValue = ""
        levitationField.stringValue = ""
        luckField.stringValue = ""
        shieldingField.stringValue = ""
        skillField.stringValue = ""
        staminaField.stringValue = ""
        strengthField.stringValue = ""
        weaknessField.stringValue = ""

        creatureCopyField.formatter = onlyIntFormatter
        espField.formatter = onlyIntFormatter
        fireField.formatter = onlyIntFormatter
        illusionField.formatter = onlyIntFormatter
        levitationField.formatter = onlyIntFormatter
        luckField.formatter = onlyIntFormatter
        shieldingField.formatter = onlyIntFormatter
        skillField.formatter = onlyIntFormatter
        staminaField.formatter = onlyIntFormatter
        strengthField.formatter = onlyIntFormatter
        weaknessField.formatter = onlyIntFormatter

        magicSpellsValue.stringValue = "0"

        spellOnePopup.selectItem(at: 0)
        spellTwoPopup.selectItem(at: 0)
        spellThreePopup.selectItem(at: 0)
        spellFourPopup.selectItem(at: 0)
    }

    func initUINotes() {

        let font = NSFont(name: "Apple Chancery", size: 16)
        let attributes = [NSAttributedStringKey.font : font!]

        notesTextView.typingAttributes = attributes
        notesTextView.string = ""

        notesTextView.delegate = self
    }

    func updateStats() {

        // Called regularly to update the UI with the player's current stats
        // As such, it's also where we check for death or madness
        var colour: NSColor = NSColor.black

        // Set up a centred text for stats displayed using NSAtttributedStrings
        // ie. Luck and Stamina
        let tps = NSMutableParagraphStyle()
        tps.alignment = .center

        if let zplayer = player {
            // Stats Tab
            skillValue.stringValue = "\(zplayer.skill)"
            testSkillValue.stringValue = zplayer.gamekind == kGameHouseHell ? "\(zplayer.initialSkill)" : "\(zplayer.skill)"

            // Ensure Luck readout goes red below a score of 5
            colour = zplayer.luck < 5 ? NSColor.red : NSColor.black
            var astring = NSAttributedString.init(string: "\(zplayer.luck)", attributes: [ NSAttributedStringKey.foregroundColor : colour, NSAttributedStringKey.paragraphStyle : tps ])
            luckValue.attributedStringValue = astring
            testLuckValue.attributedStringValue = astring

            // Ensure Stamina readout goes red below a score of 5
            colour = zplayer.stamina < 5 ? NSColor.red : NSColor.black
            astring = NSAttributedString.init(string: "\(zplayer.stamina)", attributes: [ NSAttributedStringKey.foregroundColor : colour, NSAttributedStringKey.paragraphStyle : tps ])
            staminaValue.attributedStringValue = astring

            // Ensure Fear readout goes red 4 below maxFear
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

            // Pack tab
            packTable.reloadData()
            packTable.needsDisplay = true

            // Magic tab
            // magicSpellsValue.stringValue = "\(zplayer.magic)"

            // This section is run when any stat changes, so centralise death
            // and madness checks here.

            if zplayer.stamina < 1 {
                // Death by weakness
                zplayer.isDead = true
                playerDead()
                return
            }

            if zplayer.gamekind == kGameHouseHell {
                // Are we playing House of Hell? If not we don't need the following check
                if zplayer.fear >= zplayer.maxFear {
                    // Death by insanity
                    zplayer.isDead = true
                    playerMad()
                    return
                }
            }
        }
    }

    // MARK: - Stats Tab Functions

    @IBAction func adjustSkill(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        if let stepper = (sender as? NSStepper) {
            let stepperValue = stepper.integerValue
            var psk = player!.skill + stepperValue

            if psk > player!.initialSkill { psk = player!.initialSkill }
            if psk < 0 { psk = 0 }

            if (psk != player!.skill) {
                needToSave = true
                player!.skill = psk
            }

            stepper.integerValue = 0
            updateStats()
        }
    }

    @IBAction func adjustStamina(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        if let stepper = (sender as? NSStepper) {
            let stepperValue = stepper.integerValue
            var pst = player!.stamina + stepperValue

            if pst > player!.initialStamina { pst = player!.initialStamina }
            if pst < 0 { pst = 0 }

            if (pst != player!.stamina) {
                needToSave = true
                player!.stamina = pst
            }

            stepper.integerValue = 0
            updateStats()
        }
    }

    @IBAction func adjustLuck(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        if let stepper = (sender as? NSStepper) {

            let stepperValue = stepper.integerValue
            var psl = player!.luck + stepperValue

            if psl > player!.initialLuck { psl = player!.initialLuck }
            if psl < 0 { psl = 0 }

            if (psl != player!.luck) {
                needToSave = true
                player!.luck = psl
            }

            stepper.integerValue = 0
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
                    if player!.stamina > player!.initialStamina { player!.stamina = player!.initialStamina }

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
            var psf = player!.fear + stepperValue

            if psf > player!.maxFear { psf = player!.maxFear }
            if psf < 0 { psf = 0 }

            if (psf != player!.fear) {
                needToSave = true
                player!.fear = psf
            }

            stepper.integerValue = 0
            updateStats()
        }
    }

    // MARK: - Combat Tab Functions

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

        // Can't strike if we're not playing a game
        if !gameInProgress || player == nil { return }

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
        let playerRollOne = Int(arc4random_uniform(6))
        let playerRollTwo = Int(arc4random_uniform(6))
        var playerAttackStrength : Int = player!.skill + playerRollOne + playerRollTwo + 2

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
            monsterAttackStrength = monsterOneSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2
            monsterStrength = monsterOneStamField.integerValue
        case 2:
            monsterAttackStrength = monsterTwoSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2
            monsterStrength = monsterTwoStamField.integerValue
        case 3:
            monsterAttackStrength = monsterThreeSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2
            monsterStrength = monsterThreeStamField.integerValue
        default:
            combatReadoutTwo.stringValue = "You didn't select a target..."
        }

        monsterAttackStrength = monsterAttackStrength + 6 - monsterMod.indexOfSelectedItem

        // Are we playing Creature of Havoc? A double throw means instant opponent death
        if player!.gamekind == kGameCreatureHavoc && playerRollOne == playerRollTwo {
            playerAttackStrength = monsterAttackStrength + 1
            monsterStrength = 0
        }

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
                combatReadoutOne.stringValue = (player!.gamekind == kGameCreatureHavoc ? "Your claws strikes home..." : "Your weapon strikes home...")
                monsterStrength = monsterStrength - 2
                combatLuckOutcome = 1
            } else if monsterAttackStrength > playerAttackStrength {
                player!.stamina = player!.stamina - (player!.gamekind == kGameCreatureHavoc ? 1 : 2)
                combatReadoutOne.stringValue = "The creature strikes you..."
                combatLuckOutcome = 2
                needToSave = true
            } else {
                roll = Int(arc4random_uniform(6)) + 1
                combatReadoutOne.stringValue = (roll % 2 == 0) ? "You parry the blow..." : "The creature dodges your attack..."
            }

            // Now check for other monsters' attacks, if anys
            // If character's already dead, it only wastes CPU cycles, result's the same
            var hits: Int = -1

            if monsterOneCombatCheck.state == NSControl.StateValue.on && target != 1 {
                // Monster One's in the game but not the target
                monsterAttackStrength = monsterOneSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2

                // Only care if it hits the character
                if monsterAttackStrength > playerAttackStrength {
                    player!.stamina = player!.stamina - 2
                    hits = hits + 1
                }

                if hits == -1 { hits = 0 }
            }

            if monsterTwoCombatCheck.state == NSControl.StateValue.on && target != 2 {
                // Monster Two's in the game but not the target
                monsterAttackStrength = monsterTwoSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2

                // Only care if it hits the character
                if monsterAttackStrength > playerAttackStrength {
                    player!.stamina = player!.stamina - 2
                    hits = hits + 1
                }

                if hits == -1 { hits = 0 }
            }

            if monsterThreeCombatCheck.state == NSControl.StateValue.on && target != 3 {
                // Monster Three's in the game but not the target
                monsterAttackStrength = monsterThreeSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2

                // Only care if it hits the character
                if monsterAttackStrength > playerAttackStrength {
                    player!.stamina = player!.stamina - 2
                    hits = hits + 1
                }

                if hits == -1 { hits = 0 }
            }

            // Record any extra hits
            // NOTE 'hits' will be -1 if there are no other possible attacks
            if hits == 0 {
                combatReadoutTwo.stringValue = "No other monster hits you"
            } else if hits == 1 {
                combatReadoutTwo.stringValue = "One monster gets an extra hit on you"
            } else if hits > 1 {
                combatReadoutTwo.stringValue = "The other monsters hit you \(hits) times"
            }

            // All attacks are done now, so we just need to check if the attacked monster's dead or not.
            // If it is, move target radio button seletion and zero its skill reading
            if monsterStrength < 1 {
                monsterStrength = 0

                switch (target) {
                case 1:
                    monsterOneStamField.stringValue = "\(monsterStrength)"
                    combatReadoutOne.stringValue = combatReadoutOne.stringValue + " killing the beast"

                    // Move target radio button selection along
                    monsterOneTargetCheck.state = NSControl.StateValue.off
                    monsterOneCombatCheck.state = NSControl.StateValue.off
                    monsterTwoTargetCheck.state = NSControl.StateValue.on
                case 2:
                    monsterTwoStamField.stringValue = "\(monsterStrength)"
                    combatReadoutOne.stringValue = combatReadoutOne.stringValue + " killing the beast"
                    monsterTwoTargetCheck.state = NSControl.StateValue.off
                    monsterTwoCombatCheck.state = NSControl.StateValue.off
                    monsterThreeTargetCheck.state = NSControl.StateValue.on
                default:
                    monsterThreeStamField.stringValue = "\(monsterStrength)"
                    combatReadoutOne.stringValue = combatReadoutOne.stringValue + " killing the beast"
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

            // Clear the Luck check flag if the player tested their luck
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

    @IBAction func combatLuckRoll(_ sender: Any) {

        if combatLuckCheck || player == nil {
            // Player has already Tested Luck this combat round, or the creature(s) is dead
            return
        }

        var success: Bool = false
        var a: Int = 0
        var roll = Int(arc4random_uniform(6)) + 1
        roll = roll + 3 - testLuckMod.indexOfSelectedItem

        // For the Luck roll, we do this separately to avoid having multiple versions of the same test code
        success = roll <= player!.luck ? true : false
        player!.luck = player!.luck - 1
        needToSave = true

        if combatLuckOutcome == 1 {
            // The player previously hit the monster... try to increase damage
            if success {
                switch (combatLuckMonster) {
                    case 1:
                    a = monsterOneStamField.integerValue - 2

                    if a <= 0 {
                        a = 0
                        combatReadoutTwo.stringValue = "A lucky strike... you kill the beast"
                    } else {
                        combatReadoutTwo.stringValue = "A lucky strike... you hit it harder than you thought"
                    }

                    monsterOneStamField.stringValue = "\(a)"

                    case 2:
                    a = monsterTwoStamField.integerValue - 2

                    if a <= 0 {
                        a = 0
                        combatReadoutTwo.stringValue = "A lucky strike... you kill the beast"
                    } else {
                        combatReadoutTwo.stringValue = "A lucky strike... you hit it harder than you thought"
                    }

                    monsterTwoStamField.stringValue = "\(a)"

                    default:
                    a = monsterThreeStamField.integerValue - 2

                    if a <= 0 {
                        a = 0
                        combatReadoutTwo.stringValue = "A lucky strike... you kill the beast"
                    } else {
                        combatReadoutTwo.stringValue = "A lucky strike... you hit it harder than you thought"
                    }

                    monsterThreeStamField.stringValue = "\(a)"
                }
            } else {
                combatReadoutTwo.stringValue = "Unlucky... you didn't hurt it as much as you thought"
                switch (combatLuckMonster) {
                    case 1:
                    monsterOneStamField.stringValue = "\(monsterOneStamField.integerValue + 1)"
                    case 2:
                    monsterTwoStamField.stringValue = "\(monsterTwoStamField.integerValue + 1)"
                    default:
                    monsterThreeStamField.stringValue = "\(monsterThreeStamField.integerValue + 1)"
                }
            }
        }

        if combatLuckOutcome == 2 {
            // The monster hit the character... try to reduce strength of blow
            if success {
                player!.stamina = player!.stamina + 1
                combatReadoutTwo.stringValue = "Good luck... that was only a glancing blow"
            } else {
                player!.stamina = player!.stamina - 1
                combatReadoutTwo.stringValue = "Unlucky... its attack did extra damage"
            }
        }

        updateStats()

        combatReadoutThree.stringValue = "Your Stamina is \(player!.stamina). Your Luck is \(player!.luck)"
    }

    // MARK: - Test Tab Functions

    @IBAction func testLuck(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        var roll: Int = Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2
        roll = roll + 3 - testLuckMod.indexOfSelectedItem
        player!.luck = player!.luck - 1
        needToSave = true
        showAlert((roll <= player!.luck ? "Destiny smiles upon you..." : "You are ill-favoured..."), "", true)
    }

    @IBAction func testSkill(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        var roll: Int = Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2
        roll = roll + 3 - testSkillMod.indexOfSelectedItem
        needToSave = true

        var sk = player!.skill

        if player!.gamekind == kGameHouseHell {
            sk = player!.skill + 3
            if sk > player!.initialSkill { sk = player!.initialSkill }
        }

        showAlert((roll <= sk ? "You were skilfull..." : "You fumble the test..."), "", true)
    }

    @IBAction func rollDice(_ sender: Any) {

        if let asender = (sender as? AppDelegate) {
            if asender == self {
                // We are here through a timer call
                if rollCount > 0 {
                    var roll: Int = Int(arc4random_uniform(6))
                    dieOne.image = dice[roll]

                    roll = Int(arc4random_uniform(6))
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

    // MARK: - Pack Tab Functions

    @objc @IBAction func showIcons(_ sender: Any) {

        // Assemble the image matrix
        makeIconMatrix()

        // Show the icon matrix
        if let asender = (sender as? FFIconButton) {
            iconPopover!.show(relativeTo: asender.bounds, of: asender, preferredEdge: NSRectEdge.maxY)

            // Make sure the matrix controller knows which button was clicked on
            iconPopoverController.button = asender
        }
    }

    func makeIconMatrix() {

        // Assemble the popover if it hasn't been assembled yet
        if iconPopover == nil {
            iconPopover = NSPopover.init()
            iconPopover!.contentViewController = iconPopoverController
            iconPopover!.delegate = self
            iconPopover!.behavior = NSPopover.Behavior.transient
            iconPopoverController.icons = icons
        }
    }

    @IBAction func addPackItem(_ sender: Any) {

		// The player has entered an item in the add pack field and click the Add button
		if let zplayer = player {
            let itemName = "New pack item"
			let item: [String:Any] = [ "name" : itemName,
								       "icon" : NSNumber.init(value: icons.count - 1) ]

            zplayer.pack.append(item)

            packTable.reloadData()
            packTable.needsDisplay = true
            packTable.scrollRowToVisible(zplayer.pack.count - 1)

            needToSave = true
            updateStats()
        }
    }

    @IBAction func usePackItem(_ sender: Any) {

		// The player has selected a pack item and clicked the 'Use' button to use and remove it

		// Nothing selected? Bail
		if packTable.selectedRow == -1 { return }

		// Otherwise...
		if let zplayer = player {
			// Remove the item from the pack, and the item's icon index
			zplayer.pack.remove(at: zplayer.packSelectedItem)

			packTable.reloadData()
			packTable.needsDisplay = true

			needToSave = true
			updateStats()
        }
    }

    @objc func updatePack(_ note: Notification) {

        // This function is called via a notification from the popup controller
        // Its job is to set a pack item's index value to that of the selected icon
        let obj = note.object

        if obj != nil {
            // Decode the supplied object as an array
            let array = obj as! NSMutableArray
            let sender = array.object(at: 1) as! FFIconButton
            let index = (array.object(at: 2) as! NSNumber).intValue

            // Get the clicked button's superview, which is the FFTableCellView
            let view: FFTableCellView = sender.superview as! FFTableCellView

            // Run through the pack table's rows, getting the view of each row
            for i in 0..<packTable.numberOfRows {
                if let rowView = packTable.rowView(atRow: i, makeIfNecessary: false) {
                    // From the row view, extract the column 0 view - this will be
                    // an FFTableCellView, which we can compare with the one retrieved above
                    let colView = rowView.view(atColumn: 0) as! FFTableCellView
                    if view == colView {
                        // The view's match, so update the relevant pack item in the player instance
                        if let zplayer = player {
                            zplayer.pack[i]["icon"] = index
                        }
                    }
                }
            }
        }
    }

    // MARK: Pack Table Data Source Delegate Functions

    func numberOfRows(in tableView: NSTableView) -> Int {

        // If there is a valid player object, return its pack count, otherwise zero
        return (player != nil ? player!.pack.count : 0)
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        if let zplayer = player {
            if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "packcell"), owner: nil) as? FFTableCellView {
                let dict = zplayer.pack[row]
                cell.textField?.stringValue = dict["name"] as! String
                cell.textField?.delegate = self

                let n = dict["icon"] as! NSNumber
                cell.button?.index = n.intValue
                if let image = icons.object(at: n.intValue) as? NSImage { cell.button?.image = image }
                cell.button?.icons = icons
                cell.button?.action = #selector(self.showIcons)
                return cell
            }
        }

        return nil
    }

    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {

        if let zplayer = player { zplayer.packSelectedItem = row }
        return true
    }

    func tableView(_ tableView: NSTableView, shouldEdit tableColumn: NSTableColumn?, row: Int) -> Bool {

        if let zplayer = player {
            if row < zplayer.pack.count { return true }
        }

        return false
    }

    @objc func tableViewDoubleClick(_ sender:AnyObject) {

        // Make sure user has double-clicked on a non-empty row
        if packTable.selectedRow >= 0 {
            usePackItem(self)
            if let cell = packTable.view(atColumn: 0, row: packTable.selectedRow, makeIfNecessary: false) {
                let item = cell as! NSTableCellView
                item.textField?.isEditable = true
                item.textField?.delegate = self
            }
        }
    }

    override func controlTextDidEndEditing(_ obj: Notification) {

        // This NSControl delegate method is used to trap when ending ends in a table row's NSTextField
        if let zobj = obj.userInfo {
            let textField: NSTextView = zobj["NSFieldEditor"] as! NSTextView
            let row = packTable.selectedRow
            if row != -1 {
                if let zplayer = player {
                    // Swap the old pack item for the new one
                    let oldItem = zplayer.pack[row]
                    let newItem: [String:Any] = [ "name" : textField.string,
                                                  "icon" : oldItem["icon"]! ]

                    zplayer.pack[row] = newItem
                }
            }
        }
    }

    // MARK: - Magic Tab Functions

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
                creatureCopyField.stringValue = "\(creatureCopyField.integerValue - 1)"
            }
        }

        if espCell.state == NSControl.StateValue.on {
            if espField.integerValue > 0 {
                success = true
                espField.stringValue = "\(espField.integerValue - 1)"
            }
        }

        if fireCell.state == NSControl.StateValue.on {
            if fireField.integerValue > 0 {
                success = true
                fireField.stringValue = "\(fireField.integerValue - 1)"
            }
        }

        if illusionCell.state == NSControl.StateValue.on {
            if illusionField.integerValue > 0 {
                success = true
                illusionField.stringValue = "\(illusionField.integerValue - 1)"
            }
        }

        if levitationCell.state == NSControl.StateValue.on {
            if levitationField.integerValue > 0 {
                success = true
                levitationField.stringValue = "\(levitationField.integerValue - 1)"
            }
        }

        if luckCell.state == NSControl.StateValue.on {
            if luckField.integerValue > 0 {
                success = true
                player!.luck = player!.luck + (player!.initialLuck / 2)
                luckField.stringValue = "\(luckField.integerValue - 1)"
            }
        }

        if shieldingCell.state == NSControl.StateValue.on {
            if shieldingField.integerValue > 0 {
                success = true
                shieldingField.stringValue = "\(shieldingField.integerValue - 1)"
            }
        }

        if skillCell.state == NSControl.StateValue.on {
            if skillField.integerValue > 0 {
                success = true
                player!.skill = player!.skill + (player!.initialSkill / 2)
                skillField.stringValue = "\(skillField.integerValue - 1)"
            }
        }

        if staminaCell.state == NSControl.StateValue.on {
            if staminaField.integerValue > 0 {
                success = true
                player!.stamina = player!.stamina + (player!.initialStamina / 2)
                staminaField.stringValue = "\(staminaField.integerValue - 1)"
            }
        }

        if strengthCell.state == NSControl.StateValue.on {
            if strengthField.integerValue > 0 {
                success = true
                strengthField.stringValue = "\(strengthField.integerValue - 1)"
            }
        }

        if weaknessCell.state == NSControl.StateValue.on {
            if weaknessField.integerValue > 0 {
                success = true
                weaknessField.stringValue = "\(weaknessField.integerValue - 1)"
            }
        }

        if success {
            player!.magic = player!.magic - 1
            needToSave = true
            showAlert("You cast the spell...", "The gamebook will tell you the outcome of your success", true)
        } else {
            showAlert("You could not cast the spell...", "The gamebook will tell you the outcome of your failure", true)
        }
    }

    @IBAction func magicTotaliser(_ sender: Any) {

        // This routine is called when the user types in a number into a magic spell Uses field.
        // It adds up all the points entered thus far to make sure they don't exceed the Magic value.
        // NOTE Also called when it has focus and the tab shifts

        if let zplayer = player {

            if zplayer.gamekind != kGameCitadel {
                // Not a Citadel of Chaos game? Then ignore click
                if let asender = (sender as? NSTextField) {
                    if asender.stringValue.count > 0 {
                        asender.stringValue = ""
                    }
                }
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
        if message.count > 0 { alert.informativeText = message }

        alert.beginSheetModal(for: window, completionHandler: { (modalResponse) in
            if update { self.updateStats() }
        })
    }

    // MARK: - Bookmarking Functions

    @IBAction func showBookmark(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        if player!.bookmark == -1 {
            // The player hasn't set a bookmark yet, so open the appropriate sheet
            // NOTE we can only come here from the titlebar button, not the menu
            // as it will not have been enabled yet
            showBookmarker(self)
            return
        }

        bookmark.isHidden = !bookmark.isHidden
        bookmarkButtonButton.bookmarkState = !bookmarkButtonButton.bookmarkState
        showBookmarkMenuItem.isEnabled = true
        showBookmarkMenuItem.title = bookmark.isHidden ? "Show Bookmark" : "Hide Bookmark"
    }

    @IBAction func showBookmarker(_ sender: Any) {

        if !gameInProgress || player == nil { return }

        // Make sure we don't show -1 for the bookmark (-1 means no bookmark set)
        bookmarkCurrentField.stringValue = player!.bookmark == -1 ? "1" : "\(player!.bookmark)"
        bookmarkCurrentField.formatter = onlyIntFormatter

        // Show the sheet
        window.beginSheet(bookmarkWindow, completionHandler:  { (response) in })
    }

    @IBAction func cancelBookmarker(_ sender: Any) {

        // Close the sheet
        window.endSheet(bookmarkWindow)
    }

    @IBAction func setBookmarker(_ sender: Any) {

        if let zplayer = player {
            let stringValue = bookmarkCurrentField.stringValue
            let value: Int = stringValue.isEmpty ? zplayer.bookmark : Int(stringValue)!

            // Only set the bookmark if it has been changed
            // Only show the bookmark graphic if a bookmark has been set
            if zplayer.bookmark != value {
                zplayer.bookmark = value
                needToSave = true
                //window.isDocumentEdited = true
                bookmark.place = value
                bookmark.needsDisplay = true
                bookmark.isHidden = true
                self.bookmarkButtonButton.bookmarkState = false
                showBookmark(self)
            }
        }

        // Close the sheet
        window.endSheet(bookmarkWindow)
    }

    // MARK: - Player Management Functions

    func playerDead() {

        // Perform the death routine
        let image = NSImage.init(named: NSImage.Name("death_banner"))
        if image != nil { showDeathWindow(image!) }
    }

    func playerMad() {

        // Perform the death-by-madness routine
        let image = NSImage.init(named: NSImage.Name("madness_banner"))
        if image != nil { showDeathWindow(image!) }
    }

    func showDeathWindow(_ image: NSImage) {

        // Perform the death routine
        deathImageView.image = image

        // We give the player one chance to reanimate - and they have had it
        // so hide the reanimte button
        reanimateButton.isEnabled = firstRun ? true : false
        reanimateButton.isHidden = firstRun ? false : true

        window.beginSheet(deathWindow, completionHandler:  { (response) in })
    }

    @IBAction func reanimate(_ sender: Any) {

        // Player chooses to try again on reduced stats
        window.endSheet(deathWindow)

        if let zplayer = player {
            zplayer.isDead = false
            gameInProgress = true
            needToSave = true
            firstRun = false

            zplayer.skill = player!.initialSkill > 11 ? player!.initialSkill - 6 : 6
            zplayer.stamina = 6

            updateStats()
        }
    }

    @IBAction func quitter(_ sender: Any) {

        // Player calls it quits
        window.endSheet(deathWindow)

        gameInProgress = false
        needToSave = false
        firstRun = false
        player = nil

        // Reset the UI
        initUI()
    }

    // MARK: - Player Save/Load Functions

    @IBAction func savePlayer(_ sender: Any) {

        // Don't continue if the player is dead or nothing has changed
        // since the last save
        if player == nil || !needToSave { return }
        if player!.isDead { return }

        if savePath.count == 0 {
            // We have no save path for some reason, so force a Save As...
            savePlayerAs(self)
            return
        }

        // Save the player
        let result: Bool = save(savePath)
        needToSave = !result
    }

    @IBAction func savePlayerAs(_ sender: Any) {

        // Only proceed if the player isn't dead
        if player == nil { return }

        if !player!.isDead {
            if savePanel == nil { savePanel = NSSavePanel.init() }
            if let panel = savePanel {
                panel.nameFieldLabel = "Character name"
                panel.isExtensionHidden = true
                panel.allowedFileTypes = ["ffc"]
                panel.beginSheetModal(for: window, completionHandler: { (response) in

                    var name: String = ""
                    var result: Bool

                    if response == NSApplication.ModalResponse.OK {
                        if let url = panel.url {
                            name = url.path
                            name = (name as NSString).lastPathComponent
                            name = (name as NSString).deletingPathExtension
                            self.player!.name = name

                            result = self.save(url.path)
                            if result { self.savePath = url.path }
                            self.needToSave = !result
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

            zplayer.notes = notesTextView.string

            // Save theCharacter object

            result = NSKeyedArchiver.archiveRootObject(zplayer, toFile: path)
        }

        return result
    }

    @IBAction func openCharacter(_ sender: Any) {

        if gameInProgress && needToSave {
            // There's a game in progress, so warn the user...
            let alert = NSAlert.init()
            alert.messageText = needToSave ? "You have a game in progress with unsaved changes" : "You have a game in progress"
            alert.informativeText = needToSave ? "If you reload a character now, unsaved changes will be lost" : "Are you sure?"
            alert.addButton(withTitle: "No")
            alert.addButton(withTitle: "Yes")

            alert.beginSheetModal(for: window) { (response) in
                if response == NSApplication.ModalResponse.alertSecondButtonReturn {
                    // Player clicked 'Continue', so display the New Player UI
                    self.needToSave = false
                    self.openCharacter(self)
                }
            }

            return
        }

        let openPanel: NSOpenPanel = NSOpenPanel.init()
        openPanel.allowedFileTypes = ["ffc"]
        openPanel.allowsMultipleSelection = false
        openPanel.beginSheetModal(for: window, completionHandler: { (response) in
            if response == NSApplication.ModalResponse.OK {
                let path:String = openPanel.urls[0].path
                _ = self.openFileHander(path)
            }
        })

        tabs.selectTabViewItem(at: 0)
    }

    func openFileHander(_ path: String) -> Bool {

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
                if !self.tabs.tabViewItems.contains(self.magicTabItem) {
                    self.tabs.insertTabViewItem(self.heldTabs["magicTabItem"]!, at: 4)
                    self.castSpellButton.isEnabled = true
                }
            } else {
                // Remove the Magic tab
                self.castSpellButton.isEnabled = false
                self.heldTabs["magicTabItem"] = self.magicTabItem!
                if self.tabs.tabViewItems.contains(self.magicTabItem) { self.tabs.removeTabViewItem(self.magicTabItem) }
            }

            // Handle game-specific stats boxes
            self.hellBox.isHidden = zplayer.gamekind == kGameHouseHell ? false : true
            self.citadelBox.isHidden = zplayer.gamekind == kGameCitadel ? false : true

            // Update the modifiers
            self.testLuckMod.selectItem(at: zplayer.modMatrix[0])
            self.testSkillMod.selectItem(at: zplayer.modMatrix[1])
            self.playerMod.selectItem(at: zplayer.modMatrix[2])
            self.monsterMod.selectItem(at: zplayer.modMatrix[3])

            self.savePath = path
            self.gameInProgress = true

            // Set up the Game menu
            setGameMenu(zplayer.gamekind)

            // Set up the bookmark
            if zplayer.bookmark != -1 {
                self.bookmark.place = zplayer.bookmark
                self.bookmark.needsDisplay = true
                self.bookmark.isHidden = true
                self.bookmarkButtonButton.bookmarkState = false
                self.showBookmark(self)
            }

            // Drop in the notes the player made last game
            self.notesTextView.string = zplayer.notes

            // Set the Stats View image
            self.setStatsViewImage(zplayer.gamekind)

            // Update the window title
            self.window.title = zplayer.gameName

            // Show the player's stats
            self.updateStats()

            // Show the extra information as a reminder
            self.showExtraInfo(zplayer.gamekind)

            return true
        } else {
            return false
        }
    }

    @IBAction func closeCharacter(_ sender: Any) {

        if gameInProgress && needToSave {
            // There's a game going on, so warn the player
            let alert = NSAlert.init()
            alert.messageText = needToSave ? "You have a game in progress with unsaved changes" : "You have a game in progress"
            alert.informativeText = needToSave ? "If you close the character now, unsaved changes will be lost" : "Are you sure?"
            alert.addButton(withTitle: "No")
            alert.addButton(withTitle: "Yes")
            alert.beginSheetModal(for: window, completionHandler: { (response) in
                if response == NSApplication.ModalResponse.alertSecondButtonReturn { self.doClose() }
            })

            return
        }

        // Otherwise, just close
        doClose()
    }

    func doClose() {

        // Clear the player and refresh the UI
        player = nil
        gameInProgress = false
        needToSave = false
        initUI()
    }

    // MARK: - Player Creation Functions

    @IBAction func newPlayer(_ sender: Any) {

        // Called when the player selects 'New Character' from the File menu

        if gameInProgress && needToSave {
            // There's a game in progress, so warn the user...
            let alert = NSAlert.init()
            alert.messageText = needToSave ? "You have a game in progress with unsaved changes" : "You have a game in progress"
            alert.informativeText = needToSave ? "If you create a new character now, unsaved changes will be lost" : "Are you sure?"
            alert.addButton(withTitle: "No")
            alert.addButton(withTitle: "Yes")

            alert.beginSheetModal(for: window) { (response) in
                if response == NSApplication.ModalResponse.alertSecondButtonReturn {
                    // Player clicked 'Continue', so display the New Player UI
                    self.showPlayerCreate()
                }
            }

            return
        }

        // ...otherwise just present the New Player sheet
        showPlayerCreate()
    }

	func showPlayerCreate() {

		// Initialise the New Player UI
        startSkillField.stringValue = "0"
        startStaminaField.stringValue = "0"
        startLuckField.stringValue = "0"
		startGamePopup.selectItem(at: 0)
		setItemsForGame(self)

        rollStats(self)

        // Present the New Player sheet
        // NOTE There's no completion handler used here, as we send the buttons' actions
        // to functions within this App Delegate (see below)
        window.beginSheet(createSheet, completionHandler: nil)

        tabs.selectTabViewItem(at: 0)
	}

    @IBAction func rollStats(_ sender: Any) {

        // Roll basic stats when the player clicks 'Roll'
        var roll: Int = Int(arc4random_uniform(6)) + 7
        startSkillField.stringValue = "\(roll)"

        roll = Int(arc4random_uniform(6) + arc4random_uniform(6)) + 14
        startStaminaField.stringValue = "\(roll)"

        roll = Int(arc4random_uniform(6)) + 7
        startLuckField.stringValue = "\(roll)"
    }

    @IBAction func setItemsForGame(_ sender: Any) {

        // Pre-fill certain fields in the New Character panel according
        // to the type of game selected to save the player adding it in
        var type = startGamePopup.indexOfSelectedItem;
        if type > 13 { type = type + 5 }

        if type == kGameCitadel
            || type == kGameHouseHell
            || type == kGameReturnFiretop
            || type == kGameTrialChampions
            || type == kGameCreatureHavoc {
            startPotionPopup.isEnabled = false
            startFoodField.stringValue = "0"
            startGoldField.stringValue = "0"
        } else if type == kGameTempleTerror
            || type == kGameEyeDragon {
            startPotionPopup.isEnabled = false
            startFoodField.stringValue = "10"
            startGoldField.stringValue = "0"
        } else if type == kGameSorceryWizard
            || type == kGameSorceryFighter {
            startPotionPopup.isEnabled = false
            startFoodField.stringValue = "2"
            startGoldField.stringValue = "20"
        } else {
            startPotionPopup.isEnabled = true
            startFoodField.stringValue = "10"
            startGoldField.stringValue = "0"
        }
    }

    @IBAction func cancelSheet(_ sender: Any) {

        // Just hide the New Player UI without doing anything else
        window.endSheet(createSheet)
    }

    @IBAction func setPlayer(_ sender: Any) {

        // Initialise the game itself
        needToSave = true
        firstRun = true
        gameInProgress = true

        // Create a new player instance and set its properties according to the
        // values entered into the UI
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

        var gameType: Int = startGamePopup.indexOfSelectedItem
        if gameType > kGamePortPeril { gameType = gameType + 6 }
        player!.gamekind = gameType

        // The following are 'standard' games with no special load-out
        if gameType == kGameWarlock { player!.gameName = "The Warlock of Firetop Mountain" }
        if gameType == kGameDeathtrap { player!.gameName = "Deathtrap Dungeon" }
        if gameType == kGameCityThieves { player!.gameName = "City of Thieves" }

        // Manage the Magic tab — it's only present for certain games
        if gameType != kGameCitadel && gameType != kGameTempleTerror {
            // Remove the Magic tab for all but Citadel of Chaos and Temple of Terror
            heldTabs["magicTabItem"] = magicTabItem!
            if tabs.tabViewItems.contains(magicTabItem) { tabs.removeTabViewItem(magicTabItem) }
        } else {
            // Add back the Magic tab on the end if necessary
            if !tabs.tabViewItems.contains(magicTabItem) { tabs.insertTabViewItem(heldTabs["magicTabItem"]!, at: 4) }
        }

        // Hide the game menu
        self.gameMenu.isHidden = true
        self.gameMenu.isEnabled = false

        // Hide the game-specific Stats tab boxes
        citadelBox.isHidden = true
        hellBox.isHidden = true

        if gameType == kGameCitadel {
            player!.magic = Int(arc4random_uniform(6) + arc4random_uniform(6)) + 8
            player!.initialMagic = player!.magic
            player!.potion = kPotionNone
            player!.drinks = 0
            player!.gold = 0
            player!.gameName = "Citadel of Chaos"
            citadelBox.isHidden = false

            magicSpellsValue.stringValue = "\(player!.magic)"
        }

        if gameType == kGameHouseHell {
            player!.skill = player!.skill - 3
            player!.initialSkill = player!.skill + 3
            player!.maxFear = Int(arc4random_uniform(6)) + 7
            player!.fear = 0
            player!.potion = kPotionNone
            player!.drinks = 0
            player!.gold = 0
            player!.provisions = 0
            player!.gameName = "House of Hell"
            hellBox.isHidden = false
        }

        if gameType == kGameForestDoom {
            player!.gold = 30
            player!.gameName = "Forest of Doom"
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
            player!.provisions = 10
            player!.gold = 0
            player!.gameName = "Eye of the Dragon"
        }

        if gameType == kGameTrialChampions {
            player!.potion = kPotionNone
            player!.drinks = 0
            player!.provisions = 0
            player!.gold = 0
            player!.gameName = "Trial of Champions"
        }

        if gameType == kGameCreatureHavoc {
            player!.potion = kPotionNone
            player!.drinks = 0
            player!.provisions = 0
            player!.gold = 0
            player!.gameName = "Creature of Havoc"
        }

        if gameType == kGamePortPeril {
            player!.provisions = 10
            player!.gold = 0
            player!.drinks = 1
            player!.gameName = "Port of Peril"
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
        if gameType != kGameHouseHell && gameType != kGameCreatureHavoc {
			// Add items to the pack as dictionaries with the keys 'name' and 'icon'
			// 'name' is the item as a string, 'icon' is the index of its icon in
			// the 'icons' array of images. The index is stored here as an NSNumber
			var dict: [String:Any] = [ "name" : "Sword", "icon" : NSNumber.init(value: 1) ]
			player!.pack.append(dict)
            dict = [ "name" : "Leather armour", "icon" : NSNumber.init(value: 2) ]
			player!.pack.append(dict)

            if gameType != kGameCavernsSnow {
                dict = [ "name" : "Lantern", "icon" : NSNumber.init(value: 0) ]
                player!.pack.append(dict)
            }
        }

        // Set the Stats View image
        setStatsViewImage(gameType)

        // Set the Game menu
        setGameMenu(gameType)

        // Update the UI with the new stats
        updateStats()

        // Update the window with the game name
        window.title = player!.gameName

        // Set the bookmark state
        bookmark.isHidden = true
        bookmarkButtonButton.bookmarkState = false

        // Close the sheet
        window.endSheet(createSheet)

        // Pop up game-specific info
        showExtraInfo(gameType)
    }

    func showExtraInfo(_ gameType: Int) {

        // Present alerts containing useful info for specific game types,
        // immediately before play actually begins
        if gameType == kGamePortPeril {
            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Use the Game menu to gain Yaztromo’s aid when instructed in the game book."
            alert.beginSheetModal(for: window, completionHandler: nil)
        }

        if gameType == kGameCavernsSnow || gameType == kGameTempleTerror {
            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Use the Game menu for certain monsters’ extra attacks when instructed in the game book."
            alert.beginSheetModal(for: window, completionHandler: nil)
        }

        if gameType == kGameTempleTerror || gameType == kGameCitadel {
            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Don’t forget to selet your magic spells in the Magic tab."
            alert.beginSheetModal(for: window, completionHandler: nil)
        }

        if gameType == kGameHouseHell {
            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Don’t forget you start the game with reduced Skill — take care!"
            alert.beginSheetModal(for: window, completionHandler: nil)
        }

        if gameType == kGameSorceryWizard || gameType == kGameSorceryFighter {
            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Use the Game menu to ask Libra to revitalise you once during each book in the Sorcery! series."
            alert.beginSheetModal(for: window, completionHandler: nil)
        }
    }

    func setStatsViewImage(_ gameType:Int) {

        let image: NSImageView

        // Remove any previously placed images from the Stats tab
        if statsTabImage != nil {
            statsTabImage!.removeFromSuperview()
            statsTabImage = nil
        }

        // Add game-specific image
        if gameType == kGameCitadel {
            // Place an image in the gap to the right of the stats panel
            image = NSImageView.init(frame: NSMakeRect(166, 78, 258, 102))
            image.image = NSImage.init(named: NSImage.Name("coc"))
        } else if gameType == kGameHouseHell {
            // Place an image in the gap to the left of the stats panel
            image = NSImageView.init(frame: NSMakeRect(12, hellBox.frame.origin.y, 146, 102))
            image.image = NSImage.init(named: NSImage.Name("hoh"))
        } else {
            image = NSImageView.init(frame: NSMakeRect(10, 56, 416, 85))
            image.image = NSImage.init(named: NSImage.Name("scroll"))
        }

        statsTabView.addSubview(image)
        statsTabImage = image
    }

    // MARK: - Start Sheet Functions

    @IBAction func startGame(_ sender: Any) {

        window.endSheet(startSheet)

        let asender = sender as! NSButton

        if asender == startNewButton {
            newPlayer(self)
        }

        if asender == startLoadButton {
            openCharacter(self)
        }
    }

    func showStartSheet() {

        startSheet.backgroundColor = NSColor.init(deviceWhite: 0.0, alpha: 0.9)
        startSheet.alphaValue = 1.0
        startSheet.isOpaque = true
        startSheet.hasShadow = false

        window.beginSheet(startSheet, completionHandler: nil)
    }

    @IBAction func cancelStartSheet(_ sender: Any) {

        window.endSheet(startSheet)
    }

    // MARK: - About Sheet Functions

    @IBAction func showAbout(_ sender: Any) {

        // Write in the version number into the About panel
        aboutVersonLabel.stringValue = "v" + (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String)

        // Attach the sheet to the main window - or, if the main window already
        // has a sheet, attach it to that sheet
        if window.sheets.count > 0 {
            let sheet = window.sheets[0]
            sheet.beginSheet(aboutSheet, completionHandler: nil)
        } else {
            window.beginSheet(aboutSheet, completionHandler:nil)
        }
    }

    @IBAction func closeAbout(_ sender: Any) {

        // Check whether the About sheet is attached to the window
        // or another sheet, eg. New Character
        if window.sheets.count > 0 {
            let sheet = window.sheets[0]
            if sheet != aboutSheet {
                sheet.endSheet(aboutSheet)
                return
            }
        }

        window.endSheet(aboutSheet)
    }


    // MARK: - Help Sheet Functions

    @IBAction func showHelp(_ sender: Any) {

        // Read in the helptext.txt file and drop it into the Help panel's NSTextView
        if let helpTextPath = Bundle.main.path(forResource: "helptext", ofType: "txt") {
            do {
                let helpText = try String.init(contentsOfFile: helpTextPath, encoding: String.Encoding.utf8)
                helpTextView.isEditable = true
                helpTextView.insertText(helpText, replacementRange: NSMakeRange(0, helpTextView.string.count))
                helpTextView.scrollToBeginningOfDocument(self)
                helpTextView.isEditable = false

                // Attach the sheet to the main window - or, if the main window already
                // has a sheet, attach it to that sheet
                if window.sheets.count > 0 {
                    let sheet = window.sheets[0]
                    sheet.beginSheet(helpWindow, completionHandler: nil)
                } else {
                    window.beginSheet(helpWindow, completionHandler: nil)
                }
            } catch  {
                // NOP
            }
        }
    }

    @IBAction func closeHelp(_ sender: Any) {

        // Check whether the Help sheet is attached to the window
        // or another sheet, eg. New Characterif window.sheets.count > 0 {
        if window.sheets.count > 0 {
            let sheet = window.sheets[0]
            if sheet != helpWindow {
                sheet.endSheet(helpWindow)
                return
            }
        }

        window.endSheet(helpWindow)
    }

    @IBAction func openSite(_ sender: Any) {

        // Open up the Fighting Fantasy website when the logo in the About panel is clicked
        if let url = URL.init(string: "https://www.fightingfantasy.com/") {
            NSWorkspace.shared.open(url)
        }
    }

    // MARK: - TabView Delegate Functions

    func tabView(_ tabView: NSTabView, didSelect tabViewItem: NSTabViewItem?) {

        if let tvi: NSTabViewItem = tabViewItem {
            // Did the player select the combat tab?
            if tvi == combatTabItem {
                // The player is selecting the combat tab - if there's a game in progress,
                // update the player's stats
                if gameInProgress && player != nil {
                    if player!.isDead { return }

                    // Update the readouts before viewing the tab
                    combatReadoutOne.stringValue = ""
                    combatReadoutTwo.stringValue = ""
                    combatReadoutThree.stringValue = "Your Stamina is \(player!.stamina). Your Luck is \(player!.luck)"
                }
            }
        }
    }

    // MARK: - NSTextDelegate Functions

    func textDidChange(_ notification: Notification) {

        if gameInProgress { needToSave = true }
    }

    // MARK: - Game-specific Functions

    func setGameMenu(_ gameType: Int) {

        if (gameType == kGamePortPeril) { setPortPerilGameMenu() }
        if (gameType == kGameCavernsSnow) { setCavernsGameMenu() }
        if (gameType == kGameTempleTerror) { setTempleGameMenu() }
    }

    // MARK: Port of Peril

    @objc @IBAction func yazMagic(_ sender: Any) {

        // Only show the Yaztromo aid window if the player is playing Port of Peril
        if let zplayer = player {
            if zplayer.gamekind == kGamePortPeril {
                window.beginSheet(yazWindow, completionHandler:nil)
            }
        }
    }

    @IBAction func cancelYazWindow(_ sender: Any) {

        window.endSheet(yazWindow)
    }

    @IBAction func applyYazMagic(_ sender: Any) {

        // Enact the improvements made by Yaztromo's magic
        let row = yazMatrix.selectedRow

        if let zplayer = player {
            if row == 0 {
                zplayer.skill = 12
                zplayer.initialSkill = 12
            } else if row == 1 {
                zplayer.stamina = zplayer.stamina + 10
                zplayer.initialStamina = zplayer.stamina
            } else {
                zplayer.luck = 12
                zplayer.initialLuck = 12
            }
        }

        needToSave = true
        updateStats()
        window.endSheet(yazWindow)
    }

    func setPortPerilGameMenu() {

        // Set up the Game Menu for Port of Peril
        if let gmm = gameMenu.submenu {
            if (gmm.items.count > 0) { gmm.removeAllItems() }
            gmm.addItem(withTitle: "Take Yaztromo's Aid...", action: #selector(yazMagic), keyEquivalent: "y")
            let ym: NSMenuItem? = gmm.item(at: 0)
            if ym != nil { ym!.isEnabled = true }
        }

        gameMenu.isEnabled = true
        gameMenu.isHidden = false
        gameMenu.title = "Port of Peril"
    }

    // MARK: Caverns of the Snow Witch

    func setCavernsGameMenu() {

        // Set up the Game Menu for Caverns of the Snow Witch

        // Set up the Game Menu
        if let gmm = gameMenu.submenu {
            if (gmm.items.count > 0) { gmm.removeAllItems() }
            gmm.addItem(withTitle: "White Dragon Extra Attack", action: #selector(dragonExtraAttack), keyEquivalent: "")
            gmm.addItem(withTitle: "Ice Demon Extra Attack", action: #selector(demonExtraAttack), keyEquivalent: "")
            let ym: NSMenuItem? = gmm.item(at: 0)
            if ym != nil { ym!.isEnabled = true }
        }

        gameMenu.isEnabled = true
        gameMenu.isHidden = false
        gameMenu.title = "Caverns of the Snow Witch"
    }

    @objc func dragonExtraAttack() {

        // White dragon does +2 damage on roll of 1-2
        if !gameInProgress { return }

        let roll: Int = Int(arc4random_uniform(6)) + 1

        if roll < 3 {
            if player != nil {
                player!.stamina = player!.stamina - 2
                if player!.stamina < 0 { player!.stamina = 0 }
                showExtraAttackResult("White Dragon", 2)
            }
        } else {
            showExtraAttackResult("White Dragon", 0)
        }
    }

    @objc func demonExtraAttack() {

        // Ice Demon does +1 damage on roll of 1-3
        if !gameInProgress { return }

        let roll: Int = Int(arc4random_uniform(6)) + 1

        if roll < 4 {
            if player != nil {
                player!.stamina = player!.stamina - 1
                if player!.stamina < 0 { player!.stamina = 0 }
                showExtraAttackResult("White Dragon", 1)
            }
        } else {
            showExtraAttackResult("White Dragon", 0)
        }
    }

    func showExtraAttackResult(_ beast: String, _ damage: Int) {

        let alert: NSAlert = NSAlert.init()
        alert.messageText = "The \(beast) attempts an extra strike... " + (damage > 0 ? "Doing \(damage) damage!" : "But misses you!")

        alert.beginSheetModal(for: window, completionHandler: { (modalResponse) in

            self.combatReadoutThree.stringValue = "Your Stamina is \(self.player!.stamina). Your Luck is \(self.player!.luck)"
            self.updateStats()
        })
    }

    // MARK: Temple of Terror

    func setTempleGameMenu() {

        // Set up the Game Menu for Temple of Terror

        if let gmm = gameMenu.submenu {
            if (gmm.items.count > 0) { gmm.removeAllItems() }
            gmm.addItem(withTitle: "Firefly Extra Attack", action: #selector(fireflyExtraAttack), keyEquivalent: "")
            let ym: NSMenuItem? = gmm.item(at: 0)
            if ym != nil { ym!.isEnabled = true }
        }

        gameMenu.isEnabled = true
        gameMenu.isHidden = false
        gameMenu.title = "Temple of Terror"
    }

    @objc func fireflyExtraAttack() {

        // Fireflies do +2 damage on roll of 1-3
        if !gameInProgress { return }

        let roll: Int = Int(arc4random_uniform(6)) + 1

        if roll < 4 {
            if player != nil {
                player!.stamina = player!.stamina - 2
                if player!.stamina < 0 { player!.stamina = 0 }
                showExtraAttackResult("Firefly", 2)
            }
        } else {
            showExtraAttackResult("Firefly", 0)
        }
    }

    // MARK: Sorcery!

    func setSorceryGameMenu() {

        // Set up the Game Menu for Sorcery!

        if let gmm = gameMenu.submenu {
            if (gmm.items.count > 0) { gmm.removeAllItems() }
            gmm.addItem(withTitle: "Ask Libra to Revitalise You", action: #selector(libraRestore), keyEquivalent: "")
            let ym: NSMenuItem? = gmm.item(at: 0)
            if ym != nil { ym!.isEnabled = true }
        }

        gameMenu.isEnabled = true
        gameMenu.isHidden = false
        gameMenu.title = "Sorcery!"
    }

    @objc func libraRestore() {

        if let zplayer = player {
            zplayer.skill = zplayer.initialSkill
            zplayer.stamina = zplayer.initialStamina
            zplayer.luck = zplayer.initialLuck

            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Libra restores your health and fortune!"
            alert.informativeText = "Your Skill, Stamina and Luck scores have been restored to their initial values."

            alert.beginSheetModal(for: window, completionHandler: { (modalResponse) in

                self.combatReadoutThree.stringValue = "Your Stamina is \(self.player!.stamina). Your Luck is \(self.player!.luck)"
                self.updateStats()
            })
        }
    }

}


