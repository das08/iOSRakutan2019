//
//  Top.swift
//  KURakutan
//
//  Created by Kazuki Takeda on 2019/12/17.
//  Copyright © 2019 das08. All rights reserved.
//

import SwiftUI

struct Top: View {
    @State private var angle: CGFloat = 0
    @State private var dragAmount = CGSize.zero
    var body: some View {
        VStack{
            Image("icon")
                .resizable()
                .frame(width:90,height:90)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.gray,lineWidth: 2)
                )
                .overlay(
                    Circle()
                        .stroke(Color.gray,lineWidth: 0.8)
                        .scaleEffect(angle*2.5)
                        .opacity(Double(2-angle))
                        .animation(
                            Animation.easeInOut(duration: 1.5)
                                .repeatCount(1, autoreverses: false)
                        )
                )
                .onAppear{
                    self.angle=2
                }
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged{ self.dragAmount = $0.translation}
                        .onEnded{_ in
                            withAnimation(.spring()){
                                self.dragAmount = .zero
                            }
                            
                    }
            )
            Text("2019年度京大楽単検索")
                .font(.headline)
                .fontWeight(.bold)
            
        }
        
    }
}

struct Top_Previews: PreviewProvider {
    static var previews: some View {
        Top()
    }
}
