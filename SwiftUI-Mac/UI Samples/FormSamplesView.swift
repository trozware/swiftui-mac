//
//  FormSamplesView.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 10/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import SwiftUI

struct FormSamplesView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var selectedDate = Date()
    @State private var selectedColor = NSColor.blue
    
    var body: some View {
        VStack {
            TextField("Enter your email address", text: $email)
            
            SecureField("Enter your password", text: $password)
            
            DatePicker(selection:  $selectedDate, displayedComponents: [.date ]) {
                Text("Pick a date:")
            }
            .padding()
            
            DatePicker(selection:  $selectedDate, displayedComponents: [.date ]) {
                Text("Pick a date graphically:")
            }
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()
            
            HStack {
                Text("Choose a color:")
                EmbeddedColorWell(selectedColor: $selectedColor)
                    .frame(width: 44, height: 23)
            }
            .background(Color(selectedColor))
            
            HStack {
                Button("Cancel") {}
                Spacer()
                Button("OK") {}
            }
        }
        .padding()
    }
}

struct FormSamplesView_Previews: PreviewProvider {
    static var previews: some View {
        FormSamplesView()
    }
}
