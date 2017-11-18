
//  FightingFantasy
//  Created by Tony Smith on 10/30/17.
//  Copyright © 2017 Tony Smith. All rights reserved.


import Cocoa

class FFImageView: NSImageView {

    override func mouseUp(with event: NSEvent) {

        let clickCount = event.clickCount
        if clickCount == 2 {
            self.alphaValue = self.alphaValue == 0.0 ? 1.0 : 00
        }
    }
    
}
