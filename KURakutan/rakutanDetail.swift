//
//  rakutanDetail.swift
//  KURakutan
//
//  Created by Kazuki Takeda on 2019/12/03.
//  Copyright © 2019 das08. All rights reserved.
//

import SwiftUI

struct rakutanDetail: View {
    @State var showingDetail = false
    
    var detail: RakutanData
    func percentage(total:Int,accepted:Int ) ->  Double{
        let total:Double=Double(total)
        let accepted:Double=Double(100*accepted)
        var percent:Double=0
        if (total != 0 && accepted != 0){
           percent=accepted/total
        }
        
        return percent
    }
    func getInfo(type:String) -> String{
        if type==""{
            return "---"
        }else{
            return type
        }
    }
    
    var body: some View {
        VStack{
            List{
                Section(header:Text("講義情報")){
                    HStack {
                        Text("\(getInfo(type:detail.group))群")
                        Text("\(getInfo(type:detail.credit))単位")
                    }
                    
                   
                }
                Section(header:Text("2018年度")){
                    NavigationLink(destination:rakutanSpecific(detail: detail, year: 2018)){
                        Text("単位取得率：\(percentage(total:detail.total2018,accepted:detail.accepted2018),specifier:"%.2f")%")
                    }
                }
                Section(header:Text("2017年度")){
                    NavigationLink(destination:rakutanSpecific(detail: detail, year: 2017)){
                        Text("単位取得率：\(percentage(total:detail.total2017,accepted:detail.accepted2017),specifier:"%.2f")%")
                    }
                }
                Section(header:Text("2016年度")){
                    NavigationLink(destination:rakutanSpecific(detail: detail, year: 2016)){
                        Text("単位取得率：\(percentage(total:detail.total2016,accepted:detail.accepted2016),specifier:"%.2f")%")
                    }
                }
                Section(header:Text("過去問URL")){
                    if (detail.url.isEmpty){
                        Text("未確認　(提供お待ちしています)")
                        .foregroundColor(Color.gray)
                    }else{
                        Button(action: {
                            self.showingDetail.toggle()
                        }) {
                            Text("\(detail.url)")
                                .foregroundColor(Color.blue)
                        }.sheet(isPresented: $showingDetail) {
                            SafariView(url: URL(string: self.detail.url)!)
                        }
                    }
                }.disabled(detail.url.isEmpty)
            }
            .navigationBarTitle(Text(detail.lectureName),displayMode:.inline)
        }
        
        
    }
    
}


struct rakutanDetail_Previews: PreviewProvider {
    static var previews: some View {
        rakutanDetail(detail:RakutanData.example)
    }
}
