//
//  AppManager.swift
//  Runner
//
//  Created by YvanYang on 2022/8/16.
//

import FlutterMacOS
import Foundation

let appRegistryName: String = "beeHivePlugin"
let appChannelName: String = "beeHive_channel"

let kChannelMethodClipboardChange: String = "ClipboardChange"


class AppManager {
    static let shared = AppManager()
    private var channel: FlutterMethodChannel?
    let clipboard = ClipboardX()
    
    public func setupChannel(registry: FlutterPluginRegistry) {
        let res = registry.registrar(forPlugin: appRegistryName)
        
        channel = FlutterMethodChannel(name: appChannelName, binaryMessenger: res.messenger)
        channel?.setMethodCallHandler(flutterMsgHandle)
    }
    
    public func sendMsgToFlutter(method: String, args: Any?) {
        channel?.invokeMethod(method, arguments: args)
    }
    
    private func flutterMsgHandle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "init":
            result("OK")
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
}
