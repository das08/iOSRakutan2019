//
//  Home.swift
//  KURakutan
//
//  Created by Kazuki Takeda on 2019/12/02.
//  Copyright © 2019 das08. All rights reserved.
//

import SwiftUI

struct Home: View {
    let facultyList=["文学部","教育学部","法学部","経済学部","理学部","医学部（人間健康科学科）","医学部","薬学部","工学部","農学部","総合人間学部","国際高等教育院"]
    @EnvironmentObject private var userData: UserData
    var body: some View {
        NavigationView{
           List{
            ForEach(facultyList,id:\.self){name in
                NavigationLink(destination:HomeDetail(facultyName: name)) {
                    Text(name)
                }
               }
           }
       .navigationBarTitle(Text("開講部局一覧"))
       .listStyle(GroupedListStyle())
       }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        .environmentObject(UserData())
    }
}
