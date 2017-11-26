
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2017 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016 Steve Jackson and Ian Livingstone


import Cocoa

class FFCollectionViewItem: NSCollectionViewItem {

    var index: Int = -1
    var image: NSImage? {
        didSet {
            guard isViewLoaded else { return }

            if let image = image {
                imageView?.image = image
            } else {
                imageView?.image = nil
            }
        }
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.white.cgColor
        view.layer?.borderColor = NSColor.init(red: 0.6, green: 0.1, blue: 0.0, alpha: 1.0).cgColor
        view.layer?.borderWidth = 0.0
    }

    override var isSelected: Bool {

        didSet {
            view.layer?.borderWidth = isSelected ? 2.0 : 0.0
        }
    }
    
}
