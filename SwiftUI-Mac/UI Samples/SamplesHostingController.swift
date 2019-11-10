//
//  SamplesHostingController.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 7/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import SwiftUI

class SamplesHostingController: NSHostingController<SamplesView> {
    @objc required dynamic init?(coder: NSCoder) {
        super.init(coder: coder, rootView: SamplesView())
    }
}
