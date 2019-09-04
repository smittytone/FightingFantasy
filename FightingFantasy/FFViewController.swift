
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2017-18 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016 Steve Jackson and Ian Livingstone


import Cocoa

class FFViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate {

    @IBOutlet weak var collectionView: NSCollectionView!

    var icons: NSMutableArray = NSMutableArray.init()
    var tooltips: [String] = []
    var count: Int = 0
    var button: FFIconButton = FFIconButton()
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // Configure the collection view
        configureCollectionView()

        self.tooltips.append("Lantern")
        self.tooltips.append("Sword")
        self.tooltips.append("Leather Armour")
        self.tooltips.append("Rope")
        self.tooltips.append("Stick")
        self.tooltips.append("Skull")
        self.tooltips.append("Monster Tooth")
        self.tooltips.append("Caveman Necklace")
        self.tooltips.append("Net")
        self.tooltips.append("Whip")
        self.tooltips.append("Axe")
        self.tooltips.append("Bow")
        self.tooltips.append("Arrows")
        self.tooltips.append("Hammer")
        self.tooltips.append("Dagger")
        self.tooltips.append("Mace")
        self.tooltips.append("Spear")
        self.tooltips.append("Slingshot")
        self.tooltips.append("Shield")
        self.tooltips.append("Helm")
        self.tooltips.append("Chainail Armour")
        self.tooltips.append("Boots")
        self.tooltips.append("Candle")
        self.tooltips.append("Horn")
        self.tooltips.append("Sack")
        self.tooltips.append("Bell")
        self.tooltips.append("Mirror")
        self.tooltips.append("Magnifying Glass")
        self.tooltips.append("Scroll")
        self.tooltips.append("Book of Spells")
        self.tooltips.append("Wizard's Staff")
        self.tooltips.append("Magic Potion")
        self.tooltips.append("Herbal Mixture")
        self.tooltips.append("Capsules")
        self.tooltips.append("Flute")
        self.tooltips.append("Whistle")
        self.tooltips.append("Eyeball")
        self.tooltips.append("Hand")
        self.tooltips.append("Golden Chalice")
        self.tooltips.append("Rare Gem")
        self.tooltips.append("Ring of Power")
        self.tooltips.append("Regal Crown")
        self.tooltips.append("Hoard of Coins")
        self.tooltips.append("Key")
        self.tooltips.append("Eldritch Pendant")
        self.tooltips.append("Chest")
        self.tooltips.append("Amulet")
        self.tooltips.append("Orb of Seeing")
        self.tooltips.append("Precious Bracelet")
        self.tooltips.append("Stone")
        self.tooltips.append("Grog Bottle")
        self.tooltips.append("Meat")
        self.tooltips.append("Tankard of Ale")
        self.tooltips.append("Fruit")
        self.tooltips.append("Mushroom")
        self.tooltips.append("Salt")
        self.tooltips.append("Revolver")
        self.tooltips.append("Torch")
        self.tooltips.append("Cardboard Box")
        self.tooltips.append("Bucket")
        self.tooltips.append("Flask of Fluid")
        self.tooltips.append("Ceremonial Robe")
        self.tooltips.append("Rubber Duck")
        self.tooltips.append("Other")
    }

    override func viewDidAppear() {

        super.viewDidAppear()

        // Clear the current selection and set it to the icon of
        // the button the user has clicked on
        self.collectionView.deselectAll(self)
        let set: Set<IndexPath> = [IndexPath.init(item: self.button.index, section: 0)]
        self.collectionView.selectItems(at: set,
                                        scrollPosition: NSCollectionView.ScrollPosition.top)
    }

    func configureCollectionView() {

        // Configure the collection view's flow layout manager
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 32.0,
                                     height: 32.0)
        flowLayout.sectionInset = NSEdgeInsets(top: 2.0,
                                               left: 2.0,
                                               bottom: 2.0,
                                               right: 2.0)
        flowLayout.minimumInteritemSpacing = 2.0
        flowLayout.minimumLineSpacing = 2.0
        
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.layer?.backgroundColor = NSColor.textBackgroundColor.cgColor
        self.collectionView.isSelectable = true
        self.collectionView.allowsEmptySelection = true
        view.wantsLayer = true
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {

        // Just return the number of icons we have
        return self.icons.count
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {

        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "FFCollectionViewItem"), for: indexPath)
        guard let collectionViewItem = item as? FFCollectionViewItem else { return item }
        collectionViewItem.image = self.icons.object(at: self.count) as? NSImage
        collectionViewItem.index = self.count
        collectionViewItem.view.toolTip = self.tooltips[self.count]
        self.count += 1
        if self.count == self.icons.count { self.count = 0 }
        return item
    }

    func numberOfSections(in collectionView: NSCollectionView) -> Int {

        return 1
    }

    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {

        for index in indexPaths {
            let obj = collectionView.item(at: index)
            if obj != nil {
                // Create an array instance to hold the data we need to send
                let array: NSMutableArray = NSMutableArray.init()
                let item = obj as! FFCollectionViewItem
                array.add(item)
                array.add(self.button)

                // Send the selected item to the buttons via a notifications
                let nc = NotificationCenter.default
                nc.post(name: NSNotification.Name(rawValue: "select.image") , object: array)
            }
        }
    }
}
