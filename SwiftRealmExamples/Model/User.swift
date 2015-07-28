//
//  User.swift
//  SwiftRealmExamples
//
//  Created by king on 15/7/28.
//  Copyright (c) 2015年 king. All rights reserved.
//

import RealmSwift

class User: Object
{
    dynamic var userID = 0
    dynamic var password = ""
    dynamic var nickname = ""
    dynamic var realName = ""
    //性别 1男2女
    dynamic var gender = 1
    dynamic var birthday = NSDate(timeIntervalSince1970: 1)
    dynamic var country = ""
    dynamic var imageUrl = ""
    //个人签名
    dynamic var signature = ""
    //婚姻 1未婚2已婚3离异4丧偶
    dynamic var marriage = 1
    dynamic var job = ""
    dynamic var income = 0
    dynamic var education = ""
    
    //计算属性会被Realm 自动忽略
    var age: Int {
        return (Int(NSDate().timeIntervalSinceDate(birthday))/(3600*24))
    }
    
    //临时ID
    dynamic var tempID = 0
    
    //索引
    override static func indexedProperties() -> [String]
    {
        return ["nickname"]
    }
    //主键
    override static func primaryKey() -> String?
    {
        return "userID"
    }
    
    //防止tempID 持久化 应该不会被写入 Realm
    override static func ignoredProperties() -> [String]
    {
        return ["tempID"]
    }
}
