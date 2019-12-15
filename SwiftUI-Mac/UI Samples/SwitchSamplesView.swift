//
//  SwitchSamplesView.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 10/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import SwiftUI

struct SwitchSamplesView: View {
    @State private var toggleValue = true
    @State private var stepperValue = 0
    @State private var sliderValue = 0.0
    
    var body: some View {
        VStack {
            Text("Use a Toggle to get a check box.")
                .modifier(ExplanatoryText())
            
            Toggle(isOn: $toggleValue) {
                Text("Toggle switch")
            }
            
            Divider().padding(.vertical)
            
            Text("Steppers and sliders are much the same.")
                .modifier(ExplanatoryText())
            
            Stepper(value: $stepperValue, in: 0 ... 100) {
                Text("Select a number:")
            }
            
            Slider(value: $sliderValue,
                   in: 0 ... 10,
                   minimumValueLabel: Text("Slow"),
                   maximumValueLabel: Text("Fast")) {
                    Text("Speed:")
            }
            .padding()
            
            Divider().padding(.vertical)
            
            Group {
                Text("Toggle value = \(toggleValue ? "ON" : "OFF")")
                Text("Stepper value = \(stepperValue)")
                Text("Slider value = \(sliderValue, specifier: "%.2f")")
            }
            .modifier(ExplanatoryText())
        }
            
        .padding()
    }
}

struct SwitchSamplesView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchSamplesView()
    }
}
