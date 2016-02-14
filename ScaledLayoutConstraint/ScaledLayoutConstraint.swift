//
//  ScaledLayoutConstraint.swift
//  ScaledLayoutConstraint
//
//  Created by Adam Szeptycki on 14/02/16.
//  Copyright © 2016 MinimLabs. All rights reserved.
//

import UIKit
import DeviceGuru

@IBDesignable public class ScaledLayoutConstraint: NSLayoutConstraint {
    
    @IBInspectable public var iPhone35inchScanle: CGFloat = 1.0
    @IBInspectable public var iPhone4inchScanle: CGFloat = 1.0
    @IBInspectable public var iPhone47inchScanle: CGFloat = 1.0
    @IBInspectable public var iPhone55inchScanle: CGFloat = 1.0

    override public func awakeFromNib() {
        super.awakeFromNib()
        let scale: CGFloat = getScaleForCurrentDevice()
        self.constant = self.constant * scale
    }
    
    private func getScaleForCurrentDevice() -> CGFloat{
        switch DeviceGuru.hardware() {
        case .IPHONE_2G, .IPHONE_3G, .IPHONE_3GS, .IPHONE_4, .IPHONE_4_CDMA, .IPHONE_4S:
            return iPhone35inchScanle
        case .IPHONE_5, .IPHONE_5_CDMA_GSM, .IPHONE_5C,.IPHONE_5C_CDMA_GSM, .IPHONE_5S, .IPHONE_5S_CDMA_GSM:
            return iPhone4inchScanle
        case .IPHONE_6, .IPHONE_6S:
            return iPhone47inchScanle
        case .IPHONE_6_PLUS, .IPHONE_6S_PLUS:
            return iPhone55inchScanle
        default:
            return 1.0
        }
    }
}

