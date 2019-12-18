//
//  UIKitTabView.swift
//  KURakutan
//
//  Created by Kazuki Takeda on 2019/12/17.
//  Copyright © 2019 das08. All rights reserved.
//

import SwiftUI
import UIKit

struct UIKitTabView: View {
    var viewControllers: [UIHostingController<AnyView>]
    @State var selectedIndex: Int = 0
    
    init(_ views: [Tab]) {
        self.viewControllers = views.map {
            let host = UIHostingController(rootView: $0.view)
            host.tabBarItem = $0.barItem
            return host
        }
    }
    
    var body: some View {
        TabBarController(controllers: viewControllers,selectedIndex: $selectedIndex)
            .edgesIgnoringSafeArea(.all)
    }
    
    struct Tab {
        var view: AnyView
        var barItem: UITabBarItem
        
        init<V: View>(view: V, barItem: UITabBarItem) {
            self.view = AnyView(view)
            self.barItem = barItem
        }
        
        // convenience
        init<V: View>(view: V, title: String?, image: String, selectedImage: String? = nil) {
            let selectedImage = selectedImage != nil ? UIImage(named: selectedImage!) : nil
            let barItem = UITabBarItem(title: title, image: UIImage(systemName: image), selectedImage: selectedImage)
            self.init(view: view, barItem: barItem)
        }
    }
}

struct TabBarController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    @Binding var selectedIndex: Int

    func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        tabBarController.delegate = context.coordinator
        tabBarController.selectedIndex = 0
        return tabBarController
    }
    
    

    func updateUIViewController(_ tabBarController: UITabBarController, context: Context) {
        tabBarController.selectedIndex = selectedIndex
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITabBarControllerDelegate {
        var parent: TabBarController

        init(_ tabBarController: TabBarController) {
            self.parent = tabBarController
        }

        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            parent.selectedIndex = tabBarController.selectedIndex
        }
//        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//            if let navigationController = viewController as? UINavigationController {
//                navigationController.popToRootViewController(animated: true)
//            }
//        }
    }
}
