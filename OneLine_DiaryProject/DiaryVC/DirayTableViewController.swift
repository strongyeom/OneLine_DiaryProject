//
//  DirayTableViewController.swift
//  OneLine_DiaryProject
//
//  Created by 염성필 on 2023/07/31.
//

import UIKit

class DirayTableViewController: UITableViewController {
    
    var list: [String] = ["테스트 1테스트 1테스트 1테스트 1테스트 1테스트 1테스트 1테스트 1테스트 1", "테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2 테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2", "테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 테스트 3 "]
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Dynamic Height: 1. automaticDimenstion, 2. Label numberOfLines 3. AutoLayout(여백)
        tableView.rowHeight = UITableView.automaticDimension
        
        // Xib로 테이블뷰 셀을 생성할 경우, 테이블뷰에 사용할 셀을 등록해주는 과정이 필요
        // bundle : 네비게이터 영역에 있는 파일들 //ex) SPM으로 설치 할 경우 Main에 있지 않기 때문에 추가 코드 필요
        let nib = UINib(nibName: DiaryTableViewCell.identifier, bundle: nil)
      
        
        tableView.backgroundColor = .clear
        setBgColor()
        tableView.register(nib, forCellReuseIdentifier: DiaryTableViewCell.identifier)
    }
    
    
    // MARK: - CollectionView로 넘어가기
    @IBAction func searchBtnClicked(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(withIdentifier: "SearchCollectionViewController") as! SearchCollectionViewController
        /*
         
         🧐 같은 Main 스토리 보드에 화면 전환하려는 스토리보드가 있다면 storyboard?에 붙이고 작성하면 간결해짐
         
         let vcSameStoryboard = storyboard?.instantiateViewController(withIdentifier: "SearchCollectionViewController") as! SearchCollectionViewController


         navigationController?.pushViewController(vcSameStoryboard, animated: true)
         */
        
        // 띄어지는 view에 네비게이션 바를 넣고 싶을때
        navigationController?.pushViewController(vc, animated: true)
 
    }
    
    
    
    
    // MARK: - AddBtnClicked
    @IBAction func addBtnClicked(_ sender: UIBarButtonItem) {

        // 1. 스토리보드 파일 찾기 ex) 스토리보드를 Main에 말고 다른 스토리보드 파일에 만들고 reference로 연결 할 수도 있기 때문에
        let stoyboard = UIStoryboard(name: "Main", bundle: nil)

        // 2. 스토리보드 파일 내 뷰 컨트롤러 찾기 - 버튼을 눌렀을때 어떤 VC를 띄울것인지 == cell 연결하는 것이랑 비슷함
        guard let vc = stoyboard.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController else { return }
        vc.type = .add
        // 2 - 1 (옵션) 네비게이션 컨트롤러가 있는 형태(제목바)로 Present 하고 싶은 경우
        // 네비케이션으로 감싼다면, present 전환 방식도 nav로 수정해줘야함
        let nav = UINavigationController(rootViewController: vc)
        
        
        
        // 3. 화면 전환 방식 설정
//        vc.modalTransitionStyle = .crossDissolve
//
        nav.modalPresentationStyle = .fullScreen
        
        // 4. 화면 띄우기
        present(nav, animated: true)
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiaryTableViewCell.identifier) as? DiaryTableViewCell else {
            return UITableViewCell()
        }
        
        let row = list[indexPath.row]
        
        cell.mainLabel.text = row
        cell.mainLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        cell.mainLabel.backgroundColor = .systemBlue
        cell.mainLabel.numberOfLines = 0
        cell.backgroundColor = .clear
        return cell
    }

    //  🟢 시스템 스와이핑
    // 1. 편집 허락 맡기
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        print(#fileID, #function, #line,"- <#comment#>" )
        return true
    }
    // 2. 스와이핑 액션 하기
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        print(#fileID, #function, #line,"- indexPath, editingStyle \(indexPath.row), \(editingStyle)" )
//
//        list.remove(at: indexPath.row)
//        // 데이터가 바뀌면 뷰에 업데이트를 해줘야 런타임 오류가 발생하지 않는다.
//        tableView.reloadData()
//
//
//    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "삭제") { [weak self]action, view, _ in
            guard let self = self else { return }
            list.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
       
        return UISwipeActionsConfiguration(actions: [delete])
        
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let best = UIContextualAction(style: .normal, title: "배열 추가") { [weak self] action, view, _ in
            guard let self = self else { return }
            
            self.list.insert("즐겨찾기 버튼을 눌러서 추가됨", at: indexPath.row)
            print("배열 추가 되었음 \(list)")
            tableView.reloadData()
        }

        return UISwipeActionsConfiguration(actions: [best])
    }


    
    // MARK: - didSelectedRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 🧐 직접 연결 과 차이점
        // 직접 연결 시 : 파일만 갖고옴 , 연결했던 것은 안가지고 오니까 스토리보드로 구현시 사용할 수 없음 but, 코드로 작성할때는 사용가능
        // 🔴 코드와 스토리보드 화면에 나타나는 순서가 다름 
        let stoyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = stoyboard.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController else { return }
        // 🤔 직접 넣어주면 안되나요?
        /*
         생성되는 시점이 DetailVC가 만들어지기 전에 먼저 detailLabel 에 할당을 하려고 하니까 "안만들어졌는데 어떻게 할당해요??" 라는 오류를 발생시킴
         */
       // vc.detailLabel.text = list[indexPath.row]
        
        
        
        // 2️⃣ send - 데이터 보내기 : vc에서 가지고 있는 프로퍼티에 데이터 추가
        // let row = list[indexPath.row]
        //vc.detailString = "디테일 뷰 입니다. \(row)"
        
        vc.type = .edit
        // 4. 화면 띄우기
        
        // ❗️ 인터페이스 빌더에 네비게이션 컨트롤러가 임베드 되어 있어야만 Push가 동작함 - 👉엔트리 포인트 중요
        navigationController?.pushViewController(vc, animated: true)
        
        
        
        
        
        
        
    }
}
