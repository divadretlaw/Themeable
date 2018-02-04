//
//  ThemeColors.swift
//  ThemeColors
//
//  Created by David Walter on 28.01.18.
//  Copyright © 2018 David Walter. All rights reserved.
//

import UIKit

public struct ThemeColors: Codable, Equatable {
    
    public static let `default` = ThemeColors()
    private init() {}
    
    // MARK: - Variables
    
    public var isDark: Bool = false
    
    public var tint: UIColor = .red
    public var dampened: UIColor?
    
    public var text: UIColor = .darkText
    public var textInverse: UIColor = .lightText
    public var textDark: UIColor = .black
    public var textLight: UIColor = .white
    var textButton: UIColor = .red
    
    public var background: UIColor = .white
    public var backgroundDark: UIColor = .black
    public var backgroundForm: UIColor = .groupTableViewBackground
    public var backgroundButton: UIColor = .clear
    
    public var cell: UIColor = .white
    var separator: UIColor? = .clear
    
    public var thumb: UIColor?
    
    // MARK: - Codable
    
    enum ThemeKeys: String, CodingKey {
        case isDark
        
        case tint
        case dampened
        
        case text
        case textInverse
        case textDark
        case textLight
        case textButton
        
        case background
        case backgroundDark
        case backgroundForm
        case backgroundButton
        
        case cell
        case separator
        
        case thumb
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ThemeKeys.self)
        try container.encode(self.isDark, forKey: .isDark)
        try container.encode(self.tint.hex(), forKey: .tint)
        if let dampened = self.dampened {
            try container.encode(dampened.hex(), forKey: .dampened)
        }
        try container.encode(self.text.hex(), forKey: .text)
        try container.encode(self.textInverse.hex(), forKey: .textInverse)
        try container.encode(self.textDark.hex(), forKey: .textDark)
        try container.encode(self.textLight.hex(), forKey: .textLight)
        try container.encode(self.textButton.hex(), forKey: .textButton)
        
        try container.encode(self.background.hex(), forKey: .background)
        try container.encode(self.backgroundDark.hex(), forKey: .backgroundDark)
        try container.encode(self.backgroundForm.hex(), forKey: .backgroundForm)
        try container.encode(self.backgroundButton.hex(), forKey: .backgroundButton)
        
        try container.encode(self.cell.hex(), forKey: .cell)
        if let separatorColor = self.separator {
            try container.encode(separatorColor.hex(), forKey: .separator)
        }
        if let thumb = self.thumb {
            try container.encode(thumb.hex(), forKey: .thumb)
        }
    }
    
    public init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: ThemeKeys.self)
        
        self.isDark = try values.decode(Bool.self, forKey: .isDark)
        
        // Main
        
        let tintColor = try values.decode(String.self, forKey: .tint)
        self.tint = UIColor(hex: tintColor)
        self.textButton = UIColor(hex: tintColor)
        
        if let dampened = try values.decodeIfPresent(String.self, forKey: .dampened) {
            self.dampened = UIColor(hex: dampened)
        }
        
        // Text
        
        if let text = try values.decodeIfPresent(String.self, forKey: .text) {
            self.text = UIColor(hex: text)
        }
        
        if let textInverse = try values.decodeIfPresent(String.self, forKey: .textInverse) {
            self.textInverse = UIColor(hex: textInverse)
        }
        
        if let textDark = try values.decodeIfPresent(String.self, forKey: .textDark) {
            self.textDark = UIColor(hex: textDark)
        }
        
        if let textLight = try values.decodeIfPresent(String.self, forKey: .textLight) {
            self.textLight = UIColor(hex: textLight)
        }
        
        if let textButton = try values.decodeIfPresent(String.self, forKey: .textButton) {
            self.textButton = UIColor(hex: textButton)
        }
        
        // Background
        
        if let background = try values.decodeIfPresent(String.self, forKey: .background) {
            self.background = UIColor(hex: background)
        }
        
        if let backgroundDark = try values.decodeIfPresent(String.self, forKey: .backgroundDark) {
            self.backgroundDark = UIColor(hex: backgroundDark)
        }
        
        if let backgroundButton = try values.decodeIfPresent(String.self, forKey: .backgroundButton) {
            self.backgroundButton = UIColor(hex: backgroundButton)
        }
        
        // TableView
        
        if let backgroundForm = try values.decodeIfPresent(String.self, forKey: .backgroundForm) {
            self.backgroundForm = UIColor(hex: backgroundForm)
        }
        
        if let cell = try values.decodeIfPresent(String.self, forKey: .cell) {
            self.cell = UIColor(hex: cell)
        }
        
        if let separator = try values.decodeIfPresent(String.self, forKey: .separator) {
            self.separator = UIColor(hex: separator)
        }
        
        if let thumb = try values.decodeIfPresent(String.self, forKey: .thumb) {
            self.thumb = UIColor(hex: thumb)
        }
    }
    
    // MARK: - File Init
    
    public static func from(bundle: String) -> ThemeColors {
        guard let url = Bundle.main.url(forResource: bundle, withExtension: "json") else { return ThemeColors() }
        return ThemeColors.from(url: url)
    }
    
    public static func from(url: URL) -> ThemeColors {
        let decoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: url)
            let colors = try decoder.decode(ThemeColors.self, from: data)
            return colors
        } catch {
            return ThemeColors()
        }
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: ThemeColors, rhs: ThemeColors) -> Bool {
        if lhs.isDark != rhs.isDark ||
            lhs.tint != rhs.tint ||
            lhs.dampened != rhs.dampened ||
            lhs.text != rhs.text ||
            lhs.textInverse != rhs.textInverse ||
            lhs.textDark != rhs.textDark ||
            lhs.textLight != rhs.textLight ||
            lhs.background != rhs.background ||
            lhs.backgroundDark != rhs.backgroundDark ||
            lhs.backgroundForm != rhs.backgroundForm ||
            lhs.cell != rhs.cell ||
            lhs.separator != rhs.separator ||
            lhs.thumb != rhs.thumb { return false }
        
        return true
    }
}
