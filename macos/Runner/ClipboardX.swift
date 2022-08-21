//
//  ClipboardX.swift
//  Runner
//
//  Created by yvanyang on 2022/8/17.
//

import Foundation
import Cocoa
import Quartz

// 剪切板数据封装
class ClipboardX {
    var timer: Timer!
    let pasteboard: NSPasteboard = .general
    var lastChangeCount: Int = 0

    private let _history = NSMutableArray()
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (t) in
            if self.lastChangeCount != self.pasteboard.changeCount {
                self.lastChangeCount = self.pasteboard.changeCount
                self.pasteboardChange()
            }
//            if let str = self.pasteboard.getPlainString()  {
//                debugPrint(str)
//            }

        }
    }
    
    deinit {
        timer.invalidate()
    }
    
    public func select(index: Int) {
        if index < _history.count, let content = _history[index] as? String {
            pasteboard.declareTypes([.string], owner: nil)
            pasteboard.setString(content, forType: .string)
        }
    }
    
    private func pasteboardChange() {
        if let plainString = self.pasteboard.getPlainString() {
            if _history.count > 0, let lastContent = _history.firstObject as? String, lastContent == plainString {
                return
            }
            debugPrint("pasteboard change");
            _history.remove(plainString)
            _history.insert(plainString, at: 0)
            AppManager.shared.sendMsgToFlutter(method: kChannelMethodClipboardChange, args: _history)
        }
    }
}


// 系统剪切板扩展
extension NSPasteboard {
    func getPlainString() -> String? {
        guard let data = data(forType: .string) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
//    func data(forType type: NSPasteboard.PasteboardType) -> Data? {
//        if !types.contains(type) {
//            return nil
//        }
//        if let data = unsavedData, data.keys.contains(type) {
//            return data[type]
//        }
//        return cache.data(withId: fsId, forType: type)
//    }
    
    func allData() -> [NSPasteboard.PasteboardType: Data?] {
        var data = [NSPasteboard.PasteboardType: Data?]()
        if let types = types {
            for type in types {
                data[type] = self.data(forType: type)
            }
        }
        return data
    }
    
    func getImage() -> NSImage? {
        return NSImage(pasteboard: NSPasteboard.general)
    }
    
    func getHtmlRawString() -> String? {
        guard let data = data(forType: .html) else { return nil }
        return String(data: data, encoding: .utf8)
    }
        
    func getTiffImage() -> NSImage? {
        guard let tiffData = data(forType: .tiff) else { return nil }
        return NSImage(data: tiffData)
    }
    func getRtfAttributedString() -> NSAttributedString? {
        guard let data = data(forType: .rtf) else { return nil }
        return NSAttributedString(rtf: data, documentAttributes: nil)
    }

    func getHtmlAttributedString() -> NSAttributedString? {
        guard let data = data(forType: .html) else { return nil }
        return NSAttributedString(html: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
    }

    func getUrl() -> URL? {
        guard let data = data(forType: .URL) else { return nil }
        return URL(dataRepresentation: data, relativeTo: nil)
    }

    func getFileUrl() -> URL? {
        guard let data = data(forType: .fileURL) else { return nil }
        return URL(dataRepresentation: data, relativeTo: nil)
    }

    func getPdf() -> PDFDocument? {
        guard let data = data(forType: .pdf) else { return nil }
        return PDFDocument(data: data)
    }

    func getPng() -> NSImage? {
        guard let data = data(forType: .png) else { return nil }
        return NSImage(data: data)
    }

    func getThumbnailImage() -> NSImage? {
        var image: NSImage?
        DispatchQueue.global(qos: .userInteractive).sync {
            guard let url = getFileUrl() else { return }
            let ref = QLThumbnailCreate(kCFAllocatorDefault, url as CFURL, CGSize(width: 300, height: 300), [kQLThumbnailOptionIconModeKey: true] as CFDictionary)

            guard let thumbnail = ref?.takeRetainedValue() else { return }
            let cgImageRef = QLThumbnailCopyImage(thumbnail)
            guard let cgImage = cgImageRef?.takeRetainedValue() else { return }
            image = NSImage(cgImage: cgImage, size: CGSize(width: cgImage.width, height: cgImage.height))
        }
        return image
    }

    func getFileIcon() -> NSImage? {
        guard let url = getFileUrl() else { return nil }
        return NSWorkspace.shared.icon(forFile: url.path)
    }

    func getColor() -> NSColor? {
        guard let data = data(forType: .color) else { return nil }
        let pasteboard = NSPasteboard(name: NSPasteboard.Name(rawValue: "YippyBeta.ColorTest"))
        pasteboard.declareTypes([.color], owner: nil)
        pasteboard.setData(data, forType: .color)
        return NSColor(from: pasteboard)
    }
}
