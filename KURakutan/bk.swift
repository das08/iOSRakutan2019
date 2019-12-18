////
////  HomeDetail.swift
////  KURakutan
////
////  Created by 武田和樹 on 2019/12/02.
////  Copyright © 2019 das08. All rights reserved.
////
//
//import SwiftUI
//
//struct HomeDetail: View {
//    @EnvironmentObject private var userData: UserData
//    @State private var searchText = ""
//    @State private var showCancelButton: Bool = false
//    var facultyName:String
//
//    var body: some View {
//        VStack{
//            HStack {
//                HStack {
//                    Image(systemName: "magnifyingglass")
//
//                    TextField("search All", text: $searchText, onEditingChanged: { isEditing in
//                        self.showCancelButton = true
//                    }).foregroundColor(.primary)
//
//                    Button(action: {
//                        self.searchText = ""
//                    }) {
//                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
//                    }
//                }
//                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
//                .foregroundColor(.secondary)
//                .background(Color(.secondarySystemBackground))
//                .cornerRadius(10.0)
//
//                if showCancelButton  {
//                    Button("Cancel") {
//                        UIApplication.shared.endEditing(true)
//                        self.searchText = ""
//                        self.showCancelButton = false
//                    }
//                    .foregroundColor(Color(.systemBlue))
//                }
//            }
//            .padding(.horizontal)
//
//            if searchText==""{
//                nonFiltered(facultyName: facultyName, searchText: searchText)
//            }else{
//                Filtered(facultyName: facultyName, searchText: searchText)
//            }
//        }
//        .padding(-2.89)
//    }
//}
//
//struct Filtered: View {
//    @EnvironmentObject var userData: UserData
//    var facultyName:String
//    var searchText:String
//    func getFaculty(faculty:String) -> [RakutanData]{
//        switch faculty {
//        case "文学部": return userData.facultyletter
//        case "教育学部": return userData.facultyeducation
//        case "法学部": return userData.facultylaw
//        case "経済学部": return userData.facultyeconomics
//        case "理学部": return userData.facultyscience
//        case "医学部": return userData.facultymedicine
//        case "医学部（人間健康科学科）": return userData.facultymedicinehuman
//        case "薬学部": return userData.facultypharm
//        case "工学部": return userData.facultyengineering
//        case "農学部": return userData.facultyagriculture
//        case "総合人間学部": return userData.facultyihs
//        default: return userData.facultykkk
//        }
//    }
//
//    var body: some View {
//        List{
//            ForEach(getFaculty(faculty: facultyName).filter{$0.lectureName.hasPrefix(searchText)}){detail in
//                rakutanRow(detail:detail)
//            }
//        }
//        .navigationBarTitle(Text("講義一覧"))
//        .listStyle(GroupedListStyle())
//        .resignKeyboardOnDragGesture()
//    }
//}
//
//struct nonFiltered: View {
//    @EnvironmentObject var userData: UserData
//    var facultyName:String
//    var searchText:String
//    func getFaculty(faculty:String) -> [RakutanData]{
//        switch faculty {
//        case "文学部": return userData.facultyletter
//        case "教育学部": return userData.facultyeducation
//        case "法学部": return userData.facultylaw
//        case "経済学部": return userData.facultyeconomics
//        case "理学部": return userData.facultyscience
//        case "医学部": return userData.facultymedicine
//        case "医学部（人間健康科学科）": return userData.facultymedicinehuman
//        case "薬学部": return userData.facultypharm
//        case "工学部": return userData.facultyengineering
//        case "農学部": return userData.facultyagriculture
//        case "総合人間学部": return userData.facultyihs
//        default: return userData.facultykkk
//        }
//    }
//
//    var body: some View {
//        List{
//            ForEach(getFaculty(faculty: facultyName)){detail in
//                rakutanRow(detail:detail)
//            }
//        }
//        .navigationBarTitle(Text("講義一覧"))
//        .listStyle(GroupedListStyle())
//        .resignKeyboardOnDragGesture()
//    }
//}
//
//struct HomeDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeDetail(facultyName: "工学部")
//            .environmentObject(UserData())
//    }
//}
//
//extension UIApplication {
//    func endEditing(_ force: Bool) {
//        self.windows
//            .filter{$0.isKeyWindow}
//            .first?
//            .endEditing(force)
//    }
//}
//
//struct ResignKeyboardOnDragGesture: ViewModifier {
//    var gesture = DragGesture().onChanged{_ in
//        UIApplication.shared.endEditing(true)
//    }
//    func body(content: Content) -> some View {
//        content.gesture(gesture)
//    }
//}
//
//extension View {
//    func resignKeyboardOnDragGesture() -> some View {
//        return modifier(ResignKeyboardOnDragGesture())
//    }
//}
//
//
