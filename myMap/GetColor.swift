//
//  GetColor.swift
//  myMap
//
//  Created by Jim Chuang on 2017/11/2.
//  Copyright © 2017年 test. All rights reserved.
//

import UIKit

extension UIImage {
    func getPixelColor(pos: CGPoint) -> [Int] {
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = Int(data[pixelInfo]) // CGFloat(255.0)
        let g = Int(data[pixelInfo+1]) // CGFloat(255.0)
        let b = Int(data[pixelInfo+2]) // CGFloat(255.0)
        //let a = Int(data[pixelInfo+3]) // CGFloat(255.0)
        
        return [r,g,b]
    }
}

extension UIColor {
    
    func rgba() -> [Int] {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)
            
            return [iRed,iGreen,iBlue,iAlpha]
        } else {
            // Could not extract RGBA components:
            return []
        }
    }
}

