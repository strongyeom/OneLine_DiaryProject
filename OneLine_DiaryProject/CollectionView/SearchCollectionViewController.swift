//
//  SearchCollectionViewController.swift
//  OneLine_DiaryProject
//
//  Created by 염성필 on 2023/07/31.
//

import UIKit

class SearchCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        navigationItem.title = "콜렉션 뷰 입니다."
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(cancelBtnClicked(_:)))
        setCollectionViewLayout()
    }
    
    @objc func cancelBtnClicked(_ sender: UIBarButtonItem) {
        
        print(#fileID, #function, #line,"- <#comment#>" )
         //dismiss(animated: true)
         navigationController?.popViewController(animated: true)
    }
    
    // collectionView layout 셋팅
    func setCollectionViewLayout() {
        
        // ‼️ cell estimated size = none으로 인터페이스 빌더에서 설정할 것
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 20
        // 디바이스 가로
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        // 가로, 세로 높이
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        // collectionview의 여백 설정 (좌,우,상,하)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        // Cell의 실제 간격 지정
        layout.minimumLineSpacing = spacing
        // Cell간의 최소한의 간격 지정
        layout.minimumInteritemSpacing = spacing

        // 설정된 사이즈 적용
        collectionView.collectionViewLayout = layout
    }
    
    // 1. 셀의 갯수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    // 2. 셀의 데이터 및 디자인
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell()}
        cell.backgroundColor = .yellow
        cell.contentLabel.text = "\(indexPath)"
        return cell
    }
    
}
