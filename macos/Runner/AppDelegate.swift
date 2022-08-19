import Cocoa
import FlutterMacOS


@NSApplicationMain
class AppDelegate: FlutterAppDelegate {

    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
      return false
    }
    
    override func applicationWillFinishLaunching(_ notification: Notification) {
        if let visibleFrame = NSScreen.main?.visibleFrame, let frame = NSScreen.main?.frame {
            let windowWidth = 360
            
            mainFlutterWindow.setFrame(NSRect(x: Int(frame.size.width - CGFloat(windowWidth)), y: Int(visibleFrame.origin.y), width: windowWidth, height: Int(visibleFrame.size.height)), display: true)
        }
    }
    
    override func applicationDidFinishLaunching(_ aNotification: Notification) {

    }
    
}

