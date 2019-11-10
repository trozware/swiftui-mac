//
//  SamplesView.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 7/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import SwiftUI

struct SamplesView: View {
    @ObservedObject var prefs: Prefs
    @Binding var isVisible: Bool
    
    var body: some View {
        VStack {
            Text("Samples go here...")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
     }
}

struct PrefsView_Previews: PreviewProvider {
    static var previews: some View {
        SamplesView(prefs: Prefs(), isVisible: .constant(true))
    }
}
