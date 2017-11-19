
//  FightingFantasy
//  Created by Tony Smith on 10/30/17.
//  Copyright © 2017 Tony Smith. All rights reserved.


import Cocoa

class FFBookmarkView: FFImageView {

    var place: Int = -1


    override func awakeFromNib() {

        place = -1
    }

    override func draw(_ dirtyRect: NSRect) {

        super.draw(dirtyRect)

        if place != -1 {
            var stringOrigin: NSPoint = NSMakePoint(0, 0)

            let stringAttributes: [NSAttributedStringKey : Any] = [
                NSAttributedStringKey.foregroundColor :  NSColor.init(white: 0.9, alpha: 0.9),
                NSAttributedStringKey.font: NSFont.init(name: "Helvetica Neue Bold", size: 20)! ]

            let lString = "\(place)" as NSString
            let stringSize = lString.size(withAttributes: stringAttributes)

            stringOrigin.x = self.bounds.origin.x + (self.bounds.size.width - stringSize.width)/2;
            stringOrigin.y = self.bounds.origin.y + 40 - (stringSize.height / 2);

            lString.draw(at: stringOrigin, withAttributes: stringAttributes)
        }
    }

    
    
}
