//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 實松保雄 on 2020/06/19.
//  Copyright © 2020 ysanematsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    //,UIGestureRecognizerDelegate
    // タイマー
    var timer: Timer!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var susumu: UIButton!
    @IBOutlet weak var modoru: UIButton!
    @IBOutlet weak var saiseitoteishi: UIButton!
    
      //画像の配列を作成
    let imageNameArray = ["sakura1", "sakura2", "nabana1","nabana2"]
    
    //配列番号を指定
    var disprayImageNo = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //画像を表示
        let name =  imageNameArray[disprayImageNo]
            //let image = UIImage(named: name)
            imageView.image = UIImage(named: name)
     }
    
    //susumuボタンをタップで、disprayImageNoを＋１する
    @IBAction func susumuTap(_ sender: Any) {
        disprayImageNo = disprayImageNo + 1
        //配列の要素数を取得する
        let result = imageNameArray.count
    //disprayImageNoが配列の要素数より大きいまたは同じだったらdisprayImageNoを0に戻す
        if disprayImageNo >= result {
            disprayImageNo = 0
        }
        //画像を表示
        let name =  imageNameArray[disprayImageNo]
           // let image = UIImage(named: name)
        imageView.image = UIImage(named: name)
    }
    
    @IBAction func modoruTap(_ sender: Any) {
        disprayImageNo = disprayImageNo - 1
            //配列の要素数を取得する
            let result = imageNameArray.count
        //disprayImageNoが0より小さいときはdisprayImageNoをresult-1に戻す
            if disprayImageNo < 0 {
                disprayImageNo = result - 1
            }
            //画像を表示
            let name =  imageNameArray[disprayImageNo]
               // let image = UIImage(named: name)
            imageView.image = UIImage(named: name)
    }
    
    //2.0秒ごとにdisprayImageNoに1プラス
    @objc func updateTimer(_ timer: Timer) {
        //updateTimerが始動したらdisprayImageNoにプラス1する
        disprayImageNo += 1
        //配列の要素数を取得
        let result = imageNameArray.count
        //配列の要素数をこえたらdisprayImageNoを0に戻す
        if disprayImageNo == result {
            disprayImageNo = 0
        }
        //画像を表示
        let name =  imageNameArray[disprayImageNo]
           // let image = UIImage(named: name)
        imageView.image = UIImage(named: name)
    }
    
    @IBAction func saiseiTap(_ sender: Any) {
        //ボタンを押した時にtimerがnilならば再生する
        if self.timer == nil {
        // タイマー作成、始動
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        //再生ボタン始動時に進むと戻るボタンの使用を不可にする
        susumu.isEnabled = false
        modoru.isEnabled = false
        //再生時にボタン表示を停止にする
        saiseitoteishi.setTitle("停止", for: .normal)
    //ボタンを押した時にtimerがnilでなければ（スライドショーが動いていたら）
        }else if self.timer != nil {
        // タイマーを停止
        self.timer.invalidate()
    //タイマーをnilに戻す（タイマーを停止しただけではnilに戻らない。再度、再生したい時にnilである条件にするため、ここでnilに戻しておく）
        self.timer = nil
        //停止時にボタン表示を再生にする
        saiseitoteishi.setTitle("再生", for: .normal)
        //進むと戻るボタンを再表示
        susumu.isEnabled = true
        modoru.isEnabled = true
        
        }
       
    }
    //画面遷移
            override func prepare(for segue: UIStoryboardSegue, sender: Any!){

                   let resultViewController: ResultViewController = segue.destination as! ResultViewController
                //2画面目のimageNameArray2にimageNameArray配列を渡す
               resultViewController.imageNameArray2 = imageNameArray
                //2画面目のselectedImageに配列のインデックス番号を渡す
               resultViewController.selectedImage = disprayImageNo
                //timerが動いている状態で画面遷移が起こったらタイマーを止め、nilにする
                if self.timer != nil {
                    self.timer.invalidate()
                    self.timer = nil
                }
                //停止時にボタン表示を再生にする
                saiseitoteishi.setTitle("再生", for: .normal)
                //進むと戻るボタンを再表示
                susumu.isEnabled = true
                modoru.isEnabled = true
            
           }
}







