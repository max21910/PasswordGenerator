//
//  AboutView.swift
//  PasswordGenerator
//
//  Created by Max  on 17/10/2022.
//

import Foundation
import SwiftUI



//about view

struct AboutView: View {
    var body: some View {
        VStack {
            Image(nsImage: NSImage(named: "AppIcon")!)
            
            Text("\(Bundle.main.appName)")
                .font(.system(size: 20, weight: .bold))
          
        }
        VStack{
            
          
            
            Text("Ver: \(Bundle.main.appVersionLong) (\(Bundle.main.appBuild)) ")
            Text("created with ❤️ by Max21910 in 🇫🇷")
            Text("Support this project on github :")
            
            
            
            Link(destination: URL(string: "https://github.com/max21910/PasswordGenerator")!, label: {
                Label("Github link", systemImage: "link.circle")
                    .font(.system(size: 18).bold())
                    .padding(6)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(6)
            })
        }
        
        .padding(20)
        .frame(minWidth: 350, minHeight: 300)
    }
}

//view of the about 

class AppDelegate: NSObject, NSApplicationDelegate {
    private var aboutBoxWindowController: NSWindowController?
    
    func showAboutWnd() {
        if aboutBoxWindowController == nil {
            let styleMask: NSWindow.StyleMask = [.closable, .miniaturizable,/* .resizable,*/ .titled]
            let window = NSWindow()
            window.styleMask = styleMask
            window.title = "About \(Bundle.main.appName)"
            window.contentView = NSHostingView(rootView: AboutView())
            window.center()
            aboutBoxWindowController = NSWindowController(window: window)
        }
        
        aboutBoxWindowController?.showWindow(aboutBoxWindowController?.window)
    }
}


extension Bundle {
    public var appName: String { getInfo("CFBundleName")  }
  
    
    public var appBuild: String { getInfo("CFBundleVersion") }
    public var appVersionLong: String { getInfo("CFBundleShortVersionString") }
    
    
    fileprivate func getInfo(_ str: String) -> String { infoDictionary?[str] as? String ?? "⚠️" }
}
