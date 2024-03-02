//
//  Connectivity.swift
//  watch
//
//  Created by Cristian Ceban on 02.03.2024.
//

import Foundation
import WatchConnectivity

enum ConnectivityUserInfoKey: String {
  case text = "text"
}

final class Connectivity: NSObject {
  
  @Published var text: String?
  
  static let shared = Connectivity()
  
  override private init() {
    super.init()
    
    WCSession.default.delegate = self
    WCSession.default.activate()
  }
  
  public func send(
    userInfo: [String: Any],
    errorHandler:((Error) -> Void)? = nil
  ) {
    //    return if session is not activated
    guard WCSession.default.activationState == .activated else { return }
    
    guard WCSession.default.isCompanionAppInstalled else { return }
    
    if WCSession.default.isReachable {
      WCSession.default.sendMessage(userInfo) {
        _ in
      }
    } else {
      do {
        try WCSession.default.updateApplicationContext(userInfo)
      } catch {
        errorHandler?(error)
      }
    }
    
  }
  
  
}

extension Connectivity: WCSessionDelegate {
  func session(
    _ session: WCSession,
    activationDidCompleteWith activationState: WCSessionActivationState,
    error: Error?) {
      
    }
  
  func update(from dictionary: [String: Any]) {
    print("Received content: \(dictionary)")
    if let text = dictionary[ConnectivityUserInfoKey.text.rawValue] as? String {
      self.text = text
    }
  }
  
  func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
    update(from: message)
  }
  
  func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
    update(from: applicationContext)
  }
  
  func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
    update(from: userInfo)
  }
  
}

