//
//  StatusBarController.swift
//  Runner
//
//  Created by Ken Lee on 11/3/2022.
//

import AppKit

class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    private var isShown: Bool = false
    private var window: NSWindow
    
    init(_ window: NSWindow) {
        self.window = window
        statusBar = NSStatusBar.init()
        statusItem = statusBar.statusItem(withLength: 28.0)
        
        
        if #available(macOS 11.0, *) {
            statusItem.button?.image = NSImage(systemSymbolName: "circle", accessibilityDescription: nil)
        }
        statusItem.button?.image?.size = NSSize(width: 18.0, height: 18.0)
        statusItem.button?.image?.isTemplate = true
        statusItem.button?.action = #selector(togglePopover(sender:))
        statusItem.button?.target = self
    }
    
    @objc func togglePopover(sender: AnyObject) {
        if(isShown) {
            hidePopover(sender)
        }
        else {
            showPopover(sender)
        }
        isShown = !isShown
    }
    
    func showPopover(_ sender: AnyObject) {
        if #available(macOS 11.0, *) {
            statusItem.button?.image = NSImage(systemSymbolName: "circle.fill", accessibilityDescription: nil)
        }
        
        window.makeKeyAndOrderFront(self)
        NSApplication.shared.activate(ignoringOtherApps: true)
    }
    
    func hidePopover(_ sender: AnyObject) {
        if #available(macOS 11.0, *) {
            statusItem.button?.image = NSImage(systemSymbolName: "circle", accessibilityDescription: nil)
        }
        
        window.orderOut(self)
    }
}
