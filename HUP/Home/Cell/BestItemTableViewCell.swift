//
//  BestItemTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit

class BestItemTableViewCell: UITableViewCell {
    @IBOutlet weak var bestItemCollectionView: UICollectionView!
    
    var bestItemArray : [BestItemModel]?
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
    var nowPage: Int = 0
    
    func setCollectionViewDataSourceDelegate(forRow row: Int) {
        bestItemCollectionView.delegate = self
        bestItemCollectionView.dataSource = self
        bestItemCollectionView.tag = row
        
        let bestItemNib = UINib(nibName: "BestItemCollectionViewCell", bundle: nil)
        bestItemCollectionView.register(bestItemNib, forCellWithReuseIdentifier: BestItemCollectionViewCell.identifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing = 0
        
        bestItemCollectionView.collectionViewLayout = flowLayout
        bestItemCollectionView.reloadData()
        
        //DATA
        BestItemDataManager().bestItemDataManager("eOnGoing", self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bannerTimer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // 2초마다 실행되는 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        let count = bestItemArray?.count ?? 0
        if nowPage == (count - 1) {
        // 맨 처음 페이지로 돌아감
            bestItemCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        bestItemCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
}
extension BestItemTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestItemArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestItemCollectionViewCell", for: indexPath) as? BestItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        let itemIdx = indexPath.item
        if let cellData = self.bestItemArray {
            // if data exists
            cell.setUpData(cellData[itemIdx])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.frame.width
        return CGSize(width: w, height: 280)
    }
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
extension BestItemTableViewCell {
    func bestItemSuccessAPI(_ result : [BestItemModel]) {
        self.bestItemArray = result
        bestItemCollectionView.reloadData()
    }
}
