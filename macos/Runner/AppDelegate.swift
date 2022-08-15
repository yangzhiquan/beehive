import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
    var statusBar: StatusBarController?
    var popover = NSPopover.init()
    
    // clipboard
    var timer: Timer!
    let pasteboard: NSPasteboard = .general
    var lastChangeCount: Int = 0

    
    override init() {
      popover.behavior = NSPopover.Behavior.transient //to make the popover hide when the user clicks outside of it
    }
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
      return false
    }

    override func applicationWillFinishLaunching(_ notification: Notification) {
        mainFlutterWindow.close()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (t) in
            if self.lastChangeCount != self.pasteboard.changeCount {
                self.lastChangeCount = self.pasteboard.changeCount
//                    NotificationCenter.default.post(name: .NSPasteboardDidChange, object: self.pasteboard)
                print(self.pasteboard.getPlainString() ?? "none")
            }
        }
        
    }
    
    override func applicationDidFinishLaunching(_ aNotification: Notification) {
      let controller: FlutterViewController =
        mainFlutterWindow?.contentViewController as! FlutterViewController
      popover.contentSize = NSSize(width: 360, height: 360) //change this to your desired size
      popover.contentViewController = controller //set the content view controller for the popover to flutter view controller
      statusBar = StatusBarController.init(popover)
//      super.applicationDidFinishLaunching(aNotification)
    }
    
    override func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        timer.invalidate()
    }
}


//extension NSNotification.Name {
//    public static let NSPasteboardDidChange: NSNotification.Name = .init(rawValue: "pasteboardDidChangeNotification")
//}


extension NSPasteboard {
    func getPlainString() -> String? {
        guard let data = data(forType: .string) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
