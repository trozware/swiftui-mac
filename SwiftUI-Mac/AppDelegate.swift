//
//  AppDelegate.swift
//  SwiftUI-Mac
//
//  Created by Sarah Reichelt on 6/11/19.
//  Copyright © 2019 Sarah Reichelt. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!
    
    @IBOutlet weak var darkModeMenuItem: NSMenuItem!
    @IBOutlet weak var lightModeMenuItem: NSMenuItem!
    @IBOutlet weak var systemModeMenuItem: NSMenuItem!
    
    @UserDefault("system_mode", defaultValue: "system")
    var systemMode: String
    
    let prefs = Prefs()
    var prefsView: PrefsView?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        setStoredSystemMode()
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        
        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.title = "SwiftUI for Mac"
        window.tabbingMode = .disallowed
        window.contentView = NSHostingView(rootView: contentView.environmentObject(prefs))
        window.makeKeyAndOrderFront(nil)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func setStoredSystemMode() {
        switch systemMode {
        case "dark":
            NSApp.appearance = NSAppearance(named: .darkAqua)
        case "light":
            NSApp.appearance = NSAppearance(named: .aqua)
        default:
            NSApp.appearance = nil
        }
        
        showSelectedModeInMenu()
    }
    
    func showSelectedModeInMenu() {
        switch systemMode {
        case "dark":
            darkModeMenuItem.state = .on
            lightModeMenuItem.state = .off
            systemModeMenuItem.state = .off
        case "light":
            darkModeMenuItem.state = .off
            lightModeMenuItem.state = .on
            systemModeMenuItem.state = .off
        default:
            darkModeMenuItem.state = .off
            lightModeMenuItem.state = .off
            systemModeMenuItem.state = .on
        }
    }
    
    @IBAction func darkModeSelected(_ sender: Any) {
        NSApp.appearance = NSAppearance(named: .darkAqua)
        systemMode = "dark"
        showSelectedModeInMenu()
    }
    
    @IBAction func lightModeSelected(_ sender: Any) {
        NSApp.appearance = NSAppearance(named: .aqua)
        systemMode = "light"
        showSelectedModeInMenu()
    }
    
    @IBAction func systemModeSelected(_ sender: Any) {
        NSApp.appearance = nil
        systemMode = "system"
        showSelectedModeInMenu()
    }
    
    @IBAction func flipImage(_ sender: Any) {
        NotificationCenter.default.post(name: .flipImage, object: nil)
    }
    
    @IBAction func openPrefsWindow(_ sender: Any) {
        if let prefsView = prefsView, prefsView.prefsWindowDelegate.windowIsOpen {
            prefsView.window.makeKeyAndOrderFront(self)
        } else {
            prefsView = PrefsView(prefs: prefs)
        }
    }
    
}

extension Notification.Name {
    static let flipImage = Notification.Name("flip_image")
    static let saveImage = Notification.Name("save_image")
}
