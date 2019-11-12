//
//  Prefs.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 7/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import Foundation

class Prefs: ObservableObject {
    
    @Published var showCopyright: Bool = UserDefaults.standard.bool(forKey: "showCopyright") {
        didSet {
            UserDefaults.standard.set(self.showCopyright, forKey: "showCopyright")
        }
    }
    
}
