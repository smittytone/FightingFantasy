
//  FightingFantasy
//  Created by Tony Smith on 29/10/2017.
//  Copyright © 2017 Tony Smith. All rights reserved.


import Cocoa

class FFViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate {

    @IBOutlet weak var collectionView: NSCollectionView!

    var icons: [NSImage] = []
    var tooltips: [String] = []
    var count: Int = 0

    override func viewDidLoad() {

        super.viewDidLoad()

        // Configure the collection view
        configureCollectionView()

        // Load in the icon icons
        var image: NSImage? = NSImage.init(named: NSImage.Name("icon_lantern"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_sword"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_armour"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_rope"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_stick"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_skull"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_tooth"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_axe"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_bow"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_quiver"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_dagger"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_spear"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_shield"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_helm"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_chainmail"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_scroll"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_book"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_chalice"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_gem"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_ring"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_crown"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_coins"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_bottle"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_food"))
        icons.append(image!)
        image = NSImage.init(named: NSImage.Name("icon_tankard"))
        icons.append(image!)

        tooltips.append("Lantern")
        tooltips.append("Sword")
        tooltips.append("Leather Armour")
        tooltips.append("Rope")
        tooltips.append("Stick")
        tooltips.append("Skull")
        tooltips.append("Tooth")
        tooltips.append("Axe")
        tooltips.append("Bow")
        tooltips.append("Arrows")
        tooltips.append("Dagger")
        tooltips.append("Spear")
        tooltips.append("Shield")
        tooltips.append("Helm")
        tooltips.append("Chainail Armour")
        tooltips.append("Scroll")
        tooltips.append("Book of Spells")
        tooltips.append("Golden Chalice")
        tooltips.append("Rare Gem")
        tooltips.append("Ring of Power")
        tooltips.append("Regal Crown")
        tooltips.append("Hoard of Coins")
        tooltips.append("Grog Bottle")
        tooltips.append("Meat")
        tooltips.append("Tankard of Ale")
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
        collectionViewItem.image = icons[count]
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
                let item = obj as! FFCollectionViewItem
                let nc = NotificationCenter.default
                nc.post(name: NSNotification.Name(rawValue: "select.image") , object: item)
            }
        }
    }
}
