//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 實松保雄 on 2020/06/23.
//  Copyright © 2020 ysanematsu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

 
    @IBOutlet weak var imageview2: UIImageView!
    @IBOutlet weak var modoru2: UIButton!
    //画像の配列を作成
       //let imageNameArray = ["sakura1", "sakura2", "nabana1","nabana2"]
    //1画面目から配列を受け取るための変数を宣言
    var imageNameArray2 = [""]
    //1画面目の配列インデックスを受け取るための変数を宣言
    var selectedImage: Int = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //受け取った配列とインデックスをresultに代入
        let result = imageNameArray2[selectedImage]
       imageview2.image = UIImage(named: result)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
