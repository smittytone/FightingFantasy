
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2023 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016 Steve Jackson and Ian Livingstone


import Cocoa


@NSApplicationMain

class AppDelegate:  NSObject, NSApplicationDelegate, NSTableViewDelegate, NSTableViewDataSource,
                    NSTextFieldDelegate, NSPopoverDelegate, NSTabViewDelegate, NSTextViewDelegate {

    @IBOutlet weak var tv: NSTabView!

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
    @IBOutlet weak var initSkillValue: NSTextField!
    @IBOutlet weak var initStaminaValue: NSTextField!
    @IBOutlet weak var initLuckValue: NSTextField!
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
    @IBOutlet weak var maxMagicValue: NSTextField!
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
    @IBOutlet weak var swordImage: NSImageView!

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

    // MARK: Notes Tab

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
    
    // MARK: - Globals

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
        self.appMenu.autoenablesItems = false
        self.fileMenu.autoenablesItems = false
        self.helpMenu.autoenablesItems = false

        self.aboutMenuItem.isEnabled = false
        self.helpMenuItem.isEnabled = false

        for item in self.fileMenu.items {
            item.isEnabled = false
        }

        // Show the splash screen    
        self.splashWindow.center()
        self.splashWindow.backgroundColor = NSColor.clear
        self.splashWindow.alphaValue = 1.0
        self.splashWindow.isOpaque = true
        self.splashWindow.hasShadow = true;
        self.splashWindow.makeKeyAndOrderFront(self)

        // Stop modal sheets from blocking app termination
        self.self.startSheet.preventsApplicationTerminationWhenModal = false
        aboutSheet.preventsApplicationTerminationWhenModal = false
        self.deathWindow.preventsApplicationTerminationWhenModal = false
        self.helpWindow.preventsApplicationTerminationWhenModal = false
        self.createSheet.preventsApplicationTerminationWhenModal = false

        // Load up the images here so that they're present if the user double clicks on
        // a .ffc file - which will be loaded BEFORE applicationDidFinishLoading() is called

        // Load dice images into an array for easy access later
        var image: NSImage? = NSImage.init(named: NSImage.Name("one"))
        self.dice.append(image!)
        image = NSImage.init(named: NSImage.Name("two"))
        self.dice.append(image!)
        image = NSImage.init(named: NSImage.Name("three"))
        self.dice.append(image!)
        image = NSImage.init(named: NSImage.Name("four"))
        self.dice.append(image!)
        image = NSImage.init(named: NSImage.Name("five"))
        self.dice.append(image!)
        image = NSImage.init(named: NSImage.Name("six"))
        self.dice.append(image!)

        // Load pack item icons into an array for easy access later
        image = NSImage.init(named: NSImage.Name("icon_lantern"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_sword"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_armour"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_rope"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_stick"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_skull"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_tooth"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_necklace"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_net"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_whip"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_axe"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_bow"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_quiver"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_hammer"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_dagger"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_mace"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_spear"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_sling"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_shield"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_helm"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_chainmail"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_boots"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_candle"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_horn"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_sack"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_bell"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_mirror"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_glass"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_scroll"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_book"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_staff"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_potion"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_herb"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_capsule"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_flute"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_whistle"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_eye"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_hand"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_chalice"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_gem"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_ring"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_crown"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_coins"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_key"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_pendant"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_chest"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_amulet"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_orb"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_bracelet"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_stone"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_bottle"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_food"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_tankard"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_fruit"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_fungus"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_salt"))
        self.icons.add(image!)

        // House of Hell specific icons
        image = NSImage.init(named: NSImage.Name("icon_gun"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_torch"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_box"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_bucket"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_flask"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_robe"))
        self.icons.add(image!)
        image = NSImage.init(named: NSImage.Name("icon_duck"))
        self.icons.add(image!)

        // This should always come last
        image = NSImage.init(named: NSImage.Name("icon_generic"))
        self.icons.add(image!)

        // Set up the File menu
        self.fileMenu.autoenablesItems = false
        self.showBookmarkMenuItem.title = "Show Bookmark"
        self.showBookmarkMenuItem.isEnabled = false

        // Set up the Game menu
        self.gameMenu.isHidden = true

        // Set up accessory controller for titlebar
        self.bookmarkViewController.view = self.bookmarkButtonView
        self.bookmarkViewController.layoutAttribute = .right
        self.window?.addTitlebarAccessoryViewController(self.bookmarkViewController)
        self.bookmark.isHidden = true
        self.bookmarkButtonButton.bookmarkState = false

        // Set up pack table view
        self.packTable.target = self
        //packTable.doubleAction = #selector(tableViewDoubleClick(_:))
    }

    func application(_ sender: NSApplication, openFile filename: String) -> Bool {

        // NOTE This is called after applicationWillFinish: and before applicationDidFinish:

        // Set appropriate flags
        // NOTE We set 'gameInProgress' to true here to avoid
        // rolling out the New Character sheet in start()
        self.doubleClickFileLoad = true
        self.gameInProgress = true

        // Prep the UI
        start()

        // Load in the double-clicked file
        return self.openFileHander(filename)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // Set up notifications - used when the player selects a pack icon from the popover
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(self.updatePack), name: NSNotification.Name(rawValue: "set.pack.item.index"), object: nil)

        // Select the first tab
        self.tabs.selectFirstTabViewItem(self)

        // Close the splash window and exit if we're coming from a file-load
        if self.doubleClickFileLoad {
            self.doubleClickFileLoad = false
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
        self.splashWindow.close()

        // Centre the window, then make it appear
        self.window.center()
        self.window.makeKeyAndOrderFront(self)

        // Are we starting a new game? May not be if the player double-clicked a saved file
        if !self.gameInProgress { showStartSheet() }
    }

    func applicationWillTerminate(_ aNotification: Notification) {

		// Insert code here to tear down your application
    }

    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {

        // Do we need to save the current character before quitting?
        if self.gameInProgress && self.needToSave && self.player != nil {
            let alert = NSAlert.init()
            alert.messageText = "You have a game in progress with unsaved changes"
            alert.informativeText = "If you quit now, unsaved changes will be lost"
            alert.addButton(withTitle: "Cancel")
            alert.addButton(withTitle: "Quit")
            alert.beginSheetModal(for: self.window, completionHandler: { (response) in
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
        self.aboutMenuItem.isEnabled = true
        self.helpMenuItem.isEnabled = true

        for item in self.fileMenu.items {
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
        self.bookmark.isHidden = true
        self.bookmarkButtonButton.bookmarkState = false

        // Hide the Game menu
        self.gameMenu.isHidden = true

        // Add back the Magic Tab if necessary (only if we call this after at least one game)
        if !self.tabs.tabViewItems.contains(self.magicTabItem) {
            self.tabs.insertTabViewItem(self.heldTabs["magicTabItem"]!, at: 4)
        }
    }

    func initUIstats() {

        self.skillValue.stringValue = ""
        self.luckValue.stringValue = ""
        self.staminaValue.stringValue = ""

        self.goldAmountField.stringValue = ""
        self.foodAmountField.stringValue = ""
        self.potionTypeLabel.stringValue = "None"

        self.goldAmountField.formatter = self.onlyIntFormatter
        self.foodAmountField.formatter = self.onlyIntFormatter

        // Hide the game-specific panels
        self.hellBox.isHidden = true
        self.citadelBox.isHidden = true

        let image: NSImageView = NSImageView.init(frame: NSMakeRect(10, 56, 416, 85))
        image.image = NSImage.init(named: NSImage.Name("scroll"))
        self.statsTabView.addSubview(image)
        self.statsTabImage = image
    }

    func initUICombat() {

        self.monsterOneStamField.stringValue = ""
        self.monsterOneSkillField.stringValue = ""
        self.monsterTwoStamField.stringValue = ""
        self.monsterTwoSkillField.stringValue = ""
        self.monsterThreeStamField.stringValue = ""
        self.monsterThreeSkillField.stringValue = ""

        self.monsterOneStamField.formatter = self.onlyIntFormatter
        self.monsterOneSkillField.formatter = self.onlyIntFormatter
        self.monsterTwoStamField.formatter = self.onlyIntFormatter
        self.monsterTwoSkillField.formatter = self.onlyIntFormatter
        self.monsterThreeStamField.formatter = self.onlyIntFormatter
        self.monsterThreeSkillField.formatter = self.onlyIntFormatter

        self.playerMod.selectItem(at: 6)
        self.monsterMod.selectItem(at: 6)

        self.combatReadoutOne.stringValue = ""
        self.combatReadoutTwo.stringValue = ""
        self.combatReadoutThree.stringValue = ""
    }

    func initUITests() {

        self.testSkillValue.stringValue = ""
        self.testLuckValue.stringValue = ""

        self.dieOne.image = self.dice[Int(arc4random_uniform(6))]
        self.dieTwo.image = self.dice[Int(arc4random_uniform(6))]
    }

    func initUIPack() {

        self.packTable.reloadData()
        self.packTable.needsDisplay = true
    }

    func initUIMagic() {

        self.creatureCopyField.stringValue = ""
        self.espField.stringValue = ""
        self.fireField.stringValue = ""
        self.illusionField.stringValue = ""
        self.levitationField.stringValue = ""
        self.luckField.stringValue = ""
        self.shieldingField.stringValue = ""
        self.skillField.stringValue = ""
        self.staminaField.stringValue = ""
        self.strengthField.stringValue = ""
        self.weaknessField.stringValue = ""

        self.creatureCopyField.formatter = self.onlyIntFormatter
        self.espField.formatter = self.onlyIntFormatter
        self.fireField.formatter = self.onlyIntFormatter
        self.illusionField.formatter = self.onlyIntFormatter
        self.levitationField.formatter = self.onlyIntFormatter
        self.luckField.formatter = self.onlyIntFormatter
        self.shieldingField.formatter = self.onlyIntFormatter
        self.skillField.formatter = self.onlyIntFormatter
        self.staminaField.formatter = self.onlyIntFormatter
        self.strengthField.formatter = self.onlyIntFormatter
        self.weaknessField.formatter = self.onlyIntFormatter

        self.magicSpellsValue.stringValue = "0"

        self.spellOnePopup.selectItem(at: 0)
        self.spellTwoPopup.selectItem(at: 0)
        self.spellThreePopup.selectItem(at: 0)
        self.spellFourPopup.selectItem(at: 0)
    }

    func initUINotes() {

        let font = NSFont(name: "Apple Chancery", size: 16)
        let attributes = [NSAttributedString.Key.font : font!]

        self.notesTextView.typingAttributes = attributes
        self.notesTextView.string = "Make notes about your adventure here…"
        self.notesTextView.delegate = self
    }

    func updateStats() {

        // Called regularly to update the UI with the player's current stats
        // As such, it's also where we check for death or madness
        var colour: NSColor = NSColor.labelColor

        // Set up a centred text for stats displayed using NSAtttributedStrings
        // ie. Luck and Stamina
        let tps = NSMutableParagraphStyle()
        tps.alignment = .center

        if let zplayer = self.player {
            // Stats Tab
            self.skillValue.stringValue = "\(zplayer.skill)"
            self.testSkillValue.stringValue = zplayer.gameType == .kGameHouseHell ? "\(zplayer.initialSkill)" : "\(zplayer.skill)"
            self.initSkillValue.stringValue = "\(zplayer.initialSkill)"

            // Ensure Luck readout goes red below a score of 5
            colour = zplayer.luck < 5 ? NSColor.red : colour
            var astring = NSAttributedString.init(string: "\(zplayer.luck)", attributes: [ NSAttributedString.Key.foregroundColor : colour, NSAttributedString.Key.paragraphStyle : tps ])
            self.luckValue.attributedStringValue = astring
            self.testLuckValue.attributedStringValue = astring
            self.initLuckValue.stringValue = "\(zplayer.initialLuck)"

            // Ensure Stamina readout goes red below a score of 5
            colour = zplayer.stamina < 5 ? NSColor.red : colour
            astring = NSAttributedString.init(string: "\(zplayer.stamina)", attributes: [ NSAttributedString.Key.foregroundColor : colour, NSAttributedString.Key.paragraphStyle : tps ])
            self.staminaValue.attributedStringValue = astring
            self.initStaminaValue.stringValue = "\(zplayer.initialStamina)"

            // Ensure Fear readout goes red 4 below maxFear
            colour = zplayer.fear > zplayer.maxFear - 5 ? NSColor.red :colour
            astring = NSAttributedString.init(string: "\(zplayer.fear)", attributes: [ NSAttributedString.Key.foregroundColor : colour, NSAttributedString.Key.paragraphStyle : tps ])
            self.fearValue.attributedStringValue = astring
            self.maxFearValue.stringValue = "\(zplayer.maxFear)"

            self.magicValue.stringValue = "\(zplayer.magic)"
            self.maxMagicValue.stringValue = "\(zplayer.initialMagic)"

            self.foodAmountField.stringValue = "\(zplayer.provisions)"
            self.goldAmountField.stringValue = "\(zplayer.gold)"

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

            ps += (zplayer.drinks > 0 ? " x \(zplayer.drinks)" : "")
            self.potionTypeLabel.stringValue = ps

            // Pack tab
            self.packTable.reloadData()
            self.packTable.needsDisplay = true

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

            if zplayer.gameType == .kGameHouseHell {
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

        if !self.gameInProgress || self.player == nil { return }

        // Was the Ctrl key held down while the player clicked the stepper?
        let flag = NSEvent.modifierFlags.contains(.control)

        if let stepper = (sender as? NSStepper) {
            let stepperValue = stepper.integerValue
            var psk = self.player!.skill + stepperValue

            // 'flag' is true if the Ctrl key is held down
            // If it's false, make sure we don't exceed initial skill
            // if it's true, increase up to 12 (use with reset() )
            if !flag && psk > self.player!.initialSkill { psk = self.player!.initialSkill }
            if flag && psk > 12 { psk = 12 }
            if psk < 0 { psk = 0 }

            // Only change the recorded skill value if it will change
            if (psk != self.player!.skill) {
                self.needToSave = true
                self.player!.skill = psk
            }

            stepper.integerValue = 0
            updateStats()
        }
    }

    @IBAction func adjustStamina(_ sender: Any) {

        if !self.gameInProgress || self.player == nil { return }

        // Was the Ctrl key held down while the player clicked the stepper?
        let flag = NSEvent.modifierFlags.contains(.control)

        if let stepper = (sender as? NSStepper) {
            let stepperValue = stepper.integerValue
            var pst = self.player!.stamina + stepperValue

            // 'flag' is true if the Ctrl key is held down
            // If it's false, make sure we don't exceed initial stamina
            // if it's true, increase up to 24 (use with reset() )
            if !flag && pst > self.player!.initialStamina { pst = self.player!.initialStamina }
            if flag && pst > 24 { pst = 24 }
            if pst < 0 { pst = 0 }

            // Only change the recorded stamina value if it will change
            if (pst != self.player!.stamina) {
                self.needToSave = true
                self.player!.stamina = pst
            }

            stepper.integerValue = 0
            updateStats()
        }
    }

    @IBAction func adjustLuck(_ sender: Any) {

        if !self.gameInProgress || self.player == nil { return }

        // Was the Ctrl key held down while the player clicked the stepper?
        let flag = NSEvent.modifierFlags.contains(.control)

        if let stepper = (sender as? NSStepper) {

            let stepperValue = stepper.integerValue
            var psl = self.player!.luck + stepperValue

            // 'flag' is true if the Ctrl key is held down
            // If it's false, make sure we don't exceed initial luck
            // if it's true, increase up to 12 (use with reset() )
            if !flag && psl > self.player!.initialLuck { psl = self.player!.initialLuck }
            if flag && psl > 12 { psl = 12}
            if psl < 0 { psl = 0 }

            // Only change the recorded luck value if it will change
            if (psl != self.player!.luck) {
                self.needToSave = true
                self.player!.luck = psl
            }

            stepper.integerValue = 0
            updateStats()
        }
    }

    @IBAction func adjustFood(_ sender: Any) {

        if !self.gameInProgress || self.player == nil { return }

        if let button = (sender as? NSButton) {
            if button == self.foodEatButton {
                if self.player!.provisions > 0 {
                    self.player!.provisions -= 1
                    self.foodAmountField.stringValue = "\(self.player!.provisions)"
                    self.player!.stamina += 4
                    if self.player!.stamina > self.player!.initialStamina { self.player!.stamina = self.player!.initialStamina }
                    self.needToSave = true
                    updateStats()
                }
            }
        }

        // This is called when text ends editing which happens when it loses focus, ie.
        // even when the NSTextField hasn't been used but we're switching tabs
        if let textField = (sender as? NSTextField) {
            if textField == self.foodAmountField {
                // Only change the gold value if it is different
                if self.player!.provisions != self.foodAmountField.integerValue {
                    self.player!.provisions = self.foodAmountField.integerValue
                    if self.player!.provisions < 0 { self.player!.provisions = 0 }
                    self.needToSave = true
                }
            }
        }
    }

    @IBAction func drinkPotion(_ sender: Any) {

        if !self.gameInProgress || self.player == nil { return }

        if self.player!.drinks > 0 {
            switch (self.player!.potion) {
            case kPotionDexterity:
                // Potion of Dexterity - skill returned to initial value
                self.player!.skill = self.player!.initialSkill
            case kPotionStrength:
                // Potion of strength - stamina returned to initial value
                self.player!.stamina = self.player!.initialStamina
            case kPotionFortune:
                // Potion of fortune - Initial luck increased by 1, luck set to new initial
                self.player!.initialLuck += 1
                self.player!.luck = self.player!.initialLuck
            default:
                self.player!.luck = self.player!.luck
            }

            self.player!.drinks -= 1
            if self.player!.drinks == 0 { self.player!.potion = kPotionNone }
            self.needToSave = true
            updateStats()
        }
    }

    @IBAction func adjustGold(_ sender: Any) {

        if !self.gameInProgress || self.player == nil { return }

        // Did the player click on the stepper control?
        if let stepper = (sender as? NSStepper) {
            if stepper == self.goldStepper {
                if self.player!.gold == 0 && stepper.integerValue == -1 { return }
                self.player!.gold = self.player!.gold + stepper.integerValue
                stepper.integerValue = 0
                self.needToSave = true;
                updateStats()
            }
        }

        // This is called when text ends editing which happens when it loses focus, ie.
        // even when the NSTextField hasn't been used but we're switching tabs
        if let textField = (sender as? NSTextField) {
            if textField == self.goldAmountField {
                // Only change the gold value if it is different
                if self.player!.gold != self.goldAmountField.integerValue {
                    self.player!.gold = self.goldAmountField.integerValue
                    if self.player!.gold < 0 { self.player!.gold = 0 }
                    self.needToSave = true;
                    updateStats()
                }
            }
        }
    }

    @IBAction func adjustFear(_ sender: Any) {

        if !self.gameInProgress || self.player == nil { return }

        // Was the Ctrl key held down while the player clicked the stepper?
        let flag = NSEvent.modifierFlags.contains(.control)

        if let stepper = (sender as? NSStepper) {
            let stepperValue = stepper.integerValue
            var psf = self.player!.fear + stepperValue

            // 'flag' is true if the Ctrl key is held down
            // If it's false, make sure we don't exceed maxFear
            // if it's true, increase up to 12 (use with resetStats() )
            if !flag && psf > player!.maxFear { psf = player!.maxFear }
            if flag && psf > 12 { psf = 12 }
            if psf < 0 { psf = 0 }

            // Only change the recorded fear value if it will change
            if (psf != self.player!.fear) {
                self.needToSave = true
                self.player!.fear = psf
            }

            stepper.integerValue = 0
            updateStats()
        }
    }

    @IBAction func resetStats(_ sender: Any) {

        if !self.gameInProgress || self.player == nil { return }

        // Reset the initial stats values to those currently displayed
        self.player!.initialSkill = Int(self.skillValue.stringValue)!
        self.player!.initialStamina = Int(self.staminaValue.stringValue)!
        self.player!.initialLuck = Int(self.luckValue.stringValue)!

        // Set the current stats to the displayed values
        self.player!.skill = self.player!.initialSkill
        self.player!.stamina = self.player!.initialStamina
        self.player!.luck = self.player!.initialLuck

        // Handle fear for House of Hell games
        if self.player!.gameType == .kGameHouseHell {
            self.player!.maxFear = Int(self.maxFearValue.stringValue)!
        }

        updateStats()
    }

    // MARK: - Combat Tab Functions

    @IBAction func setTarget(_ sender: Any) {

        // Make sure only one monster can be targetted at once
        if let button = (sender as? NSButton) {
            if button == self.monsterOneTargetCheck {
                self.monsterTwoTargetCheck.state = NSControl.StateValue.off
                self.monsterThreeTargetCheck.state = NSControl.StateValue.off
            } else if button == self.monsterTwoTargetCheck {
                self.monsterOneTargetCheck.state = NSControl.StateValue.off
                self.monsterThreeTargetCheck.state = NSControl.StateValue.off
            } else if button == self.monsterThreeTargetCheck {
                self.monsterTwoTargetCheck.state = NSControl.StateValue.off
                self.monsterOneTargetCheck.state = NSControl.StateValue.off
            }
        }
    }

    @IBAction func strike(_ sender: Any) {

        // Can't strike if we're not playing a game
        if !self.gameInProgress || self.player == nil { return }

        // Clear the result readout
        self.combatReadoutOne.stringValue = " "
        self.combatReadoutTwo.stringValue = " "

        // Some housekeeping: if any monster's Stamina is zero, they can't be a target or in the fight
        // We have to apply this in case the user changes it mid-fight
        if self.monsterOneStamField.integerValue < 1 {
            self.monsterOneTargetCheck.state = NSControl.StateValue.off
            self.monsterOneCombatCheck.state = NSControl.StateValue.off
        }

        if self.monsterTwoStamField.integerValue < 1 {
            self.monsterTwoTargetCheck.state = NSControl.StateValue.off
            self.monsterTwoCombatCheck.state = NSControl.StateValue.off
        }

        if self.monsterThreeStamField.integerValue < 1 {
            self.monsterThreeTargetCheck.state = NSControl.StateValue.off
            self.monsterThreeCombatCheck.state = NSControl.StateValue.off
        }

        // Roll the character's Attack Strength
        let playerRollOne = Int(arc4random_uniform(6))
        let playerRollTwo = Int(arc4random_uniform(6))
        var playerAttackStrength : Int = self.player!.skill + playerRollOne + playerRollTwo + 2

        // Add in modifier
        playerAttackStrength = playerAttackStrength + 6 - self.playerMod.indexOfSelectedItem

        // Select target. Note these are controlled elsewhere to ensure only one
        // or no targets are selected
        var target: Int = 0

        if self.monsterOneTargetCheck.state == NSControl.StateValue.on { target = 1 }
        if self.monsterTwoTargetCheck.state == NSControl.StateValue.on { target = 2 }
        if self.monsterThreeTargetCheck.state == NSControl.StateValue.on { target = 3 }

        // Save target for combat-related Luck tests
        self.combatLuckMonster = target;
        var monsterAttackStrength: Int = 0
        var monsterStrength: Int = 0

        switch (target) {
        case 1:
            monsterAttackStrength = self.monsterOneSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2
            monsterStrength = self.monsterOneStamField.integerValue
        case 2:
            monsterAttackStrength = self.monsterTwoSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2
            monsterStrength = self.monsterTwoStamField.integerValue
        case 3:
            monsterAttackStrength = self.monsterThreeSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2
            monsterStrength = self.monsterThreeStamField.integerValue
        default:
            self.combatReadoutTwo.stringValue = "You didn't select a target..."
        }

        monsterAttackStrength = monsterAttackStrength + 6 - monsterMod.indexOfSelectedItem

        // Are we playing Creature of Havoc? A double throw means instant opponent death
        if self.player!.gameType == .kGameCreatureHavoc && playerRollOne == playerRollTwo {
            playerAttackStrength = monsterAttackStrength + 1
            monsterStrength = 0
        }

        // Preserve the outcome of the round in case a Luck test is made
        // 1 indicates character victory - ie. Luck test to increase damage on monster
        // 2 indicated monster victory - ie. Luck test to reduce damage to character
        self.combatLuckOutcome = 0
        var roll: Int = 0

        // Compare Attack Strength values, find the combat round's winner and apply damage
        // First make sure at least one monster has been checked as in the fight
        if self.monsterOneCombatCheck.state == NSControl.StateValue.on ||
            self.monsterTwoCombatCheck.state == NSControl.StateValue.on ||
            self.monsterThreeCombatCheck.state == NSControl.StateValue.on {
            if playerAttackStrength > monsterAttackStrength {
                self.combatReadoutOne.stringValue = (self.player!.gameType == .kGameCreatureHavoc ? "Your claws strikes home..." : "Your weapon strikes home...")
                monsterStrength = monsterStrength - 2
                self.combatLuckOutcome = 1
            } else if monsterAttackStrength > playerAttackStrength {
                self.player!.stamina = self.player!.stamina - (self.player!.gameType == .kGameCreatureHavoc ? 1 : 2)
                self.combatReadoutOne.stringValue = "The creature strikes you..."
                self.combatLuckOutcome = 2
                self.needToSave = true
            } else {
                roll = Int(arc4random_uniform(6)) + 1
                self.combatReadoutOne.stringValue = (roll % 2 == 0) ? "You parry the blow..." : "The creature dodges your attack..."
            }

            // Now check for other monsters' attacks, if anys
            // If character's already dead, it only wastes CPU cycles, result's the same
            var hits: Int = -1

            if self.monsterOneCombatCheck.state == NSControl.StateValue.on && target != 1 {
                // Monster One's in the game but not the target
                monsterAttackStrength = self.monsterOneSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2

                // Only care if it hits the character
                if monsterAttackStrength > playerAttackStrength {
                    self.player!.stamina -= 2
                    hits += 1
                }

                if hits == -1 { hits = 0 }
            }

            if self.monsterTwoCombatCheck.state == NSControl.StateValue.on && target != 2 {
                // Monster Two's in the game but not the target
                monsterAttackStrength = self.monsterTwoSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2

                // Only care if it hits the character
                if monsterAttackStrength > playerAttackStrength {
                    self.player!.stamina -= 2
                    hits += 1
                }

                if hits == -1 { hits = 0 }
            }

            if self.monsterThreeCombatCheck.state == NSControl.StateValue.on && target != 3 {
                // Monster Three's in the game but not the target
                monsterAttackStrength = self.monsterThreeSkillField.integerValue + Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2

                // Only care if it hits the character
                if monsterAttackStrength > playerAttackStrength {
                    self.player!.stamina -= 2
                    hits += 1
                }

                if hits == -1 { hits = 0 }
            }

            // Record any extra hits
            // NOTE 'hits' will be -1 if there are no other possible attacks
            if hits == 0 {
                self.combatReadoutTwo.stringValue = "No other monster hits you"
            } else if hits == 1 {
                self.combatReadoutTwo.stringValue = "One monster gets an extra hit on you"
            } else if hits > 1 {
                self.combatReadoutTwo.stringValue = "The other monsters hit you \(hits) times"
            }

            // All attacks are done now, so we just need to check if the attacked monster's dead or not.
            // If it is, move target radio button seletion and zero its skill reading
            if monsterStrength < 1 {
                monsterStrength = 0

                switch (target) {
                case 1:
                    self.monsterOneStamField.stringValue = "\(monsterStrength)"
                    self.combatReadoutOne.stringValue = self.combatReadoutOne.stringValue + " killing the beast"

                    // Move target radio button selection along
                    self.monsterOneTargetCheck.state = NSControl.StateValue.off
                    self.monsterOneCombatCheck.state = NSControl.StateValue.off
                    self.monsterTwoTargetCheck.state = NSControl.StateValue.on
                case 2:
                    self.monsterTwoStamField.stringValue = "\(monsterStrength)"
                    self.combatReadoutOne.stringValue = self.combatReadoutOne.stringValue + " killing the beast"
                    self.monsterTwoTargetCheck.state = NSControl.StateValue.off
                    self.monsterTwoCombatCheck.state = NSControl.StateValue.off
                    self.monsterThreeTargetCheck.state = NSControl.StateValue.on
                default:
                    self.monsterThreeStamField.stringValue = "\(monsterStrength)"
                    self.combatReadoutOne.stringValue = self.combatReadoutOne.stringValue + " killing the beast"
                    self.monsterThreeTargetCheck.state = NSControl.StateValue.off
                    self.monsterThreeCombatCheck.state = NSControl.StateValue.off
                    self.monsterOneTargetCheck.state = NSControl.StateValue.on
                }
            }

            // Update monster Stamina readout no matter what - it has to say zero if that's what the number is
            switch (target) {
            case 1:
                self.monsterOneStamField.stringValue = "\(monsterStrength)"
            case 2:
                self.monsterTwoStamField.stringValue = "\(monsterStrength)"
            default:
                self.monsterThreeStamField.stringValue = "\(monsterStrength)"
            }

            // Clear the Luck check flag if the player tested their luck
            self.combatLuckCheck = false

            // Update the stats - this checks for player death
            updateStats()

            // Present local stats for the player
            self.combatReadoutThree.stringValue = "Your Stamina is \(self.player!.stamina). Your Luck is \(self.player!.luck)"
        } else {
            self.combatReadoutOne.stringValue = "No monster has been selected to fight..."
            self.combatLuckCheck = true
        }
    }

    @IBAction func combatLuckRoll(_ sender: Any) {

        if self.combatLuckCheck || self.player == nil {
            // Player has already Tested Luck this combat round, or the creature(s) is dead
            return
        }

        var success: Bool = false
        var a: Int = 0
        var roll = Int(arc4random_uniform(6)) + 1
        roll = roll + 3 - self.testLuckMod.indexOfSelectedItem

        // For the Luck roll, we do this separately to avoid having multiple versions of the same test code
        success = (roll <= player!.luck)
        self.player!.luck -= 1
        self.needToSave = true

        if self.combatLuckOutcome == 1 {
            // The player previously hit the monster... try to increase damage
            if success {
                switch (self.combatLuckMonster) {
                    case 1:
                    a = self.monsterOneStamField.integerValue - 2

                    if a <= 0 {
                        a = 0
                        self.combatReadoutTwo.stringValue = "A lucky strike... you kill the beast"
                    } else {
                        self.combatReadoutTwo.stringValue = "A lucky strike... you hit it harder than you thought"
                    }

                    self.monsterOneStamField.stringValue = "\(a)"

                    case 2:
                    a = self.monsterTwoStamField.integerValue - 2

                    if a <= 0 {
                        a = 0
                        self.combatReadoutTwo.stringValue = "A lucky strike... you kill the beast"
                    } else {
                        self.combatReadoutTwo.stringValue = "A lucky strike... you hit it harder than you thought"
                    }

                    self.monsterTwoStamField.stringValue = "\(a)"

                    default:
                    a = self.monsterThreeStamField.integerValue - 2

                    if a <= 0 {
                        a = 0
                        self.combatReadoutTwo.stringValue = "A lucky strike... you kill the beast"
                    } else {
                        self.combatReadoutTwo.stringValue = "A lucky strike... you hit it harder than you thought"
                    }

                    self.monsterThreeStamField.stringValue = "\(a)"
                }
            } else {
                self.combatReadoutTwo.stringValue = "Unlucky... you didn't hurt it as much as you thought"
                switch (self.combatLuckMonster) {
                    case 1:
                    self.monsterOneStamField.stringValue = "\(self.monsterOneStamField.integerValue + 1)"
                    case 2:
                    self.monsterTwoStamField.stringValue = "\(self.monsterTwoStamField.integerValue + 1)"
                    default:
                    self.monsterThreeStamField.stringValue = "\(self.monsterThreeStamField.integerValue + 1)"
                }
            }
        }

        if self.combatLuckOutcome == 2 {
            // The monster hit the character... try to reduce strength of blow
            if success {
                self.player!.stamina += 1
                self.combatReadoutTwo.stringValue = "Good luck... that was only a glancing blow"
            } else {
                self.player!.stamina -= 1
                self.combatReadoutTwo.stringValue = "Unlucky... its attack did extra damage"
            }
        }

        updateStats()

        self.combatReadoutThree.stringValue = "Your Stamina is \(self.player!.stamina). Your Luck is \(self.player!.luck)"
    }

    // MARK: - Test Tab Functions

    @IBAction func testLuck(_ sender: Any) {

        if !self.gameInProgress || self.player == nil { return }

        var roll: Int = Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2
        roll = roll + 3 - self.testLuckMod.indexOfSelectedItem
        showAlert((roll <= self.player!.luck ? "Destiny smiles upon you..." : "You are ill-favoured..."), "", true)
        self.player!.luck -= 1
        self.needToSave = true
    }

    @IBAction func testSkill(_ sender: Any) {

        if !self.gameInProgress || self.player == nil { return }

        var roll: Int = Int(arc4random_uniform(6) + arc4random_uniform(6)) + 2
        roll = roll + 3 - self.testSkillMod.indexOfSelectedItem
        var sk = self.player!.skill

        if self.player!.gameType == .kGameHouseHell {
            sk = self.player!.skill + 3
            if sk > self.player!.initialSkill { sk = self.player!.initialSkill }
        }

        showAlert((roll <= sk ? "You were skilfull..." : "You fumble the test..."), "", true)
        self.needToSave = true
    }

    @IBAction func rollDice(_ sender: Any) {

        if let myself = (sender as? AppDelegate) {
            // Are we here through a timer call? The caller is 'self' if so
            if myself == self {
                if self.rollCount > 0 {
                    var roll: Int = Int(arc4random_uniform(6))
                    self.dieOne.image = dice[roll]

                    roll = Int(arc4random_uniform(6))
                    self.dieTwo.image = dice[roll]

                    self.rollCount -= 1
                    _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { (timer) in
                        self.rollDice(self)
                    })
                } else {
                    self.rollCount = -1
                }
            }

            return
        }

        // We have clicked the button, but we check against rollcount so that
        // subsequent (fast) clicks don't trigger the sequence
        if self.rollCount == -1 {
            self.rollCount = 10
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
        if let iconButton = (sender as? FFIconButton) {
            // Make sure the matrix controller knows which button was clicked on
            self.iconPopoverController.button = iconButton

            // Show the popover
            self.iconPopover!.show(relativeTo: iconButton.bounds, of: iconButton, preferredEdge: NSRectEdge.maxY)
        }
    }

    func makeIconMatrix() {

        // Assemble the popover if it hasn't been assembled yet
        if self.iconPopover == nil {
            self.iconPopover = NSPopover.init()
            self.iconPopover!.contentViewController = self.iconPopoverController
            self.iconPopover!.delegate = self
            self.iconPopover!.behavior = NSPopover.Behavior.transient
            self.iconPopoverController.icons = self.icons
        }
    }

    @IBAction func addPackItem(_ sender: Any) {

		// The player has entered an item in the add pack field and click the Add button
        if let zplayer = self.player {
            let itemName = "New pack item"
			let item: [String:Any] = [ "name" : itemName,
                                       "icon" : NSNumber.init(value: self.icons.count - 1) ]

            zplayer.pack.append(item)

            // Update the table
            self.packTable.reloadData()
            self.packTable.needsDisplay = true
            self.packTable.scrollRowToVisible(zplayer.pack.count - 1)

            self.needToSave = true
            updateStats()
        }
    }

    @IBAction func usePackItem(_ sender: Any) {

		// The player has selected a pack item and clicked the 'Use' button to use and remove it

		// Nothing selected? Bail
        if self.packTable.selectedRow == -1 { return }

		// Otherwise...
        if let zplayer = self.player {
			// Remove the item from the pack, and the item's icon index
			zplayer.pack.remove(at: zplayer.packSelectedItem)

            // Update the table
            self.packTable.reloadData()
            self.packTable.needsDisplay = true

            self.needToSave = true
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
            for i in 0..<self.packTable.numberOfRows {
                if let rowView = self.packTable.rowView(atRow: i, makeIfNecessary: false) {
                    // From the row view, extract the column 0 view - this will be
                    // an FFTableCellView, which we can compare with the one retrieved above
                    let colView = rowView.view(atColumn: 0) as! FFTableCellView
                    if view == colView {
                        // The view's match, so update the relevant pack item in the player instance
                        if let zplayer = self.player {
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
        return (self.player != nil ? self.player!.pack.count : 0)
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        if let zplayer = self.player {
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

        if let zplayer = self.player { zplayer.packSelectedItem = row }
        return true
    }

    func tableView(_ tableView: NSTableView, shouldEdit tableColumn: NSTableColumn?, row: Int) -> Bool {

        if let zplayer = self.player {
            if row < zplayer.pack.count { return true }
        }

        return false
    }

    @objc func tableViewDoubleClick(_ sender:AnyObject) {

        // Make sure user has double-clicked on a non-empty row
        if self.packTable.selectedRow >= 0 {
            usePackItem(self)
            if let cell = self.packTable.view(atColumn: 0, row: self.packTable.selectedRow, makeIfNecessary: false) {
                let item = cell as! NSTableCellView
                item.textField?.isEditable = true
                item.textField?.delegate = self
            }
        }
    }

    func controlTextDidEndEditing(_ obj: Notification) {

        // This NSControl delegate method is used to trap when ending ends in a table row's NSTextField
        if let zobj = obj.userInfo {
            let textField: NSTextView = zobj["NSFieldEditor"] as! NSTextView
            let row = self.packTable.selectedRow
            if row != -1 {
                if let zplayer = self.player {
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

        if !self.gameInProgress || self.player == nil { return }

        var success: Bool = false

        if self.player!.gameType != .kGameCitadel {
            // Not a Citadel of Chaos game? Then ignore click
            showAlert("This section is only for Citadel of Chaos games", "", false)
            return
        }

        if self.creatureCopyCell.state == NSControl.StateValue.on {
            if self.creatureCopyField.integerValue > 0 {
                success = true
                self.creatureCopyField.stringValue = "\(self.creatureCopyField.integerValue - 1)"
            }
        }

        if self.espCell.state == NSControl.StateValue.on {
            if self.espField.integerValue > 0 {
                success = true
                self.espField.stringValue = "\(self.espField.integerValue - 1)"
            }
        }

        if self.fireCell.state == NSControl.StateValue.on {
            if self.fireField.integerValue > 0 {
                success = true
                self.fireField.stringValue = "\(self.fireField.integerValue - 1)"
            }
        }

        if self.illusionCell.state == NSControl.StateValue.on {
            if self.illusionField.integerValue > 0 {
                success = true
                self.illusionField.stringValue = "\(self.illusionField.integerValue - 1)"
            }
        }

        if self.levitationCell.state == NSControl.StateValue.on {
            if self.levitationField.integerValue > 0 {
                success = true
                self.levitationField.stringValue = "\(self.levitationField.integerValue - 1)"
            }
        }

        if self.luckCell.state == NSControl.StateValue.on {
            if self.luckField.integerValue > 0 {
                success = true
                self.player!.luck = self.player!.luck + (self.player!.initialLuck / 2)
                self.luckField.stringValue = "\(self.luckField.integerValue - 1)"
            }
        }

        if self.shieldingCell.state == NSControl.StateValue.on {
            if self.shieldingField.integerValue > 0 {
                success = true
                self.shieldingField.stringValue = "\(self.shieldingField.integerValue - 1)"
            }
        }

        if self.skillCell.state == NSControl.StateValue.on {
            if self.skillField.integerValue > 0 {
                success = true
                self.player!.skill = self.player!.skill + (self.player!.initialSkill / 2)
                self.skillField.stringValue = "\(self.skillField.integerValue - 1)"
            }
        }

        if self.staminaCell.state == NSControl.StateValue.on {
            if self.staminaField.integerValue > 0 {
                success = true
                self.player!.stamina = self.player!.stamina + (self.player!.initialStamina / 2)
                self.staminaField.stringValue = "\(self.staminaField.integerValue - 1)"
            }
        }

        if self.strengthCell.state == NSControl.StateValue.on {
            if self.strengthField.integerValue > 0 {
                success = true
                self.strengthField.stringValue = "\(self.strengthField.integerValue - 1)"
            }
        }

        if self.weaknessCell.state == NSControl.StateValue.on {
            if self.weaknessField.integerValue > 0 {
                success = true
                self.weaknessField.stringValue = "\(self.weaknessField.integerValue - 1)"
            }
        }

        if success {
            self.player!.magic = self.player!.magic - 1
            self.needToSave = true
            showAlert("You cast the spell...", "The gamebook will tell you the outcome of your success", true)
        } else {
            showAlert("You could not cast the spell...", "The gamebook will tell you the outcome of your failure", true)
        }
    }

    @IBAction func magicTotaliser(_ sender: Any) {

        // This routine is called when the user types in a number into a magic spell Uses field.
        // It adds up all the points entered thus far to make sure they don't exceed the Magic value.
        // NOTE Also called when it has focus and the tab shifts

        if let zplayer = self.player {

            if zplayer.gameType != .kGameCitadel {
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

            points = self.creatureCopyField.integerValue + self.espField.integerValue + self.fireField.integerValue + self.illusionField.integerValue +
            self.levitationField.integerValue + self.luckField.integerValue + self.shieldingField.integerValue + self.skillField.integerValue +
            self.staminaField.integerValue + self.strengthField.integerValue + self.weaknessField.integerValue

            if points > magicTotal {
                // Zero the points just entered
                if let asender = (sender as? NSTextField) { asender.stringValue = "0" }
                showAlert("You have assigned more magic points than you have available to spend", "", false)
                return
            }

            // Update the 'total points left' field
            self.magicSpellsValue.stringValue = "\(magicTotal - points)"
        }
    }

    func showAlert(_ title: String, _ message: String, _ update: Bool) {

        let alert: NSAlert = NSAlert.init()
        alert.messageText = title
        if message.count > 0 { alert.informativeText = message }

        alert.beginSheetModal(for: self.window, completionHandler: { (modalResponse) in
            if update { self.updateStats() }
        })
    }

    // MARK: - Bookmarking Functions

    @IBAction func showBookmark(_ sender: Any) {

        if !self.gameInProgress || self.player == nil { return }

        if self.player!.bookmark == -1 {
            // The player hasn't set a bookmark yet, so open the appropriate sheet
            // NOTE we can only come here from the titlebar button, not the menu
            // as it will not have been enabled yet
            showBookmarker(self)
            return
        }

        self.bookmark.isHidden = !self.bookmark.isHidden
        self.bookmarkButtonButton.bookmarkState = !self.bookmarkButtonButton.bookmarkState
        self.showBookmarkMenuItem.isEnabled = true
        self.showBookmarkMenuItem.title = self.bookmark.isHidden ? "Show Bookmark" : "Hide Bookmark"
    }

    @IBAction func showBookmarker(_ sender: Any) {

        if !self.gameInProgress || self.player == nil { return }

        // Make sure we don't show -1 for the bookmark (-1 means no bookmark set)
        self.bookmarkCurrentField.stringValue = self.player!.bookmark == -1 ? "1" : "\(self.player!.bookmark)"
        self.bookmarkCurrentField.formatter = self.onlyIntFormatter

        // Show the sheet
        self.window.beginSheet(self.bookmarkWindow, completionHandler:  { (response) in })
    }

    @IBAction func cancelBookmarker(_ sender: Any) {

        // Close the sheet
        self.window.endSheet(self.bookmarkWindow)
    }

    @IBAction func setBookmarker(_ sender: Any) {

        if let zplayer = self.player {
            let stringValue = self.bookmarkCurrentField.stringValue
            let value: Int = stringValue.isEmpty ? zplayer.bookmark : Int(stringValue)!

            // Only set the bookmark if it has been changed
            // Only show the bookmark graphic if a bookmark has been set
            if zplayer.bookmark != value {
                zplayer.bookmark = value
                self.needToSave = true
                //window.isDocumentEdited = true
                self.bookmark.place = value
                self.bookmark.needsDisplay = true
                self.bookmark.isHidden = true
                self.bookmarkButtonButton.bookmarkState = false
                showBookmark(self)
            }
        }

        // Close the sheet
        self.window.endSheet(self.bookmarkWindow)
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
        self.deathImageView.image = image

        // We give the player one chance to reanimate - and they have had it
        // so hide the reanimte button
        self.reanimateButton.isEnabled = self.firstRun ? true : false
        self.reanimateButton.isHidden = self.firstRun ? false : true

        self.window.beginSheet(self.deathWindow, completionHandler:  { (response) in })
    }

    @IBAction func reanimate(_ sender: Any) {

        // Player chooses to try again on reduced stats
        self.window.endSheet(self.deathWindow)

        if let zplayer = self.player {
            zplayer.isDead = false
            self.gameInProgress = true
            self.needToSave = true
            self.firstRun = false

            zplayer.skill = self.player!.initialSkill
            zplayer.stamina = self.player!.initialSkill > 12 ? 12 : self.player!.initialSkill
            zplayer.fear = 6
            
            updateStats()
        }
    }

    @IBAction func quitter(_ sender: Any) {

        // Player calls it quits
        self.window.endSheet(self.deathWindow)
        self.gameInProgress = false
        self.needToSave = false
        self.firstRun = false
        self.player = nil

        // Reset the UI
        initUI()
    }

    // MARK: - Player Save/Load Functions

    @IBAction func savePlayer(_ sender: Any) {

        // Don't continue if the player is dead or nothing has changed
        // since the last save
        if self.player == nil || !self.needToSave { return }
        if self.player!.isDead { return }

        if self.savePath.count == 0 {
            // We have no save path for some reason, so force a Save As...
            savePlayerAs(self)
            return
        }

        // Save the player
        let result: Bool = save(self.savePath)
        self.needToSave = !result
    }

    @IBAction func savePlayerAs(_ sender: Any) {

        // Only proceed if the player isn't dead
        if self.player == nil { return }

        if !self.player!.isDead {
            if self.savePanel == nil { self.savePanel = NSSavePanel.init() }
            if let panel = self.savePanel {
                panel.nameFieldLabel = "Character name"
                panel.isExtensionHidden = true
                panel.allowedFileTypes = ["ffc"]
                panel.beginSheetModal(for: self.window, completionHandler: { (response) in

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

        if let zplayer = self.player {

            // Back-up Citadel of Chaos magic spell uses table
            zplayer.citadelSpellMatrix[0] = self.creatureCopyField.integerValue
            zplayer.citadelSpellMatrix[1] = self.espField.integerValue
            zplayer.citadelSpellMatrix[2] = self.fireField.integerValue
            zplayer.citadelSpellMatrix[3] = self.illusionField.integerValue
            zplayer.citadelSpellMatrix[4] = self.levitationField.integerValue
            zplayer.citadelSpellMatrix[5] = self.luckField.integerValue
            zplayer.citadelSpellMatrix[6] = self.shieldingField.integerValue
            zplayer.citadelSpellMatrix[7] = self.skillField.integerValue
            zplayer.citadelSpellMatrix[8] = self.staminaField.integerValue
            zplayer.citadelSpellMatrix[9] = self.strengthField.integerValue
            zplayer.citadelSpellMatrix[10] = self.weaknessField.integerValue

            // Back up Skill/Luck Test Modifiers
            zplayer.modMatrix[0] = self.testLuckMod.indexOfSelectedItem
            zplayer.modMatrix[1] = self.testSkillMod.indexOfSelectedItem
            zplayer.modMatrix[2] = self.playerMod.indexOfSelectedItem
            zplayer.modMatrix[3] = self.monsterMod.indexOfSelectedItem

            // Back up Temple of Terror spells
            zplayer.templeSpellMatrix[0] = self.spellOnePopup.indexOfSelectedItem
            zplayer.templeSpellMatrix[1] = self.spellTwoPopup.indexOfSelectedItem
            zplayer.templeSpellMatrix[2] = self.spellThreePopup.indexOfSelectedItem
            zplayer.templeSpellMatrix[3] = self.spellFourPopup.indexOfSelectedItem

            zplayer.notes = notesTextView.string

            // Save theCharacter object
            do {
                let fileData: Data = try NSKeyedArchiver.archivedData(withRootObject: zplayer, requiringSecureCoding: false)
                try fileData.write(to: URL.init(fileURLWithPath: path))
                result = true
            } catch {
                // NOP
            }

        }

        return result
    }

    @IBAction func openCharacter(_ sender: Any) {

        if self.gameInProgress && self.needToSave {
            // There's a game in progress, so warn the user...
            let alert = NSAlert.init()
            alert.messageText = self.needToSave ? "You have a game in progress with unsaved changes" : "You have a game in progress"
            alert.informativeText = self.needToSave ? "If you reload a character now, unsaved changes will be lost" : "Are you sure?"
            alert.addButton(withTitle: "No")
            alert.addButton(withTitle: "Yes")

            alert.beginSheetModal(for: self.window) { (response) in
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
        openPanel.beginSheetModal(for: self.window, completionHandler: { (response) in
            if response == NSApplication.ModalResponse.OK {
                let path:String = openPanel.urls[0].path
                _ = self.openFileHander(path)
            }
        })

        self.tabs.selectTabViewItem(at: 0)
    }

    func openFileHander(_ path: String) -> Bool {

        do {
            let fileData: Data = try Data.init(contentsOf: URL.init(fileURLWithPath: path))
            let kuav: NSKeyedUnarchiver = try NSKeyedUnarchiver.init(forReadingFrom: fileData)
            kuav.requiresSecureCoding = false
            if let decoded = kuav.decodeObject(of: FFPlayer.self, forKey: NSKeyedArchiveRootObjectKey) {
                self.player = decoded as FFPlayer?
            }
        } catch {
            return false
        }

        if let zplayer = self.player {
            // Update the Citadel of Chaos magic spell matrix
            if zplayer.gameType == .kGameCitadel {
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
            if zplayer.gameType == .kGameTempleTerror {
                self.spellOnePopup.selectItem(at: zplayer.templeSpellMatrix[0])
                self.spellTwoPopup.selectItem(at: zplayer.templeSpellMatrix[1])
                self.spellThreePopup.selectItem(at: zplayer.templeSpellMatrix[2])
                self.spellFourPopup.selectItem(at: zplayer.templeSpellMatrix[3])
            }

            // Handle tab hiding/unhiding
            if zplayer.gameType == .kGameTempleTerror || zplayer.gameType == .kGameCitadel {
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
            self.hellBox.isHidden = zplayer.gameType == .kGameHouseHell ? false : true
            self.citadelBox.isHidden = zplayer.gameType == .kGameCitadel ? false : true

            // Update the modifiers
            self.testLuckMod.selectItem(at: zplayer.modMatrix[0])
            self.testSkillMod.selectItem(at: zplayer.modMatrix[1])
            self.playerMod.selectItem(at: zplayer.modMatrix[2])
            self.monsterMod.selectItem(at: zplayer.modMatrix[3])

            self.savePath = path
            self.gameInProgress = true

            // Set up the Game menu
            setGameMenu(zplayer.gameType)

            // Set up the bookmark
            if zplayer.bookmark != -1 {
                self.bookmark.place = zplayer.bookmark
                self.bookmark.needsDisplay = true
                self.bookmark.isHidden = true
                self.bookmarkButtonButton.bookmarkState = false
                showBookmark(self)
            }

            // Drop in the notes the player made last game
            self.notesTextView.string = zplayer.notes

            // Set the Stats View image
            setStatsViewImage(zplayer.gameType)

            // Update the window title
            self.window.title = zplayer.gameName

            // Show the player's stats
            updateStats()

            // Show the extra information as a reminder
            showExtraInfo(zplayer.gameType)

            return true
        } else {
            return false
        }
    }

    @IBAction func closeCharacter(_ sender: Any) {

        if self.gameInProgress && self.needToSave {
            // There's a game going on, so warn the player
            let alert = NSAlert.init()
            alert.messageText = self.needToSave ? "You have a game in progress with unsaved changes" : "You have a game in progress"
            alert.informativeText = self.needToSave ? "If you close the character now, unsaved changes will be lost" : "Are you sure?"
            alert.addButton(withTitle: "No")
            alert.addButton(withTitle: "Yes")
            alert.beginSheetModal(for: self.window, completionHandler: { (response) in
                if response == NSApplication.ModalResponse.alertSecondButtonReturn { self.doClose() }
            })

            return
        }

        // Otherwise, just close
        doClose()
    }

    func doClose() {

        // Clear the player and refresh the UI
        self.player = nil
        self.gameInProgress = false
        self.needToSave = false
        initUI()
    }

    // MARK: - Player Creation Functions

    @IBAction func newPlayer(_ sender: Any) {

        // Called when the player selects 'New Character' from the File menu

        if self.gameInProgress && self.needToSave {
            // There's a game in progress, so warn the user...
            let alert = NSAlert.init()
            alert.messageText = self.needToSave ? "You have a game in progress with unsaved changes" : "You have a game in progress"
            alert.informativeText = self.needToSave ? "If you create a new character now, unsaved changes will be lost" : "Are you sure?"
            alert.addButton(withTitle: "No")
            alert.addButton(withTitle: "Yes")

            alert.beginSheetModal(for: self.window) { (response) in
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
        self.startSkillField.stringValue = "0"
        self.startStaminaField.stringValue = "0"
        self.startLuckField.stringValue = "0"
        self.startGamePopup.selectItem(at: 0)
		setItemsForGame(self)
        rollStats(self)

        // Present the New Player sheet
        // NOTE There's no completion handler used here, as we send the buttons' actions
        // to functions within this App Delegate (see below)
        self.window.beginSheet(self.createSheet, completionHandler: nil)

        self.tabs.selectTabViewItem(at: 0)
	}

    @IBAction func rollStats(_ sender: Any) {

        // Roll basic stats when the player clicks 'Roll'
        var roll: Int = Int(arc4random_uniform(6)) + 7
        self.startSkillField.stringValue = "\(roll)"

        roll = Int(arc4random_uniform(6) + arc4random_uniform(6)) + 14
        self.startStaminaField.stringValue = "\(roll)"

        roll = Int(arc4random_uniform(6)) + 7
        self.startLuckField.stringValue = "\(roll)"
    }

    @IBAction func setItemsForGame(_ sender: Any) {

        // Pre-fill certain fields in the New Character panel according
        // to the type of game selected to save the player adding it in
        var type = self.startGamePopup.indexOfSelectedItem;
        if type > 13 { type += 5 }

        if type == kGameCitadel || type == kGameHouseHell
            || type == kGameReturnFiretop || type == kGameTrialChampions || type == kGameCreatureHavoc {
            self.startPotionPopup.isEnabled = false
            self.startFoodField.stringValue = "0"
            self.startGoldField.stringValue = "0"
        } else if type == kGameTempleTerror || type == kGameEyeDragon {
            self.startPotionPopup.isEnabled = false
            self.startFoodField.stringValue = "10"
            self.startGoldField.stringValue = "0"
        } else if type == kGameSorceryWizard || type == kGameSorceryFighter {
            self.startPotionPopup.isEnabled = false
            self.startFoodField.stringValue = "2"
            self.startGoldField.stringValue = "20"
        } else {
            self.startPotionPopup.isEnabled = true
            self.startFoodField.stringValue = "10"
            self.startGoldField.stringValue = "0"
        }
    }

    @IBAction func cancelSheet(_ sender: Any) {

        // Just hide the New Player UI without doing anything else
        self.window.endSheet(self.createSheet)
    }

    @IBAction func setPlayer(_ sender: Any) {

        // Initialise the game itself
        self.needToSave = true
        self.firstRun = true
        self.gameInProgress = true

        // Create a new player instance and set its properties according to the
        // values entered into the UI
        self.player = FFPlayer()
        self.player!.gold = self.startGoldField.integerValue
        self.player!.provisions = self.startFoodField.integerValue

        self.player!.potion = self.startPotionPopup.indexOfSelectedItem - 1
        if self.player!.potion == -1 { self.player!.potion = Int(arc4random_uniform(2)) }
        self.player!.drinks = 2

        self.player!.skill = self.startSkillField.integerValue
        self.player!.initialSkill = self.player!.skill
        self.player!.stamina = self.startStaminaField.integerValue
        self.player!.initialStamina = self.player!.stamina
        self.player!.luck = self.startLuckField.integerValue
        self.player!.initialLuck = self.player!.luck

        // We make sure elsewhere that only one or none of these options are seleced
        // Note that all of these 'non-default' game types do not use potions, so
        // remove them if the user has selected one

        let gameKind: FFGameType = FFGameType(rawValue: self.startGamePopup.indexOfSelectedItem) ?? .kGameWarlock
        //if gameType > kGamePortPeril { gameType = gameType + 6 }
        self.player!.gameType = gameKind

        // The following are 'standard' games with no special load-out
        if gameKind == .kGameWarlock { self.player!.gameName = "The Warlock of Firetop Mountain" }
        if gameKind == .kGameDeathtrap { self.player!.gameName = "Deathtrap Dungeon" }
        if gameKind == .kGameCityThieves { self.player!.gameName = "City of Thieves" }

        // Manage the Magic tab — it's only present for certain games
        if gameKind != .kGameCitadel && gameKind != .kGameTempleTerror {
            // Remove the Magic tab for all but Citadel of Chaos and Temple of Terror
            self.heldTabs["magicTabItem"] = self.magicTabItem!
            if self.tabs.tabViewItems.contains(self.magicTabItem) { self.tabs.removeTabViewItem(self.magicTabItem) }
        } else {
            // Add back the Magic tab on the end if necessary
            if !self.tabs.tabViewItems.contains(self.magicTabItem) { self.tabs.insertTabViewItem(self.heldTabs["magicTabItem"]!, at: 4) }
        }

        // Hide the game menu
        self.gameMenu.isHidden = true
        self.gameMenu.isEnabled = false

        // Hide the game-specific Stats tab boxes
        self.citadelBox.isHidden = true
        self.hellBox.isHidden = true

        if gameKind == .kGameCitadel {
            player!.magic = Int(arc4random_uniform(6) + arc4random_uniform(6)) + 8
            self.player!.initialMagic = self.player!.magic
            self.player!.potion = kPotionNone
            self.player!.gold = 0
            self.player!.gameName = "Citadel of Chaos"
            self.citadelBox.isHidden = false

            self.magicSpellsValue.stringValue = "\(self.player!.magic)"
        }

        if gameKind == .kGameHouseHell {
            self.player!.skill = self.player!.skill - 3
            self.player!.initialSkill = self.player!.skill + 3
            self.player!.maxFear = Int(arc4random_uniform(6)) + 7
            self.player!.fear = 0
            self.player!.potion = kPotionNone
            self.player!.gold = 0
            self.player!.provisions = 0
            self.player!.gameName = "House of Hell"
            self.hellBox.isHidden = false
        }

        if gameKind == .kGameForestDoom {
            self.player!.gold = 30
            self.player!.gameName = "Forest of Doom"
        }

        if gameKind == .kGameCavernsSnow {
            self.player!.drinks = 1
            self.player!.gold = 0
            self.player!.gameName = "Caverns of the Snow Witch"
        }

        if gameKind == .kGameReturnFiretop {
            self.player!.potion = kPotionNone
            self.player!.gold = 0
            self.player!.provisions = 0
            self.player!.gameName = "Return to Firetop Mountain"
        }

        if gameKind == .kGameTempleTerror {
            self.player!.potion = kPotionNone
            self.player!.gold = 25
            self.player!.gameName = "Temple of Terror"
        }

        if gameKind == .kGameEyeDragon {
            self.player!.potion = kPotionNone
            self.player!.provisions = 10
            self.player!.gold = 0
            self.player!.gameName = "Eye of the Dragon"
        }

        if gameKind == .kGameTrialChampions {
            self.player!.potion = kPotionNone
            self.player!.provisions = 0
            self.player!.gold = 0
            self.player!.gameName = "Trial of Champions"
        }

        if gameKind == .kGameCreatureHavoc {
            self.player!.potion = kPotionNone
            self.player!.provisions = 0
            self.player!.gold = 0
            self.player!.gameName = "Creature of Havoc"
        }

        if gameKind == .kGamePortPeril {
            self.player!.provisions = 10
            self.player!.gold = 0
            self.player!.drinks = 1
            self.player!.gameName = "Port of Peril"
        }

        // Sorcery! games - always the last two in the menu

        if gameKind == .kGameSorceryWizard {
            self.player!.skill = self.player!.skill - 2
            self.player!.potion = kPotionNone
            self.player!.gold = 20
            self.player!.provisions = 2
            self.player!.gameName = "Sorcery! Wizard"

        }

        if gameKind == .kGameSorceryFighter {
            self.player!.potion = kPotionNone
            self.player!.gold = 20
            self.player!.provisions = 2
            self.player!.gameName = "Sorcery! Fighter"
        }

        if self.player!.potion == kPotionNone { self.player!.drinks = 0 }

        // Initialise the backpack
        if self.player!.pack.count > 0 { self.player!.pack.removeAll() }

        // Only House of Hell starts you out with no kit
        if gameKind != .kGameHouseHell && gameKind != .kGameCreatureHavoc {
			// Add items to the pack as dictionaries with the keys 'name' and 'icon'
			// 'name' is the item as a string, 'icon' is the index of its icon in
			// the 'icons' array of images. The index is stored here as an NSNumber
			var dict: [String:Any] = [ "name" : "Sword", "icon" : NSNumber.init(value: 1) ]
            self.player!.pack.append(dict)
            dict = [ "name" : "Leather armour", "icon" : NSNumber.init(value: 2) ]
            self.player!.pack.append(dict)

            if gameKind != .kGameCavernsSnow {
                dict = [ "name" : "Lantern", "icon" : NSNumber.init(value: 0) ]
                self.player!.pack.append(dict)
            }
        }

        // Set the Stats View image
        setStatsViewImage(gameKind)

        // Set the Game menu
        setGameMenu(gameKind)

        // Update the UI with the new stats
        updateStats()

        // Update the window with the game name
        self.window.title = self.player!.gameName

        // Set the bookmark state
        self.bookmark.isHidden = true
        self.bookmarkButtonButton.bookmarkState = false

        // Close the sheet
        self.window.endSheet(self.createSheet)

        // Pop up game-specific info
        showExtraInfo(gameKind)
    }

    func showExtraInfo(_ gameType: FFGameType) {

        // Present alerts containing useful info for specific game types,
        // immediately before play actually begins
        if gameType == .kGamePortPeril {
            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Use the Game menu to gain Yaztromo’s aid when instructed in the game book."
            alert.beginSheetModal(for: self.window, completionHandler: nil)
        }

        if gameType == .kGameCavernsSnow || gameType == .kGameTempleTerror {
            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Use the Game menu for certain monsters’ extra attacks when instructed in the game book."
            alert.beginSheetModal(for: self.window, completionHandler: nil)
        }

        if gameType == .kGameTempleTerror || gameType == .kGameCitadel {
            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Don’t forget to selet your magic spells in the Magic tab."
            alert.beginSheetModal(for: self.window, completionHandler: nil)
        }

        if gameType == .kGameHouseHell {
            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Don’t forget you start the game with reduced Skill — take care!"
            alert.beginSheetModal(for: self.window, completionHandler: nil)
        }

        if gameType == .kGameSorceryWizard || gameType == .kGameSorceryFighter {
            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Use the Game menu to ask Libra to revitalise you once during each book in the Sorcery! series."
            alert.beginSheetModal(for: self.window, completionHandler: nil)
        }
    }

    func setStatsViewImage(_ gameType: FFGameType) {

        let image: NSImageView

        // Remove any previously placed images from the Stats tab
        if self.statsTabImage != nil {
            self.statsTabImage!.removeFromSuperview()
            self.statsTabImage = nil
        }

        // Add game-specific image
        if gameType == .kGameCitadel {
            // Place an image in the gap to the right of the stats panel
            image = NSImageView.init(frame: NSMakeRect(citadelBox.frame.origin.x + 160, citadelBox.frame.origin.y, 258, 140))
            image.image = NSImage.init(named: NSImage.Name("coc"))
        } else if gameType == .kGameHouseHell {
            // Place an image in the gap to the left of the stats panel
            image = NSImageView.init(frame: NSMakeRect(6, hellBox.frame.origin.y, 262, 136))
            image.image = NSImage.init(named: NSImage.Name("hoh"))
        } else {
            let roll: Int = Int(arc4random_uniform(3))
            switch roll {
            case 0:
                image = NSImageView.init(frame: NSMakeRect(6, 54, 422, 88))
                image.image = NSImage.init(named: NSImage.Name("scroll"))
            case 1:
                image = NSImageView.init(frame: NSMakeRect(57, 6, 320, 168))
                image.image = NSImage.init(named: NSImage.Name("banner"))
            default:
                image = NSImageView.init(frame: NSMakeRect(6, 15, 422, 147))
                image.image = NSImage.init(named: NSImage.Name("mace"))
            }
        }

        self.statsTabView.addSubview(image)
        self.statsTabImage = image

        // Do the combat tab image while here
        let roll: Int = Int(arc4random_uniform(2))
        switch roll {
        case 0:
            self.swordImage.image = NSImage.init(named: NSImage.Name("sword"))
        case 1:
            self.swordImage.image = NSImage.init(named: NSImage.Name("sword2"))
        default:
            self.swordImage.image = NSImage.init(named: NSImage.Name("sword3"))
        }

    }

    // MARK: - Start Sheet Functions

    @IBAction func startGame(_ sender: Any) {

        self.window.endSheet(self.startSheet)

        let asender = sender as! NSButton

        if asender == self.startNewButton {
            newPlayer(self)
        }

        if asender == self.startLoadButton {
            openCharacter(self)
        }
    }

    func showStartSheet() {

        self.startSheet.backgroundColor = NSColor.init(deviceWhite: 0.0, alpha: 0.9)
        self.startSheet.alphaValue = 1.0
        self.startSheet.isOpaque = true
        self.startSheet.hasShadow = false

        self.window.beginSheet(self.startSheet, completionHandler: nil)
    }

    @IBAction func cancelStartSheet(_ sender: Any) {

        self.window.endSheet(self.startSheet)
    }

    // MARK: - About Sheet Functions

    @IBAction func showAbout(_ sender: Any) {

        // Write in the version number into the About panel
        self.aboutVersonLabel.stringValue = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String) + " (" + (Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String) + ")"

        // Attach the sheet to the main window - or, if the main window already
        // has a sheet, attach it to that sheet
        if self.window.sheets.count > 0 {
            let sheet = self.window.sheets[0]
            sheet.beginSheet(self.aboutSheet, completionHandler: nil)
        } else {
            self.window.beginSheet(self.aboutSheet, completionHandler:nil)
        }
    }

    @IBAction func closeAbout(_ sender: Any) {

        // Check whether the About sheet is attached to the window
        // or another sheet, eg. New Character
        if self.window.sheets.count > 0 {
            let sheet = self.window.sheets[0]
            if sheet != self.aboutSheet {
                sheet.endSheet(self.aboutSheet)
                return
            }
        }

        self.window.endSheet(self.aboutSheet)
    }


    // MARK: - Help Sheet Functions

    @IBAction func showHelp(_ sender: Any) {

        // Read in the helptext.txt file and drop it into the Help panel's NSTextView
        if let helpTextPath = Bundle.main.path(forResource: "helptext", ofType: "txt") {
            do {
                let helpText = try String.init(contentsOfFile: helpTextPath, encoding: String.Encoding.utf8)
                self.helpTextView.isEditable = true
                self.helpTextView.insertText(helpText, replacementRange: NSMakeRange(0, self.helpTextView.string.count))
                self.helpTextView.scrollToBeginningOfDocument(self)
                self.helpTextView.isEditable = false

                // Attach the sheet to the main window - or, if the main window already
                // has a sheet, attach it to that sheet
                if self.window.sheets.count > 0 {
                    let sheet = self.window.sheets[0]
                    sheet.beginSheet(self.helpWindow, completionHandler: nil)
                } else {
                    self.window.beginSheet(self.helpWindow, completionHandler: nil)
                }
            } catch  {
                // NOP
            }
        }
    }

    @IBAction func closeHelp(_ sender: Any) {

        // Check whether the Help sheet is attached to the window
        // or another sheet, eg. New Characterif window.sheets.count > 0 {
        if self.window.sheets.count > 0 {
            let sheet = self.window.sheets[0]
            if sheet != self.helpWindow {
                sheet.endSheet(self.helpWindow)
                return
            }
        }

        self.window.endSheet(self.helpWindow)
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
                if self.gameInProgress && self.player != nil {
                    if self.player!.isDead { return }

                    // Update the readouts before viewing the tab
                    self.combatReadoutOne.stringValue = ""
                    self.combatReadoutTwo.stringValue = ""
                    self.combatReadoutThree.stringValue = "Your Stamina is \(self.player!.stamina). Your Luck is \(self.player!.luck)"
                }
            }
        }
    }

    // MARK: - NSTextDelegate Functions

    func textDidChange(_ notification: Notification) {

        if self.gameInProgress { self.needToSave = true }
    }

    // MARK: - Game-specific Functions

    func setGameMenu(_ gameType: FFGameType) {

        if (gameType == .kGamePortPeril) { setPortPerilGameMenu() }
        if (gameType == .kGameCavernsSnow) { setCavernsGameMenu() }
        if (gameType == .kGameTempleTerror) { setTempleGameMenu() }
    }

    // MARK: Port of Peril

    @objc @IBAction func yazMagic(_ sender: Any) {

        // Only show the Yaztromo aid window if the player is playing Port of Peril
        if let zplayer = self.player {
            if zplayer.gameType == .kGamePortPeril {
                self.window.beginSheet(self.yazWindow, completionHandler:nil)
            }
        }
    }

    @IBAction func cancelYazWindow(_ sender: Any) {

        self.window.endSheet(self.yazWindow)
    }

    @IBAction func applyYazMagic(_ sender: Any) {

        // Enact the improvements made by Yaztromo's magic
        let row = self.yazMatrix.selectedRow

        if let zplayer = self.player {
            if row == 0 {
                zplayer.skill = 12
                zplayer.initialSkill = 12
            } else if row == 1 {
                zplayer.stamina = zplayer.stamina + 10
                if zplayer.initialStamina < zplayer.stamina {
                    zplayer.initialStamina = zplayer.stamina
                }
            } else {
                zplayer.luck = 12
                zplayer.initialLuck = 12
            }
        }

        self.needToSave = true
        updateStats()
        self.window.endSheet(self.yazWindow)
    }

    func setPortPerilGameMenu() {

        // Set up the Game Menu for Port of Peril
        if let gmm = self.gameMenu.submenu {
            if (gmm.items.count > 0) { gmm.removeAllItems() }
            gmm.addItem(withTitle: "Take Yaztromo's Aid...", action: #selector(yazMagic), keyEquivalent: "y")
            let ym: NSMenuItem? = gmm.item(at: 0)
            if ym != nil { ym!.isEnabled = true }
        }

        self.gameMenu.isEnabled = true
        self.gameMenu.isHidden = false
        self.gameMenu.title = "Port of Peril"
    }

    // MARK: Caverns of the Snow Witch

    func setCavernsGameMenu() {

        // Set up the Game Menu for Caverns of the Snow Witch

        // Set up the Game Menu
        if let gmm = self.gameMenu.submenu {
            if (gmm.items.count > 0) { gmm.removeAllItems() }
            gmm.addItem(withTitle: "White Dragon Extra Attack", action: #selector(dragonExtraAttack), keyEquivalent: "")
            gmm.addItem(withTitle: "Ice Demon Extra Attack", action: #selector(demonExtraAttack), keyEquivalent: "")
            let ym: NSMenuItem? = gmm.item(at: 0)
            if ym != nil { ym!.isEnabled = true }
        }

        self.gameMenu.isEnabled = true
        self.gameMenu.isHidden = false
        self.gameMenu.title = "Caverns of the Snow Witch"
    }

    @objc func dragonExtraAttack() {

        // White dragon does +2 damage on roll of 1-2
        if !self.gameInProgress { return }

        let roll: Int = Int(arc4random_uniform(6)) + 1

        if roll < 3 {
            if self.player != nil {
                self.player!.stamina = self.player!.stamina - 2
                if self.player!.stamina < 0 { self.player!.stamina = 0 }
                showExtraAttackResult("White Dragon", 2)
            }
        } else {
            showExtraAttackResult("White Dragon", 0)
        }
    }

    @objc func demonExtraAttack() {

        // Ice Demon does +1 damage on roll of 1-3
        if !self.gameInProgress { return }

        let roll: Int = Int(arc4random_uniform(6)) + 1

        if roll < 4 {
            if self.player != nil {
                self.player!.stamina = self.player!.stamina - 1
                if self.player!.stamina < 0 { self.player!.stamina = 0 }
                showExtraAttackResult("White Dragon", 1)
            }
        } else {
            showExtraAttackResult("White Dragon", 0)
        }
    }

    func showExtraAttackResult(_ beast: String, _ damage: Int) {

        let alert: NSAlert = NSAlert.init()
        alert.messageText = "The \(beast) attempts an extra strike... " + (damage > 0 ? "Doing \(damage) damage!" : "But misses you!")

        alert.beginSheetModal(for: self.window, completionHandler: { (modalResponse) in

            self.combatReadoutThree.stringValue = "Your Stamina is \(self.player!.stamina). Your Luck is \(self.player!.luck)"
            self.updateStats()
        })
    }

    // MARK: Temple of Terror

    func setTempleGameMenu() {

        // Set up the Game Menu for Temple of Terror

        if let gmm = self.gameMenu.submenu {
            if (gmm.items.count > 0) { gmm.removeAllItems() }
            gmm.addItem(withTitle: "Firefly Extra Attack", action: #selector(fireflyExtraAttack), keyEquivalent: "")
            let ym: NSMenuItem? = gmm.item(at: 0)
            if ym != nil { ym!.isEnabled = true }
        }

        self.gameMenu.isEnabled = true
        self.gameMenu.isHidden = false
        self.gameMenu.title = "Temple of Terror"
    }

    @objc func fireflyExtraAttack() {

        // Fireflies do +2 damage on roll of 1-3
        if !self.gameInProgress { return }

        let roll: Int = Int(arc4random_uniform(6)) + 1

        if roll < 4 {
            if self.player != nil {
                self.player!.stamina = self.player!.stamina - 2
                if self.player!.stamina < 0 { self.player!.stamina = 0 }
                showExtraAttackResult("Firefly", 2)
            }
        } else {
            showExtraAttackResult("Firefly", 0)
        }
    }

    // MARK: Sorcery!

    func setSorceryGameMenu() {

        // Set up the Game Menu for Sorcery!

        if let gmm = self.gameMenu.submenu {
            if (gmm.items.count > 0) { gmm.removeAllItems() }
            gmm.addItem(withTitle: "Ask Libra to Revitalise You", action: #selector(libraRestore), keyEquivalent: "")
            let ym: NSMenuItem? = gmm.item(at: 0)
            if ym != nil { ym!.isEnabled = true }
        }

        self.gameMenu.isEnabled = true
        self.gameMenu.isHidden = false
        self.gameMenu.title = "Sorcery!"
    }

    @objc func libraRestore() {

        if let zplayer = player {
            zplayer.skill = zplayer.initialSkill
            zplayer.stamina = zplayer.initialStamina
            zplayer.luck = zplayer.initialLuck

            let alert: NSAlert = NSAlert.init()
            alert.messageText = "Libra restores your health and fortune!"
            alert.informativeText = "Your Skill, Stamina and Luck scores have been restored to their initial values."

            alert.beginSheetModal(for: self.window, completionHandler: { (modalResponse) in

                self.combatReadoutThree.stringValue = "Your Stamina is \(self.player!.stamina). Your Luck is \(self.player!.luck)"
                self.updateStats()
            })
        }
    }

    @IBAction func showstats(_ sender: Any) {

        self.tv.selectTabViewItem(at: 0)
    }

    @IBAction func showCombat(_ sender: Any) {

        self.tv.selectTabViewItem(at: 1)
    }

}


