
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2017 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016 Steve Jackson and Ian Livingstone


import Cocoa

class FFIconButton: NSButton {

    // Class properties
    // 'index' is the index of the button's icon within the 'icons' array
    // 'icons' is an array of NSImages for the backpack item icons
    // NOTE We use NSMutableArray so we can set the value of 'icons' as a reference
    var index: Int = 1
    var icons: NSMutableArray = NSMutableArray.init()


    override func awakeFromNib() {

        // Set up notifications
        // 'select.image' is sent by the popover controller (FFViewController) when an icon is selected
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(setButton), name: NSNotification.Name(rawValue: "select.image"), object: nil)
    }

    @objc func setButton(_ note: Notification) {

        // When we receive a notification from the popover controller that an icon has been selected,
        // we come here and set the button's image to that icon
        let obj = note.object
        if obj != nil {
            // Decode the notifiction object
            let array = obj as! NSMutableArray
            let sender = array.object(at: 1) as! FFIconButton

            // Only change the icon of the button that was actually clicked on
            if sender == self {
                let item = array.object(at: 0) as! FFCollectionViewItem
                if let image = icons.object(at: item.index) as? NSImage { self.image = image }
                self.index = item.index

                // Add the index of the image in 'icons' back to the array
                array.add(NSNumber.init(value: item.index))

                // Send the array on to the App Delegate so that the pack item's icon record can
                // also be changed (see AppDelegate.updatePack() )
                let nc = NotificationCenter.default
                nc.post(name: NSNotification.Name(rawValue: "set.pack.item.index") , object: array)
            }
        }
    }

}
