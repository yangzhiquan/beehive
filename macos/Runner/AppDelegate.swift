import Cocoa
import FlutterMacOS


@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
//    var statusBar: StatusBarController?
    var statusItem: NSStatusItem

    var popover = NSPopover.init()
    
    override init() {
        //to make the popover hide when the user clicks outside of it
        popover.behavior = NSPopover.Behavior.transient
        
        
        let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        
//        if let button = statusItem.button {
//            button.image = statusItemButtonImage
//            button.setAccessibilityIdentifier(Accessibility.identifiers.statusItemButton)
//        }
        self.statusItem = statusItem
    }
    
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
      return false
    }

    override func applicationWillFinishLaunching(_ notification: Notification) {
         mainFlutterWindow.close()
//        mainFlutterWindow.orderOut(self)
//        mainFlutterWindow.setFrameOrigin(NSPoint(x: 999999, y: 999999))
    }
    
    override func applicationDidFinishLaunching(_ aNotification: Notification) {
      let controller: FlutterViewController =
        mainFlutterWindow?.contentViewController as! FlutterViewController
      popover.contentSize = NSSize(width: 420, height: 660)
      popover.contentViewController = controller //set the content view controller for the popover to flutter view controller
      statusBar = StatusBarController.init(popover)
//      super.applicationDidFinishLaunching(aNotification)
    }
    
}

