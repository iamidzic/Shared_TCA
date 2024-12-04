//
//  Shared_TCAApp.swift
//  Shared_TCA
//
//  Created by Ivan Amidzic on 04.12.2024..
//

import ComposableArchitecture
import SwiftUI

@main
struct Shared_TCAApp: App {
    let store = Store(initialState: AppFeature.State.startup) {
        AppFeature.body._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: store)
                .task {
                    store.send(.onAppear)
                }
        }
    }
}
