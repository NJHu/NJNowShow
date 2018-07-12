//
//  NJNowShowHomeListViewModel.swift
//  NJNowShow
//
//  Created by NJHu on 2018/7/10.
//

import UIKit
import SwiftyJSON
import NJKit

fileprivate let baseUrl = "http://live.9158.com/Fans/GetHotLive"
/*
 page=3
 format=json
 */

class NJNowShowHomeListViewModel: NSObject {
    var nowShowList: [NJNowShow] = [NJNowShow]()
    private var page: Int = 1
}

extension NJNowShowHomeListViewModel {
    func loadLiveNowShows(isMore: Bool = false, completion: @escaping (_ response: NJResponse, _ hasMore: Bool) -> ()) -> Void {
        
        var urlStr = baseUrl
        
        let curPage = isMore ? (page + 1) : 1
        
        NJNetworkTool.sharedTool.GET(urlStr, parameters:["page": curPage, "format": "json"]) {[weak self] (response: NJResponse) in
            
            guard response.error == nil && response.responseObject != nil else {
                completion(response, true)
                return
            }
            
            let jsonData = JSON.init(response.responseObject)
            
            guard jsonData["code"].intValue == 100 else {
                response.statusCode = jsonData["code"].intValue
                response.errorMsg = "错误: " + jsonData["msg"].stringValue + jsonData["code"].stringValue
                response.error = NJNetworkToolError.serverWrong
                completion(response, true)
                return
            }
            
            self?.page = curPage
            
            if !isMore {
                self?.nowShowList.removeAll()
            }
            
            for (index, jsonValue) in jsonData["data"]["list"].arrayValue.enumerated() {
                self?.nowShowList.append(NJNowShow(jsonData: jsonValue))
            }

            completion(response, true)
        }
    }
}
