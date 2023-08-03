//
//  LottoViewController.swift
//  OneLine_DiaryProject
//
//  Created by 염성필 on 2023/08/03.
//

import UIKit

class LottoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    
    @IBOutlet var numberTextField: UITextField!
    
   let pickerView = UIPickerView()
    // Array(repeating: "A", count: 10)
    // repeating : 어떤 값을 반복시킬 것이냐 ex) "A", 100, ...
    // count : 반복 횟수
    
    // Array( _ ) : 범위 연산자로 원하는 값을 적어주면 된다 ex) 0...10, 20..<300
    let list = Array(Array(1...1100).reversed())
    
   // let list: [Int] = Array(1...1100).reversed()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        numberTextField.inputView = pickerView
        // textField의 색깔을 clear로 설정하여 커서가 없어진것 처럼 보여지게 할 수 있음 
        numberTextField.tintColor = .clear
    }
    
    // wheel로 돌아갈 수 있는 갯수 몇개 만들거냐 ex) 0 / 0 / 0 -> 3개
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        print(#function)
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(#function)
        return list.count
    }
    
    // value가 바뀌면 어떤걸 해줄것이냐? 휠 드르륵
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow - row: \(row), 데이터 : \(list[row])")
        numberTextField.text = "\(list[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(#function)
        return "\(list[row])"
    }
    
    
    
}
