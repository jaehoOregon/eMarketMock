//
//  UISegmentView.swift
//  eMarketMock
//
//  Created by Jaeho Jung on 2022/09/18.
//
// reference
// Super Easy! Switch Tab Using UISegmented Control in Swift 5 (https://youtu.be/WmK02eLrSvQ)
// Let’s Customize Segmented Control Like Button (https://medium.com/@mtssonmez/lets-customize-segmented-control-like-button-8445aff2e9d)
// How to Make an Animated Underline Tab Bar! (SwiftUI) (https://youtu.be/RPCTAv_e2kA)

import UIKit

class UISegmentView: UISegmentedControl {

}

extension UIImage {
    
    class func getSegRect(color: CGColor, andSize size: CGSize) -> UIImage {

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        context?.fill(rectangle)

        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return rectangleImage!
        
//    class func getSegRect(color: CGColor, andSize size: CGSize) -> UIImage{
//
//        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
//        let context = UIGraphicsGetCurrentContext()
//        context?.setFillColor(color)
//        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
//        context?.fill(rectangle)
//        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return rectangleImage!
    }
}


// extension for UISegment Control
extension UISegmentedControl {
    
    func removeBorder() {
        let background = UIImage.getSegRect(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(background, for: .normal, barMetrics: .default)
        self.setBackgroundImage(background, for: .selected, barMetrics: .default)
        self.setBackgroundImage(background, for: .highlighted, barMetrics: .default)

        let deviderLine = UIImage.getSegRect(color: UIColor.white.cgColor, andSize: CGSize(width: 1, height: 1))
        self.setDividerImage(deviderLine, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemGray6], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)], for: .selected)
        
        let font = UIFont.systemFont(ofSize: 16)
        self.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    }
    
    // tab highlight  when selected
    func highlightSelectedSegment() {

        removeBorder()
        
        let lineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let lineHeight: CGFloat = 2 // set height of underline
         
        let lineXPosition = CGFloat(selectedSegmentIndex * Int(lineWidth))
        let lineYPosition = self.bounds.size.height - 4
        
        let underLineFrame = CGRect(x: lineXPosition, y: lineYPosition, width: lineWidth, height: lineHeight)
        let underLine = UIView(frame: underLineFrame)
        underLine.backgroundColor = UIColor.black
        underLine.tag = 1
        self.addSubview(underLine)
    }

    // set the position of bottom underline
    func underlinePosition() {
        guard let underLine = self.viewWithTag(1) else {return}
        let xPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)

        // Spring Animation when change tab
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveEaseInOut) {
            underLine.frame.origin.x = xPosition
        }
    }
}


