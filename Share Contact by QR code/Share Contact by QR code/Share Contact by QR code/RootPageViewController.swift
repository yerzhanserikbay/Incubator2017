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
    }
    
    
    
    var scrollView: UIScrollView?
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        
        if let scrollView = scrollView {
            scrollView.bounces = false
        }
        else {
            for view in pageViewController.view.subviews {
                if let sv = view as? UIScrollView {
                    scrollView = sv
                }
            }
        }
        scrollView?.bounces = false
        
        
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

    
