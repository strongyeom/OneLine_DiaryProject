//
//  SettingTableViewController.swift
//  OneLine_DiaryProject
//
//  Created by 염성필 on 2023/08/01.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    
    case total, personal, etc
    
    var mainOptions: String {
            // switch self, self: 자기 자신의 프로퍼티들
            switch self {
            case .total:
                return "전체 설정"
            case .personal:
                return "개인"
            case .etc:
                return "기타"
            }
    }
    
    var subOptions: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["두번째 내용", "두번째 실험실", "두번째 버전 정보",
                    "두번째 입니다."]
        case .etc:
            return ["세번째 세번째 공지사항"]
        }
    }
}

class SettingTableViewController: UITableViewController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    
    // 0번 3개, 1번 4개, 2번 1개 가져오기
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SettingOptions.allCases[section].subOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell")!
        
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOptions[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].mainOptions
    }
    
    
}
