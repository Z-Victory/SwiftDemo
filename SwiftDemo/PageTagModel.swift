//
//  PageTagModel.swift
//  SwiftDemo
//
//  Created by mana on 2020/12/1.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
import HandyJSON

class IndustryListItem    : HandyJSON {
    var categoryId: Int = 0
    var title: String!
    var titleEn: String!

    //HandyJSON要求必须实现这个方法
    required init() {

    }
}

class ProfessionListItem    : HandyJSON {
    var categoryId: Int = 0
    var title: String!
    var titleEn: String!

    //HandyJSON要求必须实现这个方法
    required init() {

    }
}

class HotTagsListItem    : HandyJSON {
    var categoryId: Int = 0
    var title: String!
    var titleEn: String!

    //HandyJSON要求必须实现这个方法
    required init() {

    }
}

class PageTagModel    : HandyJSON {
    var industryList: [IndustryListItem]?
    var professionList: [ProfessionListItem]?
    var hotTagsList: [HotTagsListItem]?

    //HandyJSON要求必须实现这个方法
    required init() {}
}
//struct PageTagModel : HandyJSON {
//    var industryList : [String:Any]?
//
//}
//struct IndustryListItem : HandyJSON {
//    var categoryId: Int = 0
//    var title: String?
//    var titleEn: String?
//}
