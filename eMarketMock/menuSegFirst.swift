//
//  menuSegFirst.swift
//  eMarketMock
//
//  Created by Jaeho Jung on 2022/09/19.
//
// CollectionView Headers & Footers (Swift , Xcode, 2022) - iOS Development (https://www.youtube.com/watch?v=jnuxK_-d9N0)

import UIKit

class menuSegFirst: UIViewController {
    
    private let sections = mockData.shared.pageData
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

    @IBOutlet weak var segFirstCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //nib
        let nibCell = UINib(nibName: "MenuCollectionViewCell", bundle: nil)
        segFirstCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")

    }
}


extension menuSegFirst: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
        case .popular(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenuCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        case .used(let items):
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenuCollectionViewCell
        cell.setup(items[indexPath.row])
        return cell
        case .life(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenuCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = segFirstCollectionView.frame.width
            let itemsPerRow: CGFloat = 3
            let widthPadding = sectionInsets.left * (itemsPerRow + 1)
            let cellWidth = ((width - widthPadding) / itemsPerRow)
//            let height = segFirstCollectionView.frame.height
//            let itemsPerColumn: CGFloat = 3
//            let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
            let cellHeight = cellWidth + 25
            
            return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

//        let headerView = segFirstCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "", for: indexPath)
//
//        return headerView

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if let headerView = segFirstCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "menuHeaderCollectionReusableView", for: indexPath) as? menuHeaderCollectionReusableView {
                
                headerView.sectionHeaderLabel.text = sections[indexPath.section].title
                
                return headerView

            }

        default:
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
}
