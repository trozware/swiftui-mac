//
//  PickerSamplesView.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 10/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import SwiftUI

struct PickerSamplesView: View {
    @State private var menuSelected = 0
    @State private var radioSelected = 0
    @State private var segmentSelected = 0
    
    var body: some View {
        VStack {
            Text("This picker uses the default style.")
                .modifier(ExplanatoryText())
            
            Picker(selection: $menuSelected, label: Text("Select an option:")) {
                Text("Option 1").tag(1)
                Text("Option 2").tag(2)
                Text("Option 3").tag(3)
                Text("Option 4").tag(4)
                Text("Option 5").tag(5)
            }
            .frame(width: 300)
            
            Divider().padding(.vertical)
            
            Text("This picker uses the RadioGroupPickerStyle.")
                .modifier(ExplanatoryText())
            
            GroupBox {
                Picker(selection: $radioSelected, label: Text("Place your vote:")) {
                    Text("Yes").tag(0)
                    Text("No").tag(1)
                    Text("Maybe").tag(2)
                }
                .pickerStyle(RadioGroupPickerStyle())
            }
            
            Divider().padding(.vertical)
            
            Text("This picker uses the SegmentedPickerStyle.")
                .modifier(ExplanatoryText())
            
            Picker(selection: $segmentSelected, label: Text("Select a color:")) {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
        .padding()
    }
}

struct PickerSamplesView_Previews: PreviewProvider {
    static var previews: some View {
        PickerSamplesView()
    }
}
