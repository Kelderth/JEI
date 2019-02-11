//
//  FavoriteViewController.swift
//  Simpsons Character Viewer
//
//  Created by Isai Yepez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let vm = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegation
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? FavoriteTableViewCell else { return UITableViewCell() }
        
        let tempImage = UIImage(named: "imagenotavailable")
        cell.setup(image: tempImage!, text: vm.title(index: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcIdentifier = "CharacterDetails"
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        guard let destination = storyboard.instantiateViewController(withIdentifier: vcIdentifier) as? FirstViewController else { return }
        
        destination.characterIndex = indexPath.row
        
        navigationController?.pushViewController(destination, animated: true)
    }
    
}
