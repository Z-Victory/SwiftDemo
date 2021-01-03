//
//  YHNetworkingTool.swift
//  SwiftDemo
//
//  Created by mana on 2020/11/26.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON

class YHNetworkingTool: NSObject {
    
    private static func setHttpHeader() -> HTTPHeaders {
        let dic = Bundle.main.infoDictionary
        let buildStr = dic?["CFBundleVersion"] ?? ""//内部管理版本号
        let versionStr = dic?["CFBundleShortVersionString"] ?? ""//版本号
        
        var header:HTTPHeaders = HTTPHeaders.init()
        
//        header["appMark"] = ["os":"ios","appname":"mana","version":versionStr as! String,"Content-Type":"application/json;charset=UTF-8"]
        header["OS"] = "iOS"
        header["Content-Type"] = "application/json;charset=UTF-8"
        return header
        
    }
    
    static func requestFunction(url:String, method:HTTPMethod, parameters:Parameters?, showLoading:Bool = true, success: @escaping(_ jsonStr:String,_ responseData:DataResponse<Any, Error>) -> Void, fail:@escaping(_ errorStr:String,_ err:Error)->Void) {
        
        if showLoading {//是否显示loading
            
        }
        
        var urlStr:String = url
        let header = self.setHttpHeader()
        
        
        let encoding:ParameterEncoding = JSONEncoding.default
        if method == kHTTPMethodGet {
            let theStr:NSString = NSString.init(string: urlStr)
            urlStr = theStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        }
        
        YHNetManager.shareManager().request(urlStr, method: method, parameters: parameters, encoding: encoding, headers: header).responseString { (response) in
            if showLoading { //显示loading
//                TMNetworkingTool.referenceCountChangeFun(isAdd: false)
            }
            
        
//            if response.result.isSuccess { //网络请求成功
//                print("header=\(header) \rurlStr=\(urlStr) \rparaDic=\(parameters ?? [:]) \rresponse=\(JSON.init(parseJSON: response.result.value ?? ""))")
//                if let value = response.result.value {
//                    let json = JSON.init(parseJSON: value)
//                    if json["code"].int == 0 {//请求成功
//                        succ(value,response)
//                    }
//                    else{//请求失败，获取err
//                        fail(json["message"].string ?? kNetFailMessage, response.error ?? NSError.init())
//                    }
//
//                }else{ //没有获取到数据
//                    fail(kNetFailMessage, NSError.init())
//                }
//            }else {//网络请求失败
//                fail(kNetFailMessage, NSError.init())
//            }
//        }
            
        }
    }
}
