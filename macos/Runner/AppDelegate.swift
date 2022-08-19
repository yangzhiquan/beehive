import Cocoa
import FlutterMacOS


@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
//    var statusBar: StatusBarController?
    var popover = NSPopover.init()
    
    var statusItem: NSStatusItem!
    var statusButton: NSStatusBarButton!
    var isEnabled: Bool = true

    
    override init() {
      popover.behavior = NSPopover.Behavior.transient //to make the popover hide when the user clicks outside of it
    }
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
      return false
    }

    override func applicationWillFinishLaunching(_ notification: Notification) {

//        mainFlutterWindow.close()
    }
    
    override func applicationDidFinishLaunching(_ aNotification: Notification) {
      let controller: FlutterViewController =
        mainFlutterWindow?.contentViewController as! FlutterViewController
      popover.contentSize = NSSize(width: 360, height: 360) //change this to your desired size
      popover.contentViewController = controller //set the content view controller for the popover to flutter view controller
//      statusBar = StatusBarController.init(popover)

        /*
        if let frame = NSScreen.main?.frame {
            let windowWidth = 388;
            
            mainFlutterWindow.setFrame(NSRect(x: Int(frame.size.width - CGFloat(windowWidth)), y: 0, width: windowWidth, height: Int(frame.size.height)), display: true, animate: true)
        }
        
        mainFlutterWindow.titlebarAppearsTransparent = true
        mainFlutterWindow.isMovableByWindowBackground  = true
        mainFlutterWindow.styleMask = .fullSizeContentView
        */
        
        mainFlutterWindow.titleVisibility = .hidden
//        mainFlutterWindow.standardWindowButton(.closeButton)?.isHidden = true
//        mainFlutterWindow.standardWindowButton(.zoomButton)?.isHidden = true
//        mainFlutterWindow.standardWindowButton(.miniaturizeButton)?.isHidden = true
        mainFlutterWindow.titlebarAppearsTransparent = true
        mainFlutterWindow.isMovableByWindowBackground = true

        // Aquire an NSStatusItem from the NSStatusBar
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem.isVisible = true
        statusItem.behavior = [.removalAllowed, .terminationOnRemoval]
        
        // Aquire a button related to the NSStatusItem
        statusButton = statusItem.button!
        
        // Configure the button's properties
        if #available(macOS 11.0, *) {
            statusButton.image = NSImage(systemSymbolName: "pencil", accessibilityDescription: nil)
        }
        statusButton.target = self
        statusButton.action = #selector(didTapButton)
        
        // Make sure the button always starts enabled
        enable()

    }
 
    
    @objc func didTapButton() {
            if isEnabled {
                disable()
            } else {
                enable()
            }
            if let statusBarButton = statusItem.button {
                if isEnabled {
//                    popover.close()
//                    mainFlutterWindow.close()
                    

                    mainFlutterWindow.orderOut(self)
                } else {
//                    mainFlutterWindow.becomeKey()
//                    mainFlutterWindow.becomeMain()
//                    mainFlutterWindow.makeKey()
//                    popover.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: NSRectEdge.maxY)

                    mainFlutterWindow.titlebarAppearsTransparent = false
                    mainFlutterWindow.styleMask = .borderless //NSBorderlessWindowMask
                    mainFlutterWindow.isMovableByWindowBackground  = true

                    
                    mainFlutterWindow.makeKeyAndOrderFront(self)
                    NSApplication.shared.activate(ignoringOtherApps: true)
                    
//                    [mainFlutterWindow makeKeyAndOrderFront:self];
//                    [NSApp activateIgnoringOtherApps:YES];

                
                }

            }
        }
        
        func enable() {
            // Run anything here
            if #available(macOS 11.0, *) {
                statusButton.image = NSImage(systemSymbolName: "circle", accessibilityDescription: nil)
            }
            isEnabled = true
        }
        
        func disable() {
            // Run anything here
            if #available(macOS 11.0, *) {
                statusButton.image = NSImage(systemSymbolName: "circle.fill", accessibilityDescription: nil)
            }
            isEnabled = false
        }
    
}

