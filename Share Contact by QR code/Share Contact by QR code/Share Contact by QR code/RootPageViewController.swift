//
//  RootPageViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 8/20/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import EasyPeasy

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    lazy var VCArr: [UIViewController] = {
        return [self.VCInstance(name: "FirstVC"),
                self.VCInstance(name: "SecondVC"),
                self.VCInstance(name: "ThirdVC")]
    }()
    
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = VCArr.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        
        let nextButton = UIButton(type: .custom)
        nextButton.setImage(#imageLiteral(resourceName: "Next@1x"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        
        
        self.view.addSubview(nextButton)
        
        
        let backButton = UIButton(type: .custom)
        backButton.setImage(#imageLiteral(resourceName: "Previous@1x"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        self.view.addSubview(backButton)
        
        nextButton <- [
            CenterY(),
            Right(10),
            Size(50)
        ]
        
        backButton <- [
            CenterY(),
            Left(10),
            Size(50)
        ]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
        
        for view in self.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
    
    
    func nextButtonAction(sender: UIButton!) {
        goToNextPage()
    }
    
    func backButtonAction(sender: UIButton!) {
        goToPreviousPage()
    }
    
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = VCArr.index(of: viewController)!
        let previousIndex = currentIndex - 1
        return (previousIndex == -1) ? nil : VCArr[previousIndex]

    }
   
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = VCArr.index(of: viewController)!
        let nextIndex = currentIndex + 1
        return (nextIndex == VCArr.count) ? nil : VCArr[nextIndex]
    }
    
   
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArr.count
    }
    
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCArr.index(of: firstViewController) else {
            return 0
        }
        return firstViewControllerIndex
    }
}

extension UIPageViewController {
    
    func goToNextPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
        setViewControllers([nextViewController], direction: .forward, animated: animated, completion: nil)
    }
    
    func goToPreviousPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let previousViewController = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) else { return }
        setViewControllers([previousViewController], direction: .reverse, animated: animated, completion: nil)
    }
    
}
