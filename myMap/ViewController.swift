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
    var myArray: Array =  [[2, 3, 1, 5, 3, 4],
                           [5, 2, 4, 3, 2, 2],
                           [4, 5, 4, 3, 5, 1],
                           [0, 3, 0, 4, 4, 3],
                           [5, 4, 3, 1, 0, 3]]

    let stepLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepLabel.frame = CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height)
        //self.view.addSubview(stepLabel)
        stepLabel.numberOfLines = 0
        stepLabel.font = stepLabel.font.withSize(25)
        
        let myScreenWidth:CGFloat = self.view.frame.width
        let myScreenHeight:CGFloat = self.view.frame.height
        let myStartPosition = CGPoint(x: 0, y: self.view.frame.height/2)
        //let myImageWith = myScreenWidth/6
        //let myImageHeight = myScreenHeight/10
        NSLog("fullscreensize = \(fullScreenSize), myScreenWidth = \(myScreenWidth), myScreenHeight = \(myScreenHeight), myStartPosition = \(myStartPosition)")
for _ in 0...9{
        // Generate start array
        myArray = genStartArr(noComboArr: true)
        NSLog("self.original Array  = \n[\(myArray[0]),\n\(myArray[1]),\n\(myArray[2]),\n\(myArray[3]),\n\(myArray[4])]")
        
        // 生成盤面計算
        var totalCombo:Int = comboCal(comboArray: self.myArray)
        NSLog("myArray combo = \(totalCombo)")

        var routeArr = Array<Any>()
        var sLoc = 0
        totalCombo = 0
        (routeArr,sLoc,totalCombo) = rotationFunc(inputArray: self.myArray)
        NSLog("routeArr = \(routeArr.count)")
}
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
    
//MARK: - Button click
    @IBAction func loadPicBtn(_ sender: UIBarButtonItem)
    {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

//MARK: - UIImagePickerControllerDelegate
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

