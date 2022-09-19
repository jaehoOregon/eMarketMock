//
//  menuViewController.swift
//  eMarketMock
//
//  Created by Jaeho Jung on 2022/09/18.
//
// reference
// Sectioned CollectionView : How to display items in group using UICollectionView with swift 3.0. (https://www.youtube.com/watch?v=ES-LJbXBlb0)
// Multiple Sections in CollectionView (Swift 5) ( https://www.youtube.com/watch?v=zHBePM_HAio&t=244s), 데이터 구조도 참고할 수 있음
// iOS Dev 42: Multiple Section CollectionView with Compositional Layout | Swift 5, XCode 13 (https://www.youtube.com/watch?v=9Aoi-4sW6JU&t=211s)



import UIKit

class menuViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var labelMenu: UILabel!
    @IBOutlet var segmentControl: UISegmentView!
    
    @IBOutlet weak var segFirstview: UIView!
    @IBOutlet weak var segSecondView: UIView!
    @IBOutlet weak var segThirdView: UIView!
    
    var views: [UIView] = []
    var mySegmentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        views = [segFirstview, segSecondView, segThirdView]
        
        segmentControl.selectedSegmentIndex = mySegmentIndex
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        self.view.bringSubviewToFront(segFirstview)
        
        // Custom design for segment control
        self.segmentControl.frame = CGRect(x: self.segmentControl.frame.minX, y: self.segmentControl.frame.minY, width: segmentControl.frame.width, height: 40)
        segmentControl.highlightSelectedSegment()
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if mySegmentIndex >= 0 {
            if gesture.direction == UISwipeGestureRecognizer.Direction.right {
                print("right")
                if mySegmentIndex != 0 {
                    mySegmentIndex = mySegmentIndex - 1
                    self.view.bringSubviewToFront(views[mySegmentIndex])
                }
            }
            if gesture.direction == UISwipeGestureRecognizer.Direction.left {
                print("left")
                if mySegmentIndex != views.count - 1 {
                    mySegmentIndex = mySegmentIndex + 1
                    self.view.bringSubviewToFront(views[mySegmentIndex])
                }
            }
        }
    }
    // youtube segmented control with swipe    
    @IBAction func segmentControlDidChange(_ sender: UISegmentedControl) {
        
        print(sender.selectedSegmentIndex)
        segmentControl.underlinePosition()
        mySegmentIndex = sender.selectedSegmentIndex
        self.view.bringSubviewToFront(views[mySegmentIndex])

    }
    
    @IBAction func dismissMenu(_ sender: UIButton) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
}

