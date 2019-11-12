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
        window.makeKeyAndOrderFront(nil)
    }
    
}

struct PrefsView_Previews: PreviewProvider {
    static var previews: some View {
        PrefsView(prefs: Prefs())
    }
}
