//
//  EmojiArtDemoApp.swift
//  EmojiArtDemo
//
//  Created by Paulo Orquillo on 15/08/21.
//

import SwiftUI

@main
struct EmojiArtDemoApp: App {
    let document = EmojiArtDocument()
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
