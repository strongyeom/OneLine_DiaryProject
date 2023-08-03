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
    
    let list: [String] = ["영화", "애니메이션", "드라마", "장르", "지상파", "공중파"]
    
    
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
        numberTextField.text = list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(#function)
        return list[row]
    }
    
    
    
}
