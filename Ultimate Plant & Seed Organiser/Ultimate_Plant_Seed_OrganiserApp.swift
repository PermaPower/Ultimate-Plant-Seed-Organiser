//___FILEHEADER___

import SwiftUI

@main
struct Ultimate_Plant_Seed_Organiser: App {
    
    let manager = CoreDataManager.instance
        
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            CategoryListView()
        }
        
        .onChange(of: scenePhase) { _ in
            manager.save()
               }
    }
}
