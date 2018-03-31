//
//  ViewController.swift
//  myMap
//
//  Created by Jim Chuang on 2017/8/29.
//  Copyright © 2017年 test. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    let fullScreenSize = UIScreen.main.bounds.size
    var myArray :Array = [[1,1,1,0,4,4],
                          [1,1,5,1,4,4],
                          [2,5,5,3,4,3],
                          [2,5,5,3,4,3],
                          [2,5,3,3,3,3]]
    var myArray3 :Array = [[1,1,0,0,1,1],
                          [0,0,1,1,0,0],
                          [1,1,0,0,1,1],
                          [0,0,1,5,0,0],
                          [1,1,0,0,5,1]]
    var myArray4 :Array =  [[1,2,3,5,1,1],
                           [1,2,3,4,0,0],
                           [1,2,3,4,1,1],
                           [1,2,3,4,0,0],
                           [5,5,5,4,1,1]]
    var myArray2: Array =  [[2, 5, 5, 4, 3, 3],
                           [5, 3, 4, 3, 1, 1],
                           [2, 3, 0, 2, 1, 0],
                           [4, 0, 2, 5, 5, 0],
                           [0, 1, 1, 2, 0, 2]]

    // Start Array
    var noRepeatArray:Bool = true
    var genStartArray:Bool = false
    
    // Start Roration
    var genStartRotation:Bool = true
    var targetComboNumbers:Int = 7
    
    let stepLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepLabel.frame = CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height)
        self.view.addSubview(stepLabel)
        stepLabel.numberOfLines = 0
        stepLabel.font = stepLabel.font.withSize(25)
        
        let myScreenWidth:CGFloat = self.view.frame.width
        let myScreenHeight:CGFloat = self.view.frame.height
        let myStartPosition = CGPoint(x: 0, y: self.view.frame.height/2)
        //let myImageWith = myScreenWidth/6
        //let myImageHeight = myScreenHeight/10
        NSLog("fullscreensize = \(fullScreenSize), myScreenWidth = \(myScreenWidth), myScreenHeight = \(myScreenHeight), myStartPosition = \(myStartPosition)")
        
        //MARK: Generate start array
        var hasCombo : Bool = false
        if genStartArray == true
        {
            repeat
            {
                hasCombo = false
                for arrayHeight in 0...4
                {
                    let arrayHeightMinus1 = arrayHeight - 1
                    let arrayHeightMinus2 = arrayHeight - 2
                    for arrayWidth in 0...5
                    {
                        myArray[arrayHeight][arrayWidth] = Int(arc4random_uniform(6))
                        let arrayWidthMinus1 = arrayWidth - 1
                        let arrayWidthMinus2 = arrayWidth - 2
                        
                        if arrayWidth >= 2
                        {
                            if myArray[arrayHeight][arrayWidth] == myArray[arrayHeight][arrayWidthMinus1] && myArray[arrayHeight][arrayWidth] == myArray[arrayHeight][arrayWidthMinus2]
                            {
                                //NSLog("width + 1")
                                hasCombo = true
                            }
                        }
                        if arrayHeight >= 2
                        {
                            if myArray[arrayHeight][arrayWidth] == myArray[arrayHeightMinus1][arrayWidth] && myArray[arrayHeight][arrayWidth] == myArray[arrayHeightMinus2][arrayWidth]
                            {
                                //NSLog("height + 1")
                                hasCombo = true
                            }
                        }
                    } /// end of for arrayWidth
                } /// end of for arrayHeight
            } while hasCombo == noRepeatArray
        }
        
        NSLog("self.original Array1 = \n\(myArray[0])\n\(myArray[1])\n\(myArray[2])\n\(myArray[3])\n\(myArray[4])")
        
        // 生成盤面計算
        var totalCombo:Int = comboCal(comboArray: self.myArray)
        NSLog("myArray combo = \(totalCombo)")

        
        // 清除測試
        //clearUp(originalArray: myInputArray)
        
        //MARK: Colletcion layout
        // 設置底色
        self.view.backgroundColor = UIColor.white
        
        // 建立 UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
        
        // 設置 section 的間距 四個數值分別代表 上、左、下、右 的間距
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        // 設置每一行的間距
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        // 設置每個 cell 的尺寸
        layout.itemSize = CGSize(width: CGFloat(fullScreenSize.width)/6, height: CGFloat(fullScreenSize.height)/10)
        
        // 設置 header 及 footer 的尺寸
        layout.headerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
        layout.footerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
        
        // 建立 UICollectionView
        let myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 20, width: fullScreenSize.width, height: fullScreenSize.height - 20), collectionViewLayout: layout)
        
        // 註冊 cell 以供後續重複使用
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        // 註冊 section 的 header 跟 footer 以供後續重複使用
        myCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
        myCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Footer")
        
        // 設置委任對象
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        // 加入畫面中
        //self.view.addSubview(myCollectionView)
        
    }
    
    // MARK: - UICollectionViewDelegate
    
    // 必須實作的方法：每一組有幾個 cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    // 必須實作的方法：每個 cell 要顯示的內容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 依據前面註冊設置的識別名稱 "Cell" 取得目前使用的 cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        
        let xAxis : Int = indexPath.item % 6
        let yAxis : Int = indexPath.item / 6
        var myColor : UIColor = UIColor.clear
        let colorNumber = myArray[yAxis][xAxis]
        
        switch colorNumber {
        case 0:
            myColor = UIColor(colorLiteralRed: 1, green: 0.8, blue: 0.8, alpha: 1)
        case 1:
            myColor = UIColor.yellow
        case 2:
            myColor = UIColor(colorLiteralRed: 0.4, green: 0.0, blue: 0.3, alpha: 1)//UIColor.purple
        case 3:
            myColor = UIColor.blue
        case 4:
            myColor = UIColor.red
        case 5:
            myColor = UIColor.green
        default:
            myColor = UIColor.clear
        }
        
        cell.imageView.backgroundColor = myColor
        // 設置 cell 內容 (即自定義元件裡 增加的圖片與文字元件)
        cell.imageView.image = UIImage(named: "\(indexPath.item + 1).jpg")
        cell.titleLabel.text = "\(colorNumber)"
        
        return cell
    }
    
    // 有幾個 section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 點選 cell 後執行的動作
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("你選擇了第 \(indexPath.section + 1) 組的")
        print("第 \(indexPath.item + 1) 張圖片")
    }
    
    // 設置 reuse 的 section 的 header 或 footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 建立 UICollectionReusableView
        var reusableView = UICollectionReusableView()
        
        // 顯示文字
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: 40))
        label.textAlignment = .center
        
        // header
        if kind == UICollectionElementKindSectionHeader {
            // 依據前面註冊設置的識別名稱 "Header" 取得目前使用的 header
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath)
            // 設置 header 的內容
            reusableView.backgroundColor = UIColor.darkGray
            label.text = "Header";
            label.textColor = UIColor.white
            
        } else if kind == UICollectionElementKindSectionFooter {
            // 依據前面註冊設置的識別名稱 "Footer" 取得目前使用的 footer
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Footer", for: indexPath)
            // 設置 footer 的內容
            reusableView.backgroundColor = UIColor.cyan
            label.text = "Footer";
            label.textColor = UIColor.black
            
        }
        
        reusableView.addSubview(label)
        return reusableView
    }
    
//MARK: - UIImagePickerControllerDelegate
    @IBAction func loadPicBtn(_ sender: UIBarButtonItem)
    {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height))
        let image:UIImage! = info[UIImagePickerControllerOriginalImage] as! UIImage
        let inputImageArray = imageToArray(imputImage: image)
        var displayStepArray = Array<Any>()
        var displayStratLocation:Int
        var displayTotalCombo:Int
        (displayStepArray,displayStratLocation,displayTotalCombo) = rotationFunc(inputArray: inputImageArray)
        
        stepLabel.text = "Total Combo = \(displayTotalCombo), Start Location = \(displayStratLocation) \n\n step(\(displayStepArray.count)) = \(displayStepArray)"
        NSLog("step Array = \(displayStepArray)")
        
        //退出
        picker.dismiss(animated: true, completion:nil)
    }
    
//MARK: - Start Rotation Function
    func rotationFunc(inputArray:Array<Array<Int>>) -> (Array<Any>,Int,Int)
    {
        // 初始設定
        var myInputArray = inputArray
        var totalCombo = comboCal(comboArray: myInputArray)
        var whileLoopCombo:Int = 0
        var startLocation :Int = -1 // 起手位置
        var nextStartLocation:Int = startLocation // 下次起始位置
        var nowLocation:Int = 0 // 目前位置
        var routeSave:Array<Any> = [] // 暫存路徑
        var totalRouteSave:Array<Any> = [] // 完整路徑
        var calComboArray = myInputArray // 計算盤面
        let recoverArray = myInputArray // 回復盤面
        var count:Int = 0 // 總次數計算
        var interruptCount:Int = 0
        var changeStartLocation:Bool = false // 更換起手位置
        
        // 同意處理
        if genStartRotation == true
        {
            for oneCycle in 1...90
            {
                if oneCycle == 31 || oneCycle == 61 || oneCycle == 91
                {
                    targetComboNumbers -= 1
                    NSLog("targetComboNumbers = \(targetComboNumbers)")
                }
                // 目標判定
                if totalCombo >= targetComboNumbers
                {
                    // 中斷for 迴圈
                    break
                }
                else
                {
                    // 盤面回復
                    myInputArray = recoverArray
                    calComboArray = recoverArray
                    
                    // 起手位置變更
                    startLocation = (startLocation + 1) % 30
                    nextStartLocation = startLocation
                    changeStartLocation = false
                    
                    // 路徑清空
                    totalRouteSave = []
                    routeSave = []
                    totalCombo = 0
                    
                    // 開始處理
                    while (totalCombo < targetComboNumbers) && (changeStartLocation == false)
                    {
                        interruptCount = 0
                        whileLoopCombo = totalCombo
                        
                        // 3x loop
                        while totalCombo < (whileLoopCombo+3)
                        {
                            interruptCount += 1
                            if interruptCount % 30 == 0
                            {
                                totalCombo = comboCal(comboArray: myInputArray)
                                break
                            }
                            (calComboArray,routeSave,nowLocation) = startRotation(originalArray: myInputArray,
                                                                                  startLocation: nextStartLocation,
                                                                                  stepFrom:10,
                                                                                  stepTo:11)
                            totalCombo = comboCal(comboArray: calComboArray)
                        }
                        
                        count += interruptCount
                        interruptCount = 0
                        
                        // 2x loop
                        while totalCombo < (whileLoopCombo+2)
                        {
                            interruptCount += 1
                            if interruptCount % 50 == 0
                            {
                                totalCombo = comboCal(comboArray: myInputArray)
                                break
                            }
                            (calComboArray,routeSave,nowLocation) = startRotation(originalArray: myInputArray,
                                                                                  startLocation: nextStartLocation,
                                                                                  stepFrom:8,
                                                                                  stepTo:9)
                            totalCombo = comboCal(comboArray: calComboArray)
                        }
                        
                        count += interruptCount
                        interruptCount = 0
                        
                        // 1x loop
                        while totalCombo < (whileLoopCombo+1)
                        {
                            interruptCount += 1
                            if interruptCount % 100 == 0
                            {
                                // 重置起點
                                changeStartLocation = true
                                totalCombo = comboCal(comboArray: myInputArray)
                                break
                            }
                            (calComboArray,routeSave,nowLocation) = startRotation(originalArray: myInputArray,
                                                                                  startLocation: nextStartLocation,
                                                                                  stepFrom:4,
                                                                                  stepTo:7)
                            totalCombo = comboCal(comboArray: calComboArray)
                        }
                        
                        count += interruptCount
                        interruptCount = 0
                        
                        //if totalCombo != 0 {NSLog("total combo =\(totalCombo)");NSLog("count = \(count)")}
                        
                        // 更新盤面起始位置
                        nextStartLocation = nowLocation
                        
                        // 更新完整路徑
                        totalRouteSave = totalRouteSave + routeSave
                        
                        // 盤面更新
                        myInputArray = calComboArray
                    }
                }
            }
        }
        
        for x in 0...totalRouteSave.count-1
        {
            switch totalRouteSave[x] {
            case 1 as Int:
                totalRouteSave[x] = "右"
            case -1 as Int:
                totalRouteSave[x] = "左"
            case 6 as Int:
                totalRouteSave[x] = "下"
            case -6 as Int:
                totalRouteSave[x] = "上"
            default:
                totalRouteSave[x] = "謎"
            }
        }
        
        NSLog("StartLocation = \(startLocation)")
        NSLog("nextStartLocation = \(nextStartLocation)")
        NSLog("total route(\(totalRouteSave.count)) = \(totalRouteSave)")
        
        // 迴圈執行數目
        NSLog("self.count = \(count)")
        
        totalCombo = comboCal(comboArray: myInputArray)
        NSLog("self.totalCombo = \(totalCombo)")
        
        // 重組後陣列
        NSLog("self.original Array2 = \n\(myInputArray[0])\n\(myInputArray[1])\n\(myInputArray[2])\n\(myInputArray[3])\n\(myInputArray[4])")
        
        return (totalRouteSave,startLocation,totalCombo)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

