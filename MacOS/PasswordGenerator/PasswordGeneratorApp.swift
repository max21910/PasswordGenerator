//
//  PasswordGeneratorApp.swift
//  PasswordGenerator
//
//  Created by Max  on 15/10/2022.
//

import SwiftUI
import Sparkle

// This view model class publishes when new updates can be checked by the user
final class CheckForUpdatesViewModel: ObservableObject {
    @Published var canCheckForUpdates = false
   init(updater: SPUUpdater) {
        updater.publisher(for: \.canCheckForUpdates)
            .assign(to: &$canCheckForUpdates)
    }
}

// This is the view for the Check for Updates menu item

struct CheckForUpdatesView: View {
    @ObservedObject private var checkForUpdatesViewModel: CheckForUpdatesViewModel
    private let updater: SPUUpdater
    
    init(updater: SPUUpdater) {
        self.updater = updater
        self.checkForUpdatesViewModel = CheckForUpdatesViewModel(updater: updater)
    }
    
    
    //Menu view
    var body: some View {
        Button("Check for Updates…", action: updater.checkForUpdates)
            .disabled(!checkForUpdatesViewModel.canCheckForUpdates)
        Button("Quit") {
                        NSApp.terminate(self) //quit app button
                    }
    }
}

@main
struct MyApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let updaterController: SPUStandardUpdaterController
    
    init() {
      
        updaterController = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: nil, userDriverDelegate: nil)
    }
    
    var body: some Scene {
        Settings {
               UpdaterSettingsView(updater: updaterController.updater)
           }
        WindowGroup {
      ContentView() //show content View "the main view " of the app
            
        }
       
        .commands {
             CommandGroup(replacing: CommandGroupPlacement.appInfo) {
               Button("About \(Bundle.main.appName)") { appDelegate.showAboutWnd() }
          Text("Ver: \(Bundle.main.appVersionLong) (\(Bundle.main.appBuild)) ")
                               }
                           }
        .commands {
            CommandGroup(after: .appInfo) {
                CheckForUpdatesView(updater: updaterController.updater)
            }
        }
       
                       }
                   }
            
        
  
