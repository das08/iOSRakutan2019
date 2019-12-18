//
//  rakutanData.swift
//  KURakutan
//
//  Created by Kazuki Takeda on 2019/12/03.
//  Copyright © 2019 das08. All rights reserved.
//

import SwiftUI


struct RakutanData: Codable, Equatable,Identifiable{
    var id: Int
    var facultyName: String
    var lectureName: String
    var group: String
    var credit: String
    var total2018: Int
    var accepted2018: Int
    var total2017: Int
    var accepted2017: Int
    var total2016: Int
    var accepted2016: Int
    var url: String
    
    #if DEBUG
    static let example = RakutanData(id: 12345, facultyName: "工学部", lectureName: "電気回路基礎論", group: "自然", credit: "2", total2018: 100, accepted2018: 50, total2017: 100, accepted2017: 50, total2016: 100, accepted2016: 50, url: "http://yahoo.co.jp")
    #endif
}

