//
//  PageTagModel.swift
//  SwiftDemo
//
//  Created by mana on 2020/12/1.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
class IndustryListItem    : NSObject {
    var categoryId: Int = 0
    var title: String!
    var titleEn: String!
}

class ProfessionListItem    : NSObject {
    var categoryId: Int = 0
    var title: String!
    var titleEn: String!
}

class HotTagsListItem    : NSObject {
    var categoryId: Int = 0
    var title: String!
    var titleEn: String!
}

class PageTagModel    : NSObject {
    var industryList: [IndustryListItem]!
    var professionList: [ProfessionListItem]!
    var hotTagsList: [HotTagsListItem]!
}
