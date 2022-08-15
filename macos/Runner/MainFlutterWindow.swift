import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
    override func awakeFromNib() {
        let flutterViewController = FlutterViewController.init()
        let windowFrame = self.frame
        self.contentViewController = flutterViewController
        self.setFrame(windowFrame, display: true)

        RegisterGeneratedPlugins(registry: flutterViewController)
        
        // main method channel
        let res = flutterViewController.registrar(forPlugin: "beeHivePlugin")
        let channel = FlutterMethodChannel(name: "beeHive_channel", binaryMessenger: res.messenger)
        channel.setMethodCallHandler { call, result in
            
            switch call.method {
            case "getPlatformVersion":
                result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
                channel.invokeMethod("clipboardChange", arguments: ["someKey": "123"])

            default:
              result(FlutterMethodNotImplemented)
            }


        }
        

        super.awakeFromNib()
    }
    
    
}
