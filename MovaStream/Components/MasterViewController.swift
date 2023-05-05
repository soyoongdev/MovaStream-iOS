//
//  MasterViewController.swift
//  MovaStream
//
//  Created by HauNguyen on 26/04/2566 BE.
//

import UIKit

public class MasterViewController: UIViewController {
    
    /// Main navigation bar header
    public var navigationBar: Bool? = true {
        didSet {
            if navigationBar != nil {
                
            }
        }
    }
    
    // MARK: - Life cycle
    
    /// 0
    /// Called first when initializing a view controller
    /// Eg: initialize the UI
    public override func loadView() {
        super.loadView()
    }
    
    /// 1
    /// When the view controller has been loaded into memory (provided that this view controller does not already exist in memory), the viewDidLoad function is called.
    /// Called only once in the life of that view.
    /// Often used to prepare data or initialize default values for objects and UI on the screen.
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .greyDark
    }
    
    /// 2
    /// Called before a view is added to the view system and before the animation renders a view.
    /// At the time of animation to display the view, if you want to customize something, this function will help you do it.
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Make sure the top constraint of the TableView is equal to Superview and not Safe Area
        // Hide the navigation bar completely
        // Make the Navigation Bar background transparent
    }
    
    /// 3
    /// The function will be called when a view has been added to several view systems and displayed on the screen.
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    /// 4
    /// Called when a view has been hidden from the screen and amination when the view is hidden.
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    /// 5
    /// Called when a view has been hidden from the screen.
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
    }
}


extension MasterViewController {
    
    func hiddenNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
}
