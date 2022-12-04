//
//  Setting.swift
//  PasswordGenerator
//
//  Created by Max  on 16/10/2022.
//

import SwiftUI
import Sparkle
import Foundation


struct UpdaterSettingsView: View {
    @ObservedObject private var checkForUpdatesViewModel: CheckForUpdatesViewModel

        private let updater: SPUUpdater
        
        @State private var automaticallyChecksForUpdates: Bool
        @State private var automaticallyDownloadsUpdates: Bool
        
        init(updater: SPUUpdater) {
            self.updater = updater
  
            self.automaticallyChecksForUpdates = updater.automaticallyChecksForUpdates
            self.automaticallyDownloadsUpdates = updater.automaticallyDownloadsUpdates
            self.checkForUpdatesViewModel = CheckForUpdatesViewModel(updater: updater)
        }
        
    var body: some View {
        
        
        
        
        
        VStack {
            Toggle("Automatically check for updates", isOn: $automaticallyChecksForUpdates)
                .onChange(of: automaticallyChecksForUpdates) { newValue in
                    updater.automaticallyChecksForUpdates = newValue
                }
            
            Toggle("Automatically download updates", isOn: $automaticallyDownloadsUpdates)
                .disabled(!automaticallyChecksForUpdates)
                .onChange(of: automaticallyDownloadsUpdates) { newValue in
                    updater.automaticallyDownloadsUpdates = newValue
                }
            Button("Check for Updates…", action: updater.checkForUpdates)
                .disabled(!checkForUpdatesViewModel.canCheckForUpdates)
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
        
    

                
              
            }.padding()
                .frame(width: 600,height: 600)
        }
      
    }







