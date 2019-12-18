//
//  rakutanSpecific.swift
//  KURakutan
//
//  Created by Kazuki Takeda on 2019/12/07.
//  Copyright © 2019 das08. All rights reserved.
//

import SwiftUI

struct rakutanSpecific: View {
    var detail:RakutanData
    var year:Int
    func Years(year:Int,type:String) -> String{
        var total:String="---"
        var accepted:String="---"
        if (year==2018){
            total=String(detail.total2018)
            accepted=String(detail.accepted2018)
        }
        if (year==2017){
            total=String(detail.total2017)
            accepted=String(detail.accepted2017)
        }
        if (year==2016){
            total=String(detail.total2016)
            accepted=String(detail.accepted2016)
        }
        if(type=="total"){
            return total
        }else{
            return accepted
        }
    }
    
    var body: some View {
        VStack {
            List{
                Section(header:Text("\(String(year))年度")){
                    Text("単位取得数：\(Years(year:year,type:"accepted"))人")
                    Text("履修人数：\(Years(year:year,type:"total"))人")
                }
            }
            .navigationBarTitle(Text(detail.lectureName),displayMode:.inline)
            
        }
    }
}

struct rakutanSpecific_Previews: PreviewProvider {
    static var previews: some View {
        rakutanSpecific(detail:RakutanData.example,year:2018)
    }
}
