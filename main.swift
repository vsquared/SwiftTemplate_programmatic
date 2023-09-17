//
//  main.swift
//  swift template
//
//  Created by vsquared.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
var window:NSWindow!

@objc func myBtnAction(_ sender:AnyObject ) {
  NSSound.beep()
}

func buildMenu() {
 let mainMenu = NSMenu()
 NSApp.mainMenu = mainMenu
 // **** App menu **** //
 let appMenuItem = NSMenuItem()
 mainMenu.addItem(appMenuItem)
 let appMenu = NSMenu()
 appMenuItem.submenu = appMenu
 appMenu.addItem(withTitle: "Quit", action:#selector(NSApplication.terminate), keyEquivalent: "q")
}
    
func buildWnd() {
    
let _wndW : CGFloat = 400
let _wndH : CGFloat = 300

 window = NSWindow(contentRect:NSMakeRect(0,0,_wndW,_wndH),styleMask:[.titled, .closable, .miniaturizable, .resizable], backing:.buffered, defer:false)
 window.center()
 window.title = "Swift Test Window"
 window.makeKeyAndOrderFront(window)

// **** Text Field **** //
let txtFld = NSTextField (frame:NSMakeRect( 60, _wndH - 60, 180, 24 ))
window.contentView!.addSubview(txtFld)
txtFld.stringValue = "Hello World."

// **** Button **** //
let myBtn = NSButton (frame:NSMakeRect( 250, _wndH - 62, 95, 30 ))
 myBtn.bezelStyle = .rounded
 myBtn.autoresizingMask = [.maxXMargin,.minYMargin]
 myBtn.title = "Beep"
 myBtn.action = #selector(self.myBtnAction(_:))
 window.contentView!.addSubview (myBtn)

// **** Quit btn **** //
let quitBtn = NSButton (frame:NSMakeRect( _wndW - 50, 10, 40, 40 ))
 quitBtn.bezelStyle = .circular
 quitBtn.autoresizingMask = [.minXMargin,.maxYMargin]
 quitBtn.title = "Q"
 quitBtn.action = #selector(NSApplication.terminate)
 window.contentView!.addSubview(quitBtn)
}
 
func applicationDidFinishLaunching(_ notification: Notification) {
 buildMenu()
 buildWnd()
}

func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
 return true
}

}
let appDelegate = AppDelegate()

// **** main.swift **** //
let app = NSApplication.shared
app.delegate = appDelegate
app.setActivationPolicy(.regular)
app.activate(ignoringOtherApps:true)
app.run()

