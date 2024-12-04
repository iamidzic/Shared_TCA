//
//  UserSettings.swift
//  Shared_TCA
//
//  Created by Ivan Amidzic on 04.12.2024..
//

import Foundation
import Sharing

struct UserSettings: Codable, Equatable {
    private(set) var displayName: String = ""

    mutating func setDisplayName(name: String) {
        self.displayName = name
    }
}

extension SharedKey where Self == FileStorageKey<UserSettings> {
    static var userSettings: Self {
        fileStorage(.documentsDirectory.appending(path: "userSettings.json"))
    }
}
