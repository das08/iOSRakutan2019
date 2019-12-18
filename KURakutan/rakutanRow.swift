//
//  rakutanDetail.swift
//  KURakutan
//
//  Created by Kazuki Takeda on 2019/12/03.
//  Copyright © 2019 das08. All rights reserved.
//

import SwiftUI

struct rakutanRow: View {
    var detail: RakutanData
    static let colors:[String:Color]=["文学部":.purple,"教育学部":.black,"法学部":.red,"経済学部":.blue,"理学部":.green,"医学部（人間健康科学科）":.green,"医学部":.green,"薬学部":.green,"工学部":.gray,"農学部":.green,"総合人間学部":.green,"国際高等教育院":.pink]
    
    func getALetter(faculty:String) ->  String{
        var letter:String=String(faculty.prefix(1))
        if faculty=="国際高等教育院"{
            letter="般"
        }
        return letter
    }
    func getInfo(type:String) -> String{
        if type==""{
            return "---"
        }else{
            return type
        }
    }
    
    var body: some View {
        
        NavigationLink(destination:rakutanDetail(detail:detail)) {
            HStack {
                Text("\(getALetter(faculty:detail.facultyName))")
                    .font(.title)
                    .fontWeight(.black)
                    .padding(5)
                    .background(Self.colors[detail.facultyName,default:.gray])
                    .clipShape(Circle())
                    .foregroundColor(.black)

                VStack(alignment: .leading) {
                    HStack {
                        Text(detail.facultyName)
                        //Text("群:\(getInfo(type: detail.group))")
                    }
                    
                    Text(detail.lectureName)
                        .font(.headline)
                    
                }
                Spacer()
                Text("SSS")
                    .fontWeight(.bold)
                    .foregroundColor(Color.yellow)
                    .italic()
                    .padding(3)
                    .background(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.1))
                    .clipShape(Rectangle())
                    .cornerRadius(10)
            }
        }
        
    }
    
}


struct rakutanRow_Previews: PreviewProvider {
    static var previews: some View {
        rakutanRow(detail:RakutanData.example)
    }
}
