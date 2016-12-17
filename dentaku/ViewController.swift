//
//  ViewController.swift
//  dentaku
//
//  Created by Kyoko Otsuka on 2016/12/16.
//  Copyright © 2016年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //ユーザが一つの値を入力している間はfalse
    //演算子もしくは、合計が押されるとtrueになる
    var userInputting: Bool = false
    
    //とりあえずボタンから入力された値を入れる箱
    var Digit: Int = 0
    //InputNumを複数桁にする箱
    var InputNum: Int = 0
    
    @IBOutlet weak var Output: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //0~9までの値入力
    //タグ値は出力値と同じ
    @IBAction func inputNumber(_ sender: UIButton) {
        let tagNum: Int = sender.tag
        
        switch tagNum{
        case 0:
            Digit = 0
        case 1:
            Digit = 1
        case 2:
            Digit = 2
        case 3:
            Digit = 3
        case 4:
            Digit = 4
        case 5:
            Digit = 5
        case 6:
            Digit = 6
        case 7:
            Digit = 7
        case 8:
            Digit = 8
        case 9:
            Digit = 9
        default : break
        }
        
        if userInputting == false && Digit == 0{
            Output.text = ""
        } else {
            InputNum += Digit
            userInputting = true
        }
        Output.text = String(InputNum)
    }
    
    //四則演算と小数点の入力
    //「.」:10「÷」:11「×」:12「+」:13「−」:14
    @IBAction func Symbol(_ sender: UIButton) {
    }
    
    //入力値の削除、決定
    //「×」:15「C」:16「合計」:17
    @IBAction func formula(_ sender: UIButton) {
    }
    
    
    
    
}

