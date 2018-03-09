//
//  ImageTransferArray.swift
//  myMap
//
//  Created by Jim Chuang on 2017/11/2.
//  Copyright © 2017年 test. All rights reserved.
//

import UIKit
   
    func imageToArray(imputImage:UIImage) -> Array<Array<Int>>
    {
        var loadArray = [[6,6,6,6,6,6],
                         [6,6,6,6,6,6],
                         [6,6,6,6,6,6],
                         [6,6,6,6,6,6],
                         [6,6,6,6,6,6]]
        
        let refImage = cropImage(screenShot: imputImage)
        for x in 0...29
        {
            let h = CGFloat((x/6) * 2 + 1) //height = 1 3 5 7 9
            let w = CGFloat((x%6) * 2 + 1) //width  = 1 3 5 7 9 11
            let color = refImage.getPixelColor(pos: CGPoint(x: refImage.size.width * w/12, y: refImage.size.height * h/10))
            
            let hight = x/6
            let width = x%6
            if color[0] > 190 && color[0] > (color[2]+20) && color[2] > 70
            {
                loadArray[hight][width] = 0
            }
            else if color[0] > 100 && color[2] < 35 && color[0] < (color[1]*2)
            {
                loadArray[hight][width] = 1
            }
            else if color[1] < 15 && color[2] > 100
            {
                loadArray[hight][width] = 2
            }
            else if color[0] < 100 && color[1] > 100 && color[2] > 100
            {
                loadArray[hight][width] = 3
            }
            else if color[0] > 100 && color[2] < 35 && color[0] > (color[1]*2)
            {
                loadArray[hight][width] = 4
            }
            else if color[1] > 160 && color[2] < 100
            {
                loadArray[hight][width] = 5
            }
            
            if w == 11
            {
                NSLog("color(\(x)) = \(color)\n\n")
            }
            else
            {
                NSLog("color(\(x)) = \(color)")
            }
        }
        NSLog("Load Array = \n\(loadArray[0])\n\(loadArray[1])\n\(loadArray[2])\n\(loadArray[3])\n\(loadArray[4])")
        
        return loadArray
    }
    
    func cropImage(screenShot:UIImage) -> UIImage{
        
        let crop = CGRect(x: 0,
                          y: screenShot.size.height*9/20,
                          width: screenShot.size.width,
                          height: screenShot.size.height*9.5/20)
        
        let cgImage = screenShot.cgImage?.cropping(to: crop)
        let image: UIImage = UIImage(cgImage: cgImage!)
        
        return image
    }

