//
//  ContentView.swift
//  ImagePicker
//
//  Created by 김정민 on 2021/05/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        Text("Hello World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

