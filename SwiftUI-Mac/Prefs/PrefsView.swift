//
//  PrefsView.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 10/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import SwiftUI

struct PrefsView: View {
    @ObservedObject var prefs: Prefs
    @State var prefsWindowDelegate = PrefsWindowDelegate()
    
    var body: some View {
        VStack {
            Toggle(isOn: $prefs.showCopyright) {
                Text("Show Copyright Notice")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var window: NSWindow!
    init(prefs: Prefs) {
        self.prefs = prefs
        
        window = NSWindow.createStandardWindow(withTitle: "Preferences",
                                               width: 300,
                                               height: 100)
        window.contentView = NSHostingView(rootView: self)
        window.delegate = prefsWindowDelegate
        window.tabbingMode = .disallowed
        prefsWindowDelegate.windowIsOpen = true
        window.makeKeyAndOrderFront(nil)
    }
    
    class PrefsWindowDelegate: NSObject, NSWindowDelegate {
        var windowIsOpen = false
        
        func windowWillClose(_ notification: Notification) {
            windowIsOpen = false
        }
    }
}

struct PrefsView_Previews: PreviewProvider {
    static var previews: some View {
        PrefsView(prefs: Prefs())
    }
}
