# FightingFantasy

A Fighting Fantasy gamebook play manager written in Swift.

### What? ###

This is a Swift 4 port (for macOS) of a much older Objective-C version written circa 2003 following the 20th anniversary of the publication of Penguin Books' Fighting Fantasy gamebook series and the revival of the books by Icon Books. The concept of a program to help players with their games &mdash; setting up characters, handling combat, managing their backpack contents, testing for Luck, etc. &mdash; goes back to a mid- to late 1990s Real Basic classic Mac OS version which, in turn, was a redevelopment of an original implementation for the [Dragon 32](https://blog.smittytone.net/2013/04/21/rip-dragon-32-1982-2013-my-first-8-bit-colour-microcomputer/) written around 1985, while the gamebooks were still being published by Penguin's Puffin imprint.

Coding up the Swift version was solely about me learning Swift, and the recent, third revival of the gamebooks &mdash; this time by Scholastic &mdash; is entirely coincidental &mdash; but certainly not unwelcome. There's even a new one out, [*Port of Peril*](https://www.amazon.co.uk/Fighting-Fantasy-Peril-Ian-Livingstone/dp/1407181297/). I'll support it in the game manager if it makes use of new rules or features.

<p align="center"><img src="https://smittytone.net/images/fightingfantasy/stats.webp" width="400" style="border: 1px solid #555555">&nbsp;&nbsp;<img src="https://smittytone.net/images/fightingfantasy/combat.webp" width="400" style="border: 1px solid #555555"><br>&nbsp;</p>

Incidentally, not all of the gamebooks *are* supported, I'm afraid, only those I have played or plan to. So if you have a favourite that's not included, consider it a tutorial exercise: an opportunity to expand on the code included in this repo.

You can find out more about the gamebooks at [FightingFantasy.com](http://www.fightingfantasy.com/).

Fighting Fantasy is &copy; 2016, Steve Jackson and Ian Livingstone, and reference to it here and in the code is on a notionally fair-use basis. Although my version includes imagery from the books, it is not included in this archive. Quite apart from any legal reasons, I owe it to Jackson, Livingstone and all the artists whose work gave me so much pleasure in the mid-1980s and again in the 2000s and 2010s, not to treat their work as a commodity to be downloaded. And as a published Fighting Fantasy writer...

<p align="center"><img src="https://smittytone.net/images/fightingfantasy/warlock.webp" width="800"></p>

### Why? ###

As I say, the Swift version was written to help me learn Swift. It's quite good for this task because the application makes use of many macOS interface elements and their source objects &mdash; NSWindow, NSButton, NSTextField, NSImageView, NSImage, NSAttributedString, NSColor, NSViewController, NSCollectionView, NSCollectionViewItem, NSPopover, NSPopUpButton, NSStepper, NSTabView, NSTextView, etc. &mdash; plus saving and loading files, dealing with the application lifecycle, presenting and dismissing modal sheets, and more. This is primarily why I've shared the code: I hope it'll be used by other programmers taking their first steps with Swift.

<p align="center"><img src="https://smittytone.net/images/fightingfantasy/tests.webp" width="400" style="border: 1px solid #555555">&nbsp;&nbsp;<img src="https://smittytone.net/images/fightingfantasy/pack.webp" width="400" style="border: 1px solid #555555"><br>&nbsp;</p>

The previous version was quite naïve; this is slightly better and introduces a couple of UI improvements, in particular icons for backpack items and a pop-up panel from which icons can be selected, because I wanted to figure out how to do this. Hopefully, it will help others understand how Swift can be applied to their own macOS (and iOS/tvOS) projects too.

Tony Smith,<br />@smittytone

### Ownership ###

From version 3.1.0, I have included in the repo the graphical assets used by the code. I did not do so in the past becase this would be a violation of other content owners’ copyrights. However, as the code is free, and I would like to encourage its use, I have decided to release the assests in any case.

The Fighting Fantasy name and logo are owned by Steve Jackson and Ian Livingstone. The images are owned by their respective artists: I have used material by Iain McCaig, Russ Nicholson and Tim Sell. The item icons were collated from numerous sources on the Internet more than a decade ago and were modified by me. I’m afraid I can no longer recall the sources. All other images are mine.

If you are a copyright holder and object to the use of your material in this free, open source software, please raise an issue to bring your concerns to my attention. Thank you.
