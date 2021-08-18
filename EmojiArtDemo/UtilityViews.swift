//
//  UtilityViews.swift
//  EmojiArtDemo
//
//  Created by Paulo Orquillo on 18/08/21.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    var body: some View {
        if uiImage != nil {
            Image(uiImage: uiImage!)
        }
    }
}
