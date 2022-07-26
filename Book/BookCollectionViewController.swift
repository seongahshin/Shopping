//
//  BookCollectionViewController.swift
//  Shopping
//
//  Created by 신승아 on 2022/07/20.
//

import UIKit
import Kingfisher

class BookCollectionViewController: UICollectionViewController {
    
    var bookName = BookInfo().book
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        // 사이즈
        layout.itemSize = CGSize(width: width/2, height: width/2)
        // 스크롤 방향
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        cell.layer.cornerRadius = 20
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .systemPink
        } else {
            cell.backgroundColor = .systemPurple
        }
        
        let data = bookName[indexPath.item]
        cell.configureCell(data: data)
        
        let url = URL(string: data.bookimageview)
        cell.bookImage.kf.setImage(with: url)
        return cell
    }
    
    // 0번 item cell 누르면 상세화면으로 이동 (push)
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 0 {
            // 1. 화면전환할 스토리보드를 특정한다.
            let sb = UIStoryboard(name: "Book", bundle: nil)
            // 2. 화면전환할 스토리보드 안에 VC를 특정한다.
            let vc = sb.instantiateViewController(withIdentifier: BookCollectionViewCell.identifier) as! BookViewController
            // 3. 화면전환할 방법을 선택한다.
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // 바 버튼 아이템 눌렀을 때 검색화면으로 이동 (present,fullscreen)
    @IBAction func searchbarButtonClicked(_ sender: UIBarButtonItem) {
        // 1. 화면전환할 스토리보드를 특정한다.
        let sb = UIStoryboard(name: "Book", bundle: nil)
        // 2. 화면전환할 스토리보드 안에 VC를 특정한다.
        let vc = sb.instantiateViewController(withIdentifier: BookCollectionViewCell.identifier1)
        as! SearchViewController
        // 2.5 네비게이션 컨트롤러를 임베디드한다.
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        // 3. 화면전환할 방법을 선택한다.
        self.present(nav, animated: true)
    }
}
