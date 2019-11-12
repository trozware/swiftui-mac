//
//  ContentView.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 6/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var httpSections: [HttpSection] = []
    @State private var prefsWindow: PrefsView?
    @State private var prefsWindowDelegate = PrefsWindowDelegate()
    
    var body: some View {
        NavigationView {
            List {
                Button("Prefs") {
                    if self.prefsWindowDelegate.windowIsOpen {
                        self.prefsWindow?.window.makeKeyAndOrderFront(self)
                    } else {
                        self.prefsWindow = PrefsView()
                        self.prefsWindowDelegate.windowIsOpen = true
                        self.prefsWindow?.window.delegate = self.prefsWindowDelegate
                    }
                }
                
                ForEach(httpSections) { section in
                    Section(header: SectionHeaderView(section: section)) {
                        ForEach(section.statuses) { status in
                            NavigationLink(destination: DetailView(httpStatus: status)) {
                                TableRowView(status: status)
                            }
                        }
                    }
                }
            }
            .frame(minWidth: 250, maxWidth: 350)
        }
        .listStyle(SidebarListStyle())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            self.readCodes()
        }
    }
    
    func readCodes() {
        httpSections = Bundle.main.decode([HttpSection].self, from: "httpcodes.json")
    }
    
    class PrefsWindowDelegate: NSObject, NSWindowDelegate {
        var windowIsOpen = false
        
        func windowWillClose(_ notification: Notification) {
            windowIsOpen = false
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SectionHeaderView: View {
    let section: HttpSection
    
    var body: some View {
        HStack(spacing: 20) {
            Text(section.headerCode)
                .layoutPriority(1)
            
            Text(section.headerText)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Spacer()
            
        }
    }
}

struct TableRowView: View {
    let status: HttpStatus
    
    var body: some View {
        HStack(spacing: 20) {
            Text(status.code)
                .frame(width: 40)
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text(status.title)
                .truncationMode(.tail)
            
            Spacer()
        }
    }
}
