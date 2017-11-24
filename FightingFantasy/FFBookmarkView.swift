
//  FightingFantasy
//  Created by Tony Smith on 10/30/17.
//  Copyright © 2017 Tony Smith. All rights reserved.


import Cocoa

class FFBookmarkView: NSImageView {

    // The 'place' property is a gamebook paragraph set by the player
    var place: Int = -1


    override func awakeFromNib() {

        place = -1
    }

    override func draw(_ dirtyRect: NSRect) {

        super.draw(dirtyRect)

        if place != -1 {
            // A bookmark has been set and passed to the view via the 'place' property
            // NOTE A value of -1 indicates no bookmark has been set
            var stringOrigin: NSPoint = NSMakePoint(0, 0)

            // Set up an attributed string that's grey text, Bold and 20pt
            let stringAttributes: [NSAttributedStringKey : Any] = [
                NSAttributedStringKey.foregroundColor :  NSColor.init(white: 0.9, alpha: 0.9),
                NSAttributedStringKey.font: NSFont.init(name: "Apple Chancery", size: 20)! ]

            // Convert the value of place to an attrributed string
            let lString = "\(place)" as NSString
            let stringSize = lString.size(withAttributes: stringAttributes)

            // Draw the string over the background ribbon image
            stringOrigin.x = self.bounds.origin.x + (self.bounds.size.width - stringSize.width)/2;
            stringOrigin.y = self.bounds.origin.y + 40 - (stringSize.height / 2);
            lString.draw(at: stringOrigin, withAttributes: stringAttributes)
        }
    }

}
