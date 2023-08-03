//
//  TimeLineViewController.swift
//  OneLine_DiaryProject
//
//  Created by 염성필 on 2023/08/02.
//

import UIKit

    /*
     1. 프로로콜(ex.부하직원) UICollectionViewDelegate, UICollectionViewDataSource
     2. 컬렉션 뷰와 부하직원을 연결 : delegate = self ( 타입으로서의 프로토콜 사용 )
     3. 컬렉션뷰 아울렛
     */

class TimeLineViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var todayCollectionView: UICollectionView!
    
    @IBOutlet var bestCollectionView: UICollectionView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todayCollectionView.delegate = self
        todayCollectionView.dataSource = self
        
        bestCollectionView.delegate = self
        bestCollectionView.dataSource = self
        
        configureCollectionViewLayout()
        configureBestCollectionViewLayout()
        configureXib()
    }
    
    func configureXib() {
        let nib = UINib(nibName: SearchCollectionViewCell.identifier, bundle: nil)
        
        todayCollectionView.register(nib, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        bestCollectionView.register(nib, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
    }
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       // let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: 100, height: 180)
        // top, bottom 안주는 이유는 height: 180 == collectionview의 높이와 같기 때문에 깨질 수도 있음
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        todayCollectionView.collectionViewLayout = layout
    }
    
    func configureBestCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        bestCollectionView.collectionViewLayout = layout
        // isPagingEnabled : 페이지 효과처럼 끊어서 보임, 디바이스 가로 길이 기준으로 페이징 처리됨 ‼️width에 값이 있을 경우 이상하게 보임
        bestCollectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        switch collectionView {
//        case todayCollectionView:
//            return 3
//        case bestCollectionView:
//            return 10
//        default:
//            return 0
//        }
        
        return collectionView == todayCollectionView ? 3 : 10
        // return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        
        
        switch collectionView {
        case todayCollectionView:
            cell.contentLabel.text = "Today: \(indexPath.item)"
            cell.backgroundColor = .yellow
        case bestCollectionView:
            cell.contentLabel.text = "\(indexPath.item)"
            cell.backgroundColor = [.red, .purple, .blue].randomElement()!
        default:
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    
    
    
}
