//
//  CharactersGalleryViewController.swift
//  The Wire Character Viewer
//
//  Created by MCS on 2/10/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import UIKit

class CharactersGalleryViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    let vm = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegation
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
        self.collectionView?.register(UINib(nibName: "CharacterCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "Cell")
    }
}

extension CharactersGalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - Collection View Data Source
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CharacterCollectionViewCell else { return UICollectionViewCell() }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            cell.setup(text: self.vm.title(index: indexPath.row))

        })
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        guard let destination = storyboard.instantiateViewController(withIdentifier: "CharacterDetails") as? FirstViewController else { return }
        
        destination.characterIndex = indexPath.row
        
        splitViewController?.showDetailViewController(destination, sender: nil)
    }
}
