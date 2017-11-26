
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2017 Tony Smith. All rights reserved.
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

        tooltips.append("Lantern")
        tooltips.append("Sword")
        tooltips.append("Leather Armour")
        tooltips.append("Rope")
        tooltips.append("Stick")
        tooltips.append("Skull")
        tooltips.append("Monster Tooth")
        tooltips.append("Caveman Necklace")
        tooltips.append("Net")
        tooltips.append("Whip")
        tooltips.append("Axe")
        tooltips.append("Bow")
        tooltips.append("Arrows")
        tooltips.append("Hammer")
        tooltips.append("Dagger")
        tooltips.append("Mace")
        tooltips.append("Spear")
        tooltips.append("Slingshot")
        tooltips.append("Shield")
        tooltips.append("Helm")
        tooltips.append("Chainail Armour")
        tooltips.append("Boots")
        tooltips.append("Candle")
        tooltips.append("Horn")
        tooltips.append("Sack")
        tooltips.append("Bell")
        tooltips.append("Mirror")
        tooltips.append("Magnifying Glass")
        tooltips.append("Scroll")
        tooltips.append("Book of Spells")
        tooltips.append("Wizard's Staff")
        tooltips.append("Magic Potion")
        tooltips.append("Herbal Mixture")
        tooltips.append("Capsules")
        tooltips.append("Flute")
        tooltips.append("Whistle")
        tooltips.append("Eyeball")
        tooltips.append("Hand")
        tooltips.append("Golden Chalice")
        tooltips.append("Rare Gem")
        tooltips.append("Ring of Power")
        tooltips.append("Regal Crown")
        tooltips.append("Hoard of Coins")
        tooltips.append("Key")
        tooltips.append("Eldritch Pendant")
        tooltips.append("Chest")
        tooltips.append("Amulet")
        tooltips.append("Orb of Seeing")
        tooltips.append("Precious Bracelet")
        tooltips.append("Stone")
        tooltips.append("Grog Bottle")
        tooltips.append("Meat")
        tooltips.append("Tankard of Ale")
        tooltips.append("Fruit")
        tooltips.append("Mushroom")
        tooltips.append("Salt")
        tooltips.append("Revolver")
        tooltips.append("Torch")
        tooltips.append("Cardboard Box")
        tooltips.append("Bucket")
        tooltips.append("Flask of Fluid")
        tooltips.append("Ceremonial Robe")
        tooltips.append("Rubber Duck")
        tooltips.append("Other")
    }

    func configureCollectionView() {

        // Configure the collection view's flow layout manager
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 32.0, height: 32.0)
        flowLayout.sectionInset = NSEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
        flowLayout.minimumInteritemSpacing = 2.0
        flowLayout.minimumLineSpacing = 2.0
        collectionView.collectionViewLayout = flowLayout
        collectionView.layer?.backgroundColor = NSColor.white.cgColor
        view.wantsLayer = true
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {

        // Just return the number of icons we have
        return icons.count
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {

        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "FFCollectionViewItem"), for: indexPath)
        guard let collectionViewItem = item as? FFCollectionViewItem else { return item }
        collectionViewItem.image = icons.object(at: count) as? NSImage
        collectionViewItem.index = count
        collectionViewItem.view.toolTip = tooltips[count]
        count = count + 1
        if count == icons.count { count = 0 }
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
                array.add(button)

                // Send the selected item to the buttons via a notifications
                let nc = NotificationCenter.default
                nc.post(name: NSNotification.Name(rawValue: "select.image") , object: array)
            }
        }
    }
}
