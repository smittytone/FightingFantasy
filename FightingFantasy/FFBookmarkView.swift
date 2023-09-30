
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2023 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016 Steve Jackson and Ian Livingstone


import Cocoa

class FFBookmarkView: NSImageView {

    // The 'place' property is a gamebook paragraph set by the player
    var place: Int = -1


    override func awakeFromNib() {

        self.place = -1
    }

    override func draw(_ dirtyRect: NSRect) {

        super.draw(dirtyRect)

        if self.place != -1 {
            // A bookmark has been set and passed to the view via the 'place' property
            // NOTE A value of -1 indicates no bookmark has been set
            var stringOrigin: NSPoint = NSMakePoint(0, 0)

            // Set up an attributed string that's grey text, Bold and 20pt
            let stringAttributes: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.foregroundColor :  NSColor.labelColor,
                NSAttributedString.Key.font: NSFont.init(name: "Apple Chancery", size: 20)! ]

            // Convert the value of place to an attrributed string
            let lString = "\(self.place)" as NSString
            let stringSize = lString.size(withAttributes: stringAttributes)

            // Draw the string over the background ribbon image
            stringOrigin.x = self.bounds.origin.x + (self.bounds.size.width - stringSize.width)/2;
            stringOrigin.y = self.bounds.origin.y + 40 - (stringSize.height / 2);
            lString.draw(at: stringOrigin, withAttributes: stringAttributes)
        }
    }

}
