//
//  AppView.swift
//  Shared_TCA
//
//  Created by Ivan Amidzic on 04.12.2024..
//

import SwiftUI
import ComposableArchitecture

@Reducer(state: .equatable)
enum AppFeature {
    case startup
    case onboarding
    case home
    
    enum Action {
        case onAppear
    }
    
    static var body: some ReducerOf<Self> {
        @Shared(.userSettings) var userSettings = UserSettings()

        Reduce { state, action in
            switch action {
            case .onAppear:
                $userSettings.withLock { $0.setDisplayName(name: "Test Name") }
                return .none
            }
        }
    }
}

struct AppView: View {
    let store: StoreOf<AppFeature>
    
    var body: some View {
        switch store.case {
        case .onboarding:
            Text("Onboarding")
        case .home:
            Text("Home")
        case .startup:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .controlSize(.large)
        }
    }
}

