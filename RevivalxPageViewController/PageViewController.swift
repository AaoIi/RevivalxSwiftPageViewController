//
//  PageViewController.swift
//  RevivalxPageViewController
//
//  Created by Mohammad Nurdin bin Norazan on 2/26/15.
//  Copyright (c) 2015 Nurdin Norazan Services. All rights reserved.
//

import Foundation
import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDataSource, UIPageViewControllerDelegate{

    var index = 0
    var identifiers: NSArray = ["FirstNavigationController", "SecondNavigationController"]
    override func viewDidLoad() {
        
        self.dataSource = self
        self.delegate = self
        
        let startingViewController = self.viewControllerAtIndex(self.index)
        let viewControllers: NSArray = [startingViewController]
        self.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
        
        
    }
    
    func viewControllerAtIndex(index: Int) -> UINavigationController! {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        //first view controller = firstViewControllers navigation controller
        if index == 0 {
            
            return storyBoard.instantiateViewControllerWithIdentifier("FirstNavigationController") as! UINavigationController
            
        }
        
        //second view controller = secondViewController's navigation controller
        if index == 1 {
            
            return storyBoard.instantiateViewControllerWithIdentifier("SecondNavigationController") as! UINavigationController
        }
        
        return nil
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let identifier = viewController.restorationIdentifier
        let index = self.identifiers.indexOfObject(identifier!)
        
        //if the index is the end of the array, return nil since we dont want a view controller after the last one
        if index == identifiers.count - 1 {
            
            return nil
        }
        
        //increment the index to get the viewController after the current index
        self.index = self.index + 1
        return self.viewControllerAtIndex(self.index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let identifier = viewController.restorationIdentifier
        let index = self.identifiers.indexOfObject(identifier!)
        
        //if the index is 0, return nil since we dont want a view controller before the first one
        if index == 0 {
            
            return nil
        }
        
        //decrement the index to get the viewController before the current one
        self.index = self.index - 1
        return self.viewControllerAtIndex(self.index)
        
    }
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.identifiers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
