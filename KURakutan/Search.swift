//
//  Search.swift
//  KURakutan
//
//  Created by Kazuki Takedaon 2019/11/30.
//  Copyright © 2019 das08. All rights reserved.
//

import SwiftUI
struct Search: View {
    let array = ["人社群", "自然群", "外国語群", "情報群", "健康群", "キャリア群", "統合群", "少人数", "専門"]
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        TextField("search All", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }).foregroundColor(.primary)
                        
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                    
                    if showCancelButton  {
                        Button("Cancel") {
                            UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                            self.searchText = ""
                            self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                
                
                List {
                    // Filtered list of names
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {searchText1 in
                        Text(searchText1)
                    }
                }
                .navigationBarTitle(Text("KU Rakutan 2019"))
                .resignKeyboardOnDragGesture()
            }
        }
        .padding(-2.89)
    }
    
    
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
        //            .environment(\.colorScheme, .dark)
    }
}
