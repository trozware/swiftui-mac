//
//  PrefsView.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 10/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import SwiftUI

struct PrefsView: View {
    var body: some View {
        VStack {
            Text("Hello, Prefs!")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var window: NSWindow!
    init() {
        window = NSWindow.createStandardWindow(withTitle: "Preferences",
                                               width: 480,
                                               height: 300)
        window.contentView = NSHostingView(rootView: self)
        window.makeKeyAndOrderFront(nil)
    }
    
    
}

struct PrefsView_Previews: PreviewProvider {
    static var previews: some View {
        PrefsView()
    }
}
