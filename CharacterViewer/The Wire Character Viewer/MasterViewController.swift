//
//  MasterViewController.swift
//  The Wire Character Viewer
//
//  Created by MCS on 2/9/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UISplitViewControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var collectionViewContainer: UIView!
    @IBOutlet weak var TableViewContainer: UIView!
    
    var vm = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitViewController?.delegate = self
        
        // Allows the split mode in tablet portrait mode
        splitViewController?.preferredDisplayMode = .allVisible
    }
    
    // Config the master view controller(The table view) as the first thing to see in phone mode.
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    // MARK: - Actions
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.TableViewContainer.isHidden = false
        case 1:
            self.TableViewContainer.isHidden = true
        default:
            break
        }
    }
}
