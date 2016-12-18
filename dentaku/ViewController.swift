
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
    
    //演算子を押す前の数字
    var target: Double = 0.0
    
    //演算子を押した後の数字
    var resultValue: Double = 0.0
    
    //targetに値が入っているかどうか
    var isStacked: Bool = false
    
    //演算子ボタンを押した後かどうか
    var afterCalc: Bool = false
    
    //ユーザが一つの値を入力している間はfalse
    //演算子もしくは、合計が押されるとtrueになる
    var userInputting: Bool = false
    
    @IBOutlet weak var Output: UITextField!
    
    @IBOutlet weak var Result: UITextField!
    
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

        if userInputting == false {
            userInputting = true
            InputNum = (sender.titleLabel?.text)!
            
            //Outputに出力
            Output.text = InputNum
        } else {//それ以外は、InputNumの値をOutputに設定して、新しくInputの次桁に入力。
            
            InputNum = Output.text!
            InputNum += (sender.titleLabel?.text)!
            
            //targetに値が入っていれば、新しく入った値からresultvalueに設定
            //出力は前項も
            if isStacked == true
            {
                resultValue = Double(InputNum)!
                Output.text = String(target) + InputNum
            } else {
            
            //outputに出力
            Output.text = InputNum
            }
        }
    }
    
        //四則演算の入力
        @IBAction func Symbol(_ sender: UIButton) {
            
            //数値が見入力だったら演算子は入力できない
            if userInputting == false {
                InputSym = ""
            } else { //InputSymに演算子を設定。既に入っている数値はtargetに設定し、inputを初期化
                InputSym = (sender.titleLabel?.text)!
                target = Double(InputNum)!
                InputNum = ""
                afterCalc = true
                isStacked = true
            }
            
            Output.text = InputNum + InputSym
        }
        
        
        @IBAction func Caluculate(_ sender: UIButton) {
            //設定されているInputSymを持ってくる
            let currentSym: String = InputSym
            afterCalc = true
            isStacked = false
            switch currentSym {
            case "+":
                target += resultValue
            case "-":
                target -= resultValue
            case "×":
                target *= resultValue
            case "÷":
                target /= resultValue
            default:
                break
            }
            //計算結果をresultに出力
            Result.text = String(target)
            
        }
        
        
}

