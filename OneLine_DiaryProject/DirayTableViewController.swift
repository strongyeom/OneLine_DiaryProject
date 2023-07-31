//
//  DirayTableViewController.swift
//  OneLine_DiaryProject
//
//  Created by 염성필 on 2023/07/31.
//

import UIKit

class DirayTableViewController: UITableViewController {
    
    var list: [String] = ["테스트 1테스트 1테스트 1테스트 1테스트 1테스트 1테스트 1테스트 1테스트 1", "테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2 테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2", "테스트 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Dynamic Height: 1. automaticDimenstion, 2. Label numberOfLines 3. AutoLayout(여백)
        tableView.rowHeight = UITableView.automaticDimension
        
        // Xib로 테이블뷰 셀을 생성할 경우, 테이블뷰에 사용할 셀을 등록해주는 과정이 필요
        // bundle : 네비게이터 영역에 있는 파일들 //ex) SPM으로 설치 할 경우 Main에 있지 않기 때문에 추가 코드 필요
        let nib = UINib(nibName: "DiaryTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "DiaryTableViewCell")
    }
    
    
    @IBAction func addBtnClicked(_ sender: UIBarButtonItem) {

        // 1. 스토리보드 파일 찾기 ex) 스토리보드를 Main에 말고 다른 스토리보드 파일에 만들고 reference로 연결 할 수도 있기 때문에
        let stoyboard = UIStoryboard(name: "Main", bundle: nil)

        // 2. 스토리보드 파일 내 뷰 컨트롤러 찾기 - 버튼을 눌렀을때 어떤 VC를 띄울것인지 == cell 연결하는 것이랑 비슷함
        guard let vc = stoyboard.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController else { return }
        // 3. 화면 전환 방식 설정
//        vc.modalTransitionStyle = .crossDissolve
//
        vc.modalPresentationStyle = .fullScreen

        // 4. 화면 띄우기
        present(vc, animated: true)

    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryTableViewCell") as? DiaryTableViewCell else {
            return UITableViewCell()
        }
        
        let row = list[indexPath.row]
        
        cell.mainLabel.text = row
        cell.mainLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        cell.mainLabel.backgroundColor = .systemBlue
        cell.mainLabel.numberOfLines = 0
        cell.bgView.backgroundColor = .orange
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    
    //  1️⃣ 시스템 스와이핑
    // 1. 편집 허락 맡기
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        print(#fileID, #function, #line,"- <#comment#>" )
        return true
    }
    // 2. 스와이핑 액션 하기
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(#fileID, #function, #line,"- indexPath, editingStyle \(indexPath.row), \(editingStyle)" )
        
        list.remove(at: indexPath.row)
        // 데이터가 바뀌면 뷰에 업데이트를 해줘야 런타임 오류가 발생하지 않는다.
        tableView.reloadData()
    
    
    }
//
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//    }
//
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
//

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 1. 스토리보드 파일 찾기 ex) 스토리보드를 Main에 말고 다른 스토리보드 파일에 만들고 reference로 연결 할 수도 있기 때문에
        let stoyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 스토리보드 파일 내 뷰 컨트롤러 찾기 - 버튼을 눌렀을때 어떤 VC를 띄울것인지 == cell 연결하는 것이랑 비슷함
        guard let vc = stoyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        // 3. 화면 전환 방식 설정
//        vc.modalTransitionStyle = .crossDissolve
//
        // vc.modalPresentationStyle = .fullScreen
        vc.detailString = "디테일 뷰 입니다. \(indexPath.row)"
        // 4. 화면 띄우기
       // present(vc, animated: true)
        
        // ❗️ 인터페이스 빌더에 네비게이션 컨트롤러가 임베드 되어 있어야만 Push가 동작함 
        navigationController?.pushViewController(vc, animated: true)
    }
}
