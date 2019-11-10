//
//  EmbeddedColorWell.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 10/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import SwiftUI

struct EmbeddedColorWell: NSViewRepresentable {
    @Binding var selectedColor: NSColor
    
    func makeNSView(context: Context) -> NSColorWell {
        NSColorWell(frame: .zero)
    }

    func updateNSView(_ nsView: NSColorWell, context: Context) {
        nsView.color = selectedColor
    }
}
