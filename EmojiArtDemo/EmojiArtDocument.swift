//
//  EmojiArtDocument.swift
//  EmojiArtDemo
//
//  Created by Paulo Orquillo on 15/08/21.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
    @Published private(set) var emojiArt: EmojiArtModel {
        didSet {
            if emojiArt.background != oldValue.background {
                fetchBackgroundIfNeeded()
            }
        }
    }
    
    init() {
        emojiArt = EmojiArtModel()
        emojiArt.addEmoji("🧁", at: (-200,10), size: 80)
        emojiArt.addEmoji("🍰", at: (100,60), size: 30)
    }
    
    var emojis: [EmojiArtModel.Emoji] { emojiArt.emojis }
    var background: EmojiArtModel.Background { emojiArt.background }
    
    
    @Published var backgroundImage: UIImage?
    
    private func fetchBackgroundIfNeeded() {
        backgroundImage = nil
        switch emojiArt.background {
        
        case .url(let url):
            //fetch data
            let imageData = try? Data(contentsOf: url)
            if imageData != nil {
                backgroundImage = UIImage(data: imageData!)
            }
        case .imageData(let data):
            backgroundImage = UIImage(data: data)
        case .blank:
            break
        }
    }
    // MARK: Intents
    
    func setBackground(_ background: EmojiArtModel.Background) {
        emojiArt.background = background
        print(emojiArt.background)
    }
    
    func addEmoji(_ emoji: String, at location: (x:Int, y: Int), size: CGFloat) {
        emojiArt.addEmoji(emoji, at: location, size: Int(size))
    }
    
    func moveEmoji(_ emoji: EmojiArtModel.Emoji, by offset: CGSize) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            emojiArt.emojis[index].x = Int(offset.width)
            emojiArt.emojis[index].y = Int(offset.height)
        }
    }
    
    func scaleEmoji(_ emoji: EmojiArtModel.Emoji, by scale: CGFloat) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            emojiArt.emojis[index].size = Int(CGFloat(emojiArt.emojis[index].size) * scale)// rounded is anothe function
        }

    }
}
