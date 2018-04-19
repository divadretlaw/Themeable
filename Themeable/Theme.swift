//
//  Theme.swift
//  Authenticator
//
//  Created by David Walter on 08.01.18.
//  Copyright © 2018 David Walter. All rights reserved.
//

import UIKit
import Eureka

public class Theme {
    
    public enum Features {
        case eureka
    }
    
    public static let shared = Theme()
    
    public var colors = ThemeColors.default
    public var features: [Features] = []
    
    public var customColor: (() -> Void)?
    public var customAppearance: (() -> Void)?
    
    public func alert(title: String, message: String?, preferredStyle: UIAlertControllerStyle) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alert.view.tintColor = colors.tint
        
        return alert
    }
    
    public func apply(force: Bool) {
        self.customColor?()
        self.appearance()
        
        if force {
            self.window()
        }
    }
    
    private func window() {
        for window in UIApplication.shared.windows {
            for view in window.subviews {
                view.removeFromSuperview()
                window.addSubview(view)
            }
            
            window.rootViewController?.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    private func appearance() {
        // MARK: - UINavigationBar
        UINavigationBar.appearance().barStyle = self.colors.isDark ? .black : .default
        UINavigationBar.appearance().tintColor = self.colors.tint
        
        // MARK: - UITableView
        UITableView.appearance().backgroundColor = self.colors.background
        UITableView.appearance().separatorColor = self.colors.separator
        UITableViewCell.appearance().backgroundColor = self.colors.cell
        
        // MARK: - UILabel
        UILabel.appearance().textColor = self.colors.text
        
        // MARK: - UIButton
        UIButton.appearance().tintColor = self.colors.textButton
        UIButton.appearance().backgroundColor = self.colors.backgroundButton
        
        // MARK: - UIBarButtonItem
        UIButton.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).tintColor = self.colors.tint
        UIButton.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).backgroundColor = nil

        // MARK: - UISegmentedControl
        UISegmentedControl.appearance().tintColor = self.colors.tint
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).tintColor = self.colors.tint
        
        // MARK: - UITextField
        UITextField.appearance().textColor = self.colors.tint
        
        // MARK: - UISlider
        UISlider.appearance().tintColor = self.colors.tint
        if let thumb = self.colors.thumb {
            UISlider.appearance().thumbTintColor = thumb
        }
        UISlider.appearance().minimumTrackTintColor = self.colors.tint
        if let dampened = self.colors.dampened {
            UISlider.appearance().maximumTrackTintColor = dampened
        }
        
        // MARK: - UISwitch
        UISwitch.appearance().onTintColor = self.colors.tint
        if let thumb = self.colors.thumb {
            UISwitch.appearance().thumbTintColor = thumb
        }
        
        // MARK: - UIProgressView
        UIProgressView.appearance().tintColor = self.colors.tint
        UIProgressView.appearance().progressTintColor = self.colors.tint
        if let dampened = self.colors.dampened {
            UIProgressView.appearance().trackTintColor = dampened
        }
        
        // MARK: - UIStepper
        UIStepper.appearance().tintColor = self.colors.tint
        UIStepper.appearance().backgroundColor = .clear
        UIButton.appearance(whenContainedInInstancesOf: [UIStepper.self]).tintColor = self.colors.tint
        UIButton.appearance(whenContainedInInstancesOf: [UIStepper.self]).backgroundColor = nil
        
        // MARK: - UITabBar
        UITabBar.appearance().tintColor = self.colors.tint
        UITabBar.appearance().barStyle = self.colors.isDark ? .black : .default
        
        self.eurekaAppearance()
        self.customAppearance?()
    }
    
    // MARK: - Eureka

    private func eurekaAppearance() {
        guard features.contains(.eureka) else { return }
        
        ButtonRow.defaultCellSetup = { cell, row in
            cell.tintColor = self.colors.tint
            cell.textLabel?.tintColor = self.colors.tint
        }
        
        StepperRow.defaultCellSetup = { cell, row in
            cell.tintColor = self.colors.tint
            cell.valueLabel?.tintColor = self.colors.tint
        }
        
        NavigationAccessoryView.appearance().tintColor = self.colors.tint
        NavigationAccessoryView.appearance().backgroundColor = self.colors.background
        UITableView.appearance(whenContainedInInstancesOf: [FormViewController.self]).backgroundColor = self.colors.backgroundForm
        UITextField.appearance(whenContainedInInstancesOf: [FormViewController.self]).backgroundColor = .clear
    }
    
}
