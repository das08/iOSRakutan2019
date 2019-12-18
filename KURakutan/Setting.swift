//
//  Setting.swift
//  KURakutan
//
//  Created by Kazuki Takeda on 2019/12/17.
//  Copyright © 2019 das08. All rights reserved.
//

import SwiftUI

struct Setting: View {
    @State var showingUrl = false
    var body: some View {
        NavigationView{
            List{
                Section{
                    Button(action: {
                        self.showingUrl.toggle()
                    }) {
                        HStack {
                            Text("LINE@")
                                .foregroundColor(Color.black)
                            Spacer()
                            Text("京大楽単Bot")
                                .foregroundColor(Color.black)
                            Image(systemName:"chevron.right")
                                .foregroundColor(Color.gray)
                                .opacity(0.5)
                        }
                    }.sheet(isPresented: $showingUrl) {
                        SafariView(url: URL(string: "https://lin.ee/dlqFcBT")!)
                        }
                   
                    Button(action: {
                        self.showingUrl.toggle()
                    }) {
                        HStack {
                            Text("Twitter")
                                .foregroundColor(Color.black)
                            Spacer()
                            Text("@KU_das08")
                                .foregroundColor(Color.black)
                            Image(systemName:"chevron.right")
                            .foregroundColor(Color.gray)
                            .opacity(0.5)
                        }
                    }.sheet(isPresented: $showingUrl) {
                        SafariView(url: URL(string: "https://twitter.com/KU_das08")!)
                        }
                    
                    
                }
                Section{
                    HStack {
                        Text("Version")
                        
                        Text("0.10")
                    }
                }
                Section{
                    NavigationLink(destination:Home()){
                        Text("お問い合わせ")
                    }
                }
            }
            .navigationBarTitle("Settings")
            .listStyle(GroupedListStyle())
        }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
