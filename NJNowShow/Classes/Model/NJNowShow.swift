//
//  NJNowShow.swift
//  NJNowShow
//
//  Created by NJHu on 2018/7/10.
//

import UIKit
import SwiftyJSON

/*
 pos: 1,
 useridx: 60835552,
 userId: "WeiXin30394362",
 gender: 0,
 myname: "秋--😿小颖宝😿",
 smallpic: "http://liveimg.9158.com/pic/avator/2018-05/18/20/20180518203645_60835552_250.png",
 bigpic: "http://liveimg.9158.com/pic/avator/2018-05/18/20/20180518203645_60835552_640.png",
 allnum: 53530,
 roomid: 60314136,
 serverid: 15,
 gps: "来自喵星",
 flv: "http://hdl.9158.com/live/69d22ec4c0a2093886aa410a45161540.flv",
 anchorlevel: 0,
 starlevel: 2,
 familyName: "秋白家族",
 isSign: 0,
 nation: "",
 nationFlag: "",
 distance: 0,
 gameid: 0,
 nType: 0
 */

struct NJNowShow {
    var pos: Int
    var useridx: String
    var userId: String
    var gender: Int
    var myname: String
    var smallpic: String
    var bigpic: String
    var allnum: String
    var roomid: String
    var serverid: String
    var gps: String
    var flv: String
    var anchorlevel: Int
    var starlevel: Int
    var familyName: String
    var isSign: Bool
    var nation: String
    var nationFlag: String
    var distance: String
    var gameid: String
    var nType: String
    
    
    init(jsonData: JSON) {
        pos = jsonData["pos"].intValue
        useridx = jsonData["useridx"].stringValue
        userId = jsonData["userId"].stringValue
        gender = jsonData["gender"].intValue
        myname = jsonData["myname"].stringValue
        smallpic = jsonData["smallpic"].stringValue
        bigpic = jsonData["bigpic"].stringValue
        allnum = jsonData["allnum"].stringValue
        roomid = jsonData["roomid"].stringValue
        serverid = jsonData["serverid"].stringValue
        gps = jsonData["gps"].stringValue
        flv = jsonData["flv"].stringValue
        anchorlevel = jsonData["anchorlevel"].intValue
        starlevel = jsonData["starlevel"].intValue
        familyName = jsonData["familyName"].stringValue
        isSign = jsonData["isSign"].boolValue
        nation = jsonData["nation"].stringValue
        nationFlag = jsonData["nationFlag"].stringValue
        distance = jsonData["distance"].stringValue
        gameid = jsonData["gameid"].stringValue
        nType = jsonData["nType"].stringValue
    }
}
