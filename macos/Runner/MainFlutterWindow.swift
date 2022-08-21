import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
    override func awakeFromNib() {
        let flutterViewController = FlutterViewController.init()
        let windowFrame = self.frame
        self.contentViewController = flutterViewController
        self.setFrame(windowFrame, display: true)

        AppManager.shared.setupChannel(registry: flutterViewController)
        RegisterGeneratedPlugins(registry: flutterViewController)
        
        

        // add visualEffectView
        if let sView = self.contentView?.superview {
            let visualEffectView = _NonClickableVisualEffectView(frame: NSMakeRect(0, 0, windowFrame.size.width, windowFrame.size.height))
            visualEffectView.translatesAutoresizingMaskIntoConstraints = false
            visualEffectView.material = NSVisualEffectView.Material.dark
            visualEffectView.blendingMode = NSVisualEffectView.BlendingMode.behindWindow
            visualEffectView.state = NSVisualEffectView.State.active
            
            sView.addSubview(visualEffectView, positioned: .below, relativeTo: nil)
            NSLayoutConstraint.activate([
                visualEffectView.topAnchor.constraint(equalTo: sView.topAnchor),
                visualEffectView.widthAnchor.constraint(equalTo: sView.widthAnchor),
                visualEffectView.bottomAnchor.constraint(equalTo: sView.bottomAnchor),
                visualEffectView.heightAnchor.constraint(equalTo: sView.heightAnchor)
            ])
        }

        super.awakeFromNib()
    }
    
}

// _NonClickableVisualEffectView
class _NonClickableVisualEffectView: NSVisualEffectView {
    override func hitTest(_ point: NSPoint) -> NSView? {
        return nil
    }
}
