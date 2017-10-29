
//  FightingFantasy
//  Created by Tony Smith on 29/10/2017.
//  Copyright © 2017 Tony Smith. All rights reserved.
//

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
        view.layer?.borderColor = NSColor.blue.cgColor
        view.layer?.borderWidth = 0.0
    }

    override var isSelected: Bool {

        didSet {
            view.layer?.borderWidth = isSelected ? 5.0 : 0.0
        }
    }
    
}
