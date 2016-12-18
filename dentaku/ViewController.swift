//
//  ViewController.swift
//  dentaku
//
//  Created by Kyoko Otsuka on 2016/12/16.
//  Copyright © 2016年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //ユーザが入力した数値の格納場所
    var InputNum: String = ""
    
    //ユーザが入力した演算子
    var InputSym: String = ""
    
    //演算対象の数字
    var target: Double? = nil
    
    //ユーザが一つの値を入力している間はfalse
    //演算子もしくは、合計が押されるとtrueになる
    var userInputting: Bool = false
    
    @IBOutlet weak var Output: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //0~9、「.」までの値入力
    @IBAction func inputNumber(_ sender: UIButton) {
        
        //数値が初入力だったら、UserInputtingをtrueにして、InputNumに値を入力
        //それ以外は、InputNumの値をOutputに設定して、新しくInputの次桁に入力
        if userInputting == false {
            userInputting = true
            InputNum = (sender.titleLabel?.text)!
        } else {
            InputNum = Output.text!
            InputNum += (sender.titleLabel?.text)!
        }
        
        //outputに出力
        Output.text = InputNum
        
    }
    
    //四則演算と小数点の入力
    //「÷」:11「×」:12「+」:13「−」:14
    @IBAction func Symbol(_ sender: UIButton) {
        
        //数値が見入力だったら
        if userInputting == false {
            InputSym = ""
        } else {
            InputSym = (sender.titleLabel?.text)!
        }
        
        Output.text = InputNum + InputSym
    }
    
    
    @IBAction func Caluculate(_ sender: UIButton) {
    }
    
    
}

