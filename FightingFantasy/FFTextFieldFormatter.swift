
//  FightingFantasy
//  Created by Tony Smith on 10/30/17.
//  Copyright © 2017 Tony Smith. All rights reserved.


import Cocoa

class FFTextFieldFormatter: NumberFormatter {

    override func isPartialStringValid(_ partialString: String, newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {

        if partialString.isEmpty { return true }

        return Int(partialString) != nil
    }
}
