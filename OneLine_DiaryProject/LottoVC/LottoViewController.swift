//
//  LottoViewController.swift
//  OneLine_DiaryProject
//
//  Created by 염성필 on 2023/08/03.
//

import UIKit
import Alamofire
import SwiftyJSON

// MARK: - Lotto
struct Lotto: Codable {
    let totSellamnt: Int
    let returnValue, drwNoDate: String
    let firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo: Int
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
}

class LottoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    
    
    @IBOutlet var bnusNumberLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
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
        print("1")
        print("2 ")
        // networkig()
        print("4")
        pickerView.delegate = self
        pickerView.dataSource = self
        // inputView : VC를 만들지 않아도 하단에 modal뷰 처럼 만들어 준다.
        numberTextField.inputView = pickerView
        // textField의 색깔을 clear로 설정하여 커서가 없어진것 처럼 보여지게 할 수 있음 
        numberTextField.tintColor = .clear
        fetchNetworkig(text: 1010)
       print("5")
    }
    
    // Work with Alamofire
    func fetchNetworkig(text: Int) {
        
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(text)"
        
        AF.request(url, method: .get).validate()
            .responseDecodable(of: Lotto.self) { response in
                guard let lotto = response.value else { return }
                self.dateLabel.text = lotto.drwNoDate
                self.bnusNumberLabel.text = "\(lotto.bnusNo)번"
            
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                print("JSON: \(json)")
//                print("3")
//                let date = json["drwNoDate"].stringValue
//                let bonusNumber = json["bnusNo"].intValue
//
//                print(date, bonusNumber)
//                self.dateLabel.text = date
//                self.bnusNumberLabel.text = "\(bonusNumber)번"
//
//            case .failure(let error):
//                print(error)
//            }
        }
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
        fetchNetworkig(text: list[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(#function)
        return "\(list[row])"
    }
    
    
    
}
