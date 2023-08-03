//
//  ViewController.swift
//  OneLine_DiaryProject
//
//  Created by 염성필 on 2023/07/31.
//

import UIKit

enum TransitionType {
    case add
    case edit
}

class AddViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    var type: TransitionType = .add
    var editText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        switch type {
        case .add:
            // + 버튼에서 Navigation으로 감쌌기 때문에 제목과 옵션은 띄어지는 부분에서 추가 하면 됨
            navigationItem.title  = "추가 화면"
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(cloaseBtnClicked(_: )))
            
            // navigationItem 적용되고 나서 tintColor를 적용해야 함
            navigationItem.leftBarButtonItem?.tintColor = .orange
            textView.text = ""
        case .edit:
            title = "수정 화면"
            guard let editText else { return }
            textView.text = editText
        }
        
  
        setBgColor()
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

