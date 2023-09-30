
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2023 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016 Steve Jackson and Ian Livingstone


import Cocoa

class FFBookmarkButton: NSButton {

    var bookmarkState: Bool = false
    var trackingArea: NSTrackingArea? = nil


    override func awakeFromNib() {

        // When the button is loaded from the nib, set its tracking area so that
        // mouse movements in and out of the button can be trapped and used to
        // modify the button image
        if let trackingArea = self.trackingArea {
            self.removeTrackingArea(trackingArea)
        }

        let options: NSTrackingArea.Options = [.mouseEnteredAndExited, .activeAlways]
        let trackingArea = NSTrackingArea(rect: self.bounds, 
                                          options: options,
                                          owner: self,
                                          userInfo: nil)
        self.addTrackingArea(trackingArea)
        self.trackingArea = trackingArea
    }

    override func mouseEntered(with event: NSEvent) {

        // Mouse moves over the button, so set the image to a + or a - depending on
        // whether the bookmark is showing (+ to show bookmark, - to hide it).
        // 'bookmarkState' says which is which: true for bookmark showing
        if !bookmarkState {
            self.image = NSImage.init(named: NSImage.Name("button_blue_on"))
        } else {
            self.image = NSImage.init(named: NSImage.Name("button_blue_off"))
        }

        super.mouseEntered(with: event)
    }

    override func mouseExited(with event: NSEvent) {

        // Mouse moves away from the button, so set the image to a plain circle
        self.image = NSImage.init(named: NSImage.Name("button_blue"))
        super.mouseExited(with: event)
    }

}
