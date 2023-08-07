//
//  ViewController.swift
//  OneLine_DiaryProject
//
//  Created by 염성필 on 2023/07/31.
//

import UIKit

enum TransitionType: String {
    case add = "추가 화면"
    case edit = "수정 화면"
}
// 1. UITextViewDelegate
// 2. textView.delegate = self : 부하직원 연결
// 3. 필요한 메서드 호출해서 구현
class AddViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var textView: UITextView!
    var type: TransitionType = .add
    
    var editText: String = ""
    
    // 플레이스 홀더
    let placeHolderText = "내용을 입력해주세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = editText
        title = type.rawValue
        
        textView.delegate = self
        
        
        
        switch type {
        case .add:
            // + 버튼에서 Navigation으로 감쌌기 때문에 제목과 옵션은 띄어지는 부분에서 추가 하면 됨
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(cloaseBtnClicked(_: )))
            
            // navigationItem 적용되고 나서 tintColor를 적용해야 함
            navigationItem.leftBarButtonItem?.tintColor = .orange

            textView.text = placeHolderText
            textView.textColor = .red
            
        case .edit:
                print("edit 일때")
        }
        
  
        setBgColor()
    }
    
    
    // MARK: - 텍스트 뷰의 글자가 바뀔때 마다 호출됨 ex) 글자수 체크 가능
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
        title = "숫자 증가 \(textView.text.count)"
    }
    
    // MARK: - 편집이 시작 됐을때 ( 커서가 시작될 때 )
    // 플레이스 홀더와 텍스트뷰 글자가 같다면 clear, color
    func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
     //   if textView.text == placeHolderText {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
            
        }
    }
    
    // MARK: - 편집이 끝났을때 ( 커서가 없어지는 순간 )
    // 사용자가 아무 글자도 안 썼으면 플레이스 홀더 글자 보이게 설정
    func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)
        if textView.text.isEmpty {
            textView.text = placeHolderText
            textView.textColor = .red
        }
    }
    
    @objc func cloaseBtnClicked(_ sender: UIBarButtonItem) {
        // 화면이 떴을때 정보는 이전 화면에서 다 갖고 있기 때문에 dismiss를 통해서 사라지게만 하면 됨
        // push - pop , modal - dismiss
        print(#fileID, #function, #line,"- <#comment#>" )
        dismiss(animated: true)
        
        // 함수 실행은 되는데 동작하지 않음 => 짝꿍이 맞지 않기 때문에
        // navigationController?.popViewController(animated: true)
    }
}

