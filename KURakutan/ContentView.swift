//
//  ContentView.swift
//  KURakutan
//
//  Created by Kazuki Takeda on 2019/11/30.
//  Copyright © 2019 das08. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        UIKitTabView([
            UIKitTabView.Tab(view: Top(), title: "ホーム", image: "house.fill"),
            UIKitTabView.Tab(view: Home(), title: "検索", image: "magnifyingglass"),
            UIKitTabView.Tab(view: SafariView(url: URL(string: "https://www.k.kyoto-u.ac.jp/student/la/top")!), title: "提供", image: "tray.and.arrow.up.fill"),
            UIKitTabView.Tab(view: Setting(), title: "その他", image: "gear")
        ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
