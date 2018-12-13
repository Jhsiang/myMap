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


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout{

    @IBOutlet var myCollectionView: UICollectionView!

    @IBOutlet var stepLabel: UILabel!


    let fullScreenSize = UIScreen.main.bounds.size
    var myArray: Array =  [[2, 3, 1, 5, 3, 4],
                           [5, 2, 4, 3, 2, 2],
                           [4, 5, 4, 3, 5, 1],
                           [0, 3, 0, 4, 4, 3],
                           [5, 4, 3, 1, 0, 3]]
    var myArray2: Array =  [[2, 5, 5, 4, 3, 3],
                            [5, 3, 4, 3, 1, 1],
                            [2, 3, 0, 2, 1, 0],
                            [4, 0, 2, 5, 5, 0],
                            [0, 1, 1, 2, 0, 2]]
    var myArray3: Array =  [[7, 7, 7, 7, 7, 7],
                            [7, 0, 0, 0, 7, 7],
                            [7, 7, 7, 0, 0, 7],
                            [7, 7, 7, 7, 0, 7],
                            [7, 7, 7, 7, 0, 7]]
    var resultArr = Array<Array<Int>>()

    var showResultArr = false
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stepLabel.numberOfLines = 0
        stepLabel.font = stepLabel.font.withSize(20)

        // Generate start array
        //myArray = genStartArr(noComboArr: true)
        NSLog("self.original Array  = \n[\(myArray[0]),\n\(myArray[1]),\n\(myArray[2]),\n\(myArray[3]),\n\(myArray[4])]")
        
        // 生成盤面計算
        var totalCombo:Int = comboCal(comboArray: self.myArray)
        NSLog("myArray combo = \(totalCombo)")

    /*
        var routeArr = Array<Any>()
        var sLoc = 0
        totalCombo = 0
        (routeArr,sLoc,totalCombo) = rotationFunc(inputArray: self.myArray)
        NSLog("routeArr = \(routeArr.count)")
    */
        // 清除測試
        //clearUp(originalArray: myInputArray)

        let autoClick = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                NSLog("trigger start")
                let myBtn = UIButton()
                self.rotationClick(myBtn)
                NSLog("trigger end")
            }
        }
        autoClick()

        let test1 = {
            var combo = 0
            var count = 0
            var loc:Int? = nil
            var mySave = Array<Any>()
            var resu = Array<Array<Int>>()
            repeat{
                count += 1
                let aa = startRotation(originalArray: self.myArray, startLocation: 0, stepFrom: 5, stepTo: 5)
                loc = aa.nowLoc
                combo = comboCal(comboArray: aa.resultArr)
                mySave = aa.routeSave
                resu = aa.resultArr
            } while combo < 1
            print("count = ",count)
            print("combo = ",combo)
            print("now loc = ",loc)
            print("mySave = ",mySave)
            for x in resu{
                print(x)
            }
        }
        //test1()
    }
    
// MARK: - UICollectionViewDelegate
    // 必須實作的方法：每一組有幾個 cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    // 必須實作的方法：每個 cell 要顯示的內容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 依據前面註冊設置的識別名稱 "Cell" 取得目前使用的 cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BallCollectionViewCell
        
        let xAxis : Int = indexPath.item % 6
        let yAxis : Int = indexPath.item / 6
        var myColor : UIColor = UIColor.clear
        let colorNumber = showResultArr ? resultArr[yAxis][xAxis] : myArray[yAxis][xAxis]

        switch colorNumber {
        case 0:
            myColor = UIColor(red: 1, green: 0.8, blue: 0.8, alpha: 1)
        case 1:
            myColor = UIColor.yellow
        case 2:
            myColor = UIColor(red: 0.4, green: 0.0, blue: 0.3, alpha: 1)//UIColor.purple
        case 3:
            myColor = UIColor.blue
        case 4:
            myColor = UIColor.red
        case 5:
            myColor = UIColor.green
        default:
            myColor = UIColor.clear
        }
        
        cell.backgroundColor = myColor
        cell.numLabel.text = "\(colorNumber)"


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

//MARK: - UICollectionViewDelegateFlowLayout
    // cell 尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGSize = CGSize(width: myCollectionView.frame.width/6, height: collectionView.frame.height/5)
        return cellSize
    }

    // 左右間距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }

    // 上下間距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//MARK: - Button click
    @IBAction func loadPicBtn(_ sender: UIBarButtonItem)
    {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func rotationClick(_ sender: UIButton) {
        print("rotation btn click")
        sender.titleLabel?.alpha = 0.5
        sender.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
            var displayStepArray = Array<Any>()
            var displayStratLocation:Int
            var displayTotalCombo:Int
            //(displayStepArray,displayStratLocation,displayTotalCombo,self.resultArr) = rotationFunc(inputArray: self.myArray)
            (displayStepArray,displayStratLocation,displayTotalCombo,self.resultArr) = rotAlgo(inputArray: self.myArray)
            sender.isEnabled = true
            sender.titleLabel?.alpha = 1
            self.stepLabel.text = "Total Combo = \(displayTotalCombo), Start Location = \(displayStratLocation) \n\n step(\(displayStepArray.count)) = \(displayStepArray)"
        }
    }

    @IBAction func oriShowClick(_ sender: UIButton) {
        showResultArr = false
        self.myCollectionView.reloadData()
    }

    @IBAction func resultShowClick(_ sender: UIButton) {
        if resultArr.count == 5{
            showResultArr = true
            self.myCollectionView.reloadData()
        }else{
            let alerView = UIAlertView(title: "錯誤", message: "資料為空", delegate: self, cancelButtonTitle: "確認")
            alerView.show()
        }
    }

    @IBAction func refreshClick(_ sender: UIBarButtonItem) {
        myArray = genStartArr(noComboArr: true)
        myCollectionView.reloadData()
    }

//MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {

        let image:UIImage! = info[UIImagePickerControllerOriginalImage] as! UIImage
        let inputImageArray = imageToArray(imputImage: image)
        self.myArray = inputImageArray
        self.myCollectionView.reloadData()

        
        //退出
        picker.dismiss(animated: true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

