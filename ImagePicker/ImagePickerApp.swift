//
//  ImagePickerApp.swift
//  ImagePicker
//
//  Created by 김정민 on 2021/05/20.
//

import SwiftUI

@main
struct ImagePickerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
