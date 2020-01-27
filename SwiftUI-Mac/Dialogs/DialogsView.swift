//
//  DialogsView.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 13/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import SwiftUI

struct DialogsView: View {
    @State private var alertIsShowing = false
    @State private var sheetIsShowing = false
    
    @State private var dialogResult = "Click the buttons above to test the dialogs."
    
    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Button("Alert") {
                    self.dialogResult = "Showing Alert"
                    self.alertIsShowing.toggle()
                }
                Spacer()
                Button("Action") {
                    self.dialogResult = "'ActionSheet' is unavailable in macOS."
                }
                Spacer()
                Button("Sheet") {
                    self.dialogResult = ""
                    self.sheetIsShowing.toggle()
                }
                Spacer()
                Button("File") {
                    self.dialogResult = "Select where to save the cat image."
                    self.saveImage()
                }
            }
            .padding(.horizontal)
            .padding(.top, 6)
            
            Text(dialogResult)
                .font(.caption)
                .frame(height: 20)
        }
        .alert(isPresented: $alertIsShowing) {
            // single button Alert
            //    Alert(title: Text("Alert"),
            //          message: Text("This is an alert!"),
            //          dismissButton: .default(Text("OK")) {
            //            self.dialogResult = "OK clicked in Alert"
            //        })
            
            // Two button alert
            Alert(title: Text("Alert"),
                  message: Text("This is an alert!"),
                  primaryButton: .default(Text("OK"), action: {
                    self.dialogResult = "OK clicked in Alert"
                  }), secondaryButton: .cancel({
                    self.dialogResult = "Cancel clicked in Alert"
                  }))
        }
        .sheet(isPresented: $sheetIsShowing) {
            // sheet dismissed using Binding
            // SheetView(isVisible: self.$sheetIsShowing, enteredText: self.$dialogResult)
            
            // sheet dismissed using Environment presentation mode
            SheetView(enteredText: self.$dialogResult)
        }
    }
    
    func saveImage() {
        let panel = NSSavePanel()
        panel.nameFieldLabel = "Save cat image as:"
        panel.nameFieldStringValue = "cat.jpg"
        panel.canCreateDirectories = true
        panel.begin { response in
            if response == NSApplication.ModalResponse.OK, let fileUrl = panel.url {
                self.dialogResult = "Saving to \(fileUrl.path)"
                NotificationCenter.default.post(name: .saveImage, object: fileUrl)
            } else {
                self.dialogResult = "Cancel clicked in Save dialog"
            }
        }
    }
}

struct DialogsView_Previews: PreviewProvider {
    static var previews: some View {
        // DialogsView()
        
        // sheet dismissed using Binding
        // SheetView(isVisible: .constant(true), enteredText: .constant(""))
        
        // sheet dismissed using Environment presentation mode
        SheetView(enteredText: .constant(""))
    }
}

struct SheetView: View {
    // sheet dismissed using Binding
    // @Binding var isVisible: Bool
    
    // sheet dismissed using Environment presentation mode
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var enteredText: String

    var body: some View {
        VStack {
            HStack {
                Image("blackcat")
                    .resizable()
                    .frame(width: 80)
                    .aspectRatio(contentMode: .fit)
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1, z: 0))
                Spacer()
                Text("Enter some text below and it will appear at the bottom of the detail view.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            TextField("Enter the result of the dialog here…", text: $enteredText)
                .padding()
            
            HStack {
                Button("Cancel") {
                    // sheet dismissed using Binding
                    // self.isVisible = false
                    
                    self.enteredText = "Cancel clicked in Sheet"
                    
                    // sheet dismissed using Environment presentation mode
                    self.presentationMode.wrappedValue.dismiss()
                }
                Spacer()
                Button("OK") {
                    // sheet dismissed using Binding
                    // self.isVisible = false
                    
                    self.enteredText = "OK: \(self.enteredText)"
                    
                    // sheet dismissed using Environment presentation mode
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}
