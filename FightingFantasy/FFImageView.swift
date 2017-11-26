
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2017 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016 Steve Jackson and Ian Livingstone


import Cocoa

class FFImageView: NSImageView {

    override func mouseUp(with event: NSEvent) {

        let clickCount = event.clickCount
        if clickCount == 2 {
            self.alphaValue = self.alphaValue == 0.0 ? 1.0 : 00
        }
    }
    
}
