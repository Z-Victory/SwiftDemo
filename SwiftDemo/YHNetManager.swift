//
//  YHNetManager.swift
//  SwiftDemo
//
//  Created by mana on 2020/11/26.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
import Alamofire

class YHNetManager: Session {
    static var theManager:YHNetManager?
    
    class func shareManager(timeOut:TimeInterval=60) -> YHNetManager {
        let config = Config.shareConfig()
        config.timeoutIntervalForRequest = timeOut
        
        if theManager == nil {
            theManager = YHNetManager.init(configuration: config)
        }
        return theManager!
    }
}

class Config: URLSessionConfiguration {
    static var theConfig:URLSessionConfiguration?
    
    class func shareConfig() -> URLSessionConfiguration {
        if theConfig == nil {
            theConfig = URLSessionConfiguration.default
        }
        return theConfig!
    }
}
