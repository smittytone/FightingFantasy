
//  FightingFantasy
//  Created by Tony Smith on 02/11/2017.
//  Software © 2017-19 Tony Smith. All rights reserved.
//  Software ONLY issued under MIT Licence
//  Fighting Fantasy © 2016-19 Steve Jackson and Ian Livingstone


import Cocoa

class FFTextFieldFormatter: NumberFormatter {

    override func isPartialStringValid(_ partialString: String, newEditingString newString:

        AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {

            if partialString.isEmpty { return true }

            return Int(partialString) != nil
        }
}
