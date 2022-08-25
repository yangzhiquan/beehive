import Cocoa
import FlutterMacOS


@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
    var statusBar: StatusBarController?

    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
      return false
    }
    
    override func applicationWillFinishLaunching(_ notification: Notification) {
        if let frame = NSScreen.main?.frame {
            let windowWidth = 360
            let menuBarHeight = NSApplication.shared.mainMenu?.menuBarHeight ?? 24.0
            
            mainFlutterWindow.setFrame(NSRect(x: Int(frame.size.width - CGFloat(windowWidth)), y: Int(menuBarHeight), width: windowWidth, height: Int(frame.size.height - menuBarHeight)), display: true)
        }
        statusBar = StatusBarController.init(mainFlutterWindow)
        
        mainFlutterWindow.close()
    }
    
    override func applicationDidFinishLaunching(_ aNotification: Notification) {

    }
    
}

