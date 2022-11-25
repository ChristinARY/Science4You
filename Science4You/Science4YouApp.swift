//
//  Science4YouApp.swift
//  Science4You
//
//  Created by Apprenant 62 on 20/10/2022.
//

import SwiftUI

@main
struct Science4YouApp: App {

//    init()
//    {
//        initialisation()
//    }
    var body: some Scene {
        WindowGroup {
            ContentView()

                .environmentObject(PostsViewModel())
                .environmentObject(FieldsViewModel())
                .environmentObject(Preferences())
        }
    }
}
