//
//  EmbeddedColorWell.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 10/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import SwiftUI
import Combine

struct EmbeddedColorWell: NSViewRepresentable {
    @Binding var selectedColor: NSColor
    
    class Coordinator: NSObject {
        var embedded: EmbeddedColorWell
        var subscription: AnyCancellable?

        init(_ embedded: EmbeddedColorWell) {
            self.embedded = embedded
        }
        
        // Observe KVO compliant color property on NSColorWell object.
        // Update the selectedColor property on EmbeddedColorWell as needed.
        // - Parameter colorWell: The NSColorWell view.
        
        func changeColor(colorWell: NSColorWell) {
            subscription = colorWell
                .publisher(for: \.color, options: .new)
                .sink { color in
                    DispatchQueue.main.async {
                        self.embedded.selectedColor = color
                    }
            }
        }
    }
    
    func makeCoordinator() -> EmbeddedColorWell.Coordinator {
        Coordinator(self)
    }
    
    func makeNSView(context: Context) -> NSColorWell {
        let colorWell = NSColorWell(frame: .zero)
        context.coordinator.changeColor(colorWell: colorWell)
        return colorWell
    }
    
    func updateNSView(_ nsView: NSColorWell, context: Context) {
        nsView.color = selectedColor
    }
}
