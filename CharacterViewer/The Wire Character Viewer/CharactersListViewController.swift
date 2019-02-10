//
//  CharactersListViewController.swift
//  The Wire Character Viewer
//
//  Created by MCS on 2/10/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import UIKit

class CharactersListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let vm = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegates
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        let headerNib = UINib.init(nibName: "CharactersTableViewHeaderFooterView", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "CharactersTableViewHeaderFooterView")
    }
}

extension CharactersListViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CharacterCellTableViewCell else { return UITableViewCell() }
        
        cell.setup(text: vm.title(index: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcIdentifier = "CharacterDetails"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let destination = storyboard.instantiateViewController(withIdentifier: vcIdentifier) as? FirstViewController else { return }
        
        //        guard let characterSelected = tableView.indexPathForSelectedRow?.row else { return }
        
        destination.characterIndex = indexPath.row
        
        splitViewController?.showDetailViewController(destination, sender: nil)
        
        //        navigationController?.pushViewController(destination, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CharactersTableViewHeaderFooterView") as! CharactersTableViewHeaderFooterView
        headerView.searchBar.barTintColor = UIColor.init(red:0/255, green: 71/255, blue: 114/255, alpha: 1)
        headerView.searchBar.becomeFirstResponder()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}
