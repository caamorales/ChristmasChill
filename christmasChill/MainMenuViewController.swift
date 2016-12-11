//
//  ViewController.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 07/11/2015.
//  Copyright © 2015 Darryl Bayliss. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet fileprivate weak var imagePreview: UIImageView!
    
    @IBOutlet fileprivate weak var previewTitleCollectionView: UICollectionView!
    
    fileprivate let contentManager = ContentManager()
    
    fileprivate let aboutSegue = "about"
    
    fileprivate let contentSegue = "content"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = previewTitleCollectionView.indexPath(for: sender as! UICollectionViewCell) else {
            return
        }
        
        if let videoVC = segue.destination as? VideoViewController {
            videoVC.content = contentManager.content[indexPath.row]
        }
    }
    
    override var preferredFocusedView: UIView? {
        return previewTitleCollectionView
    }
}

extension MainMenuViewController : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PreviewNameCollectionViewCell.self), for: indexPath) as! PreviewNameCollectionViewCell
        collectionViewCell.configureCell(content: contentManager.content[indexPath.row])
        
        return collectionViewCell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentManager.content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
     
        guard let currentFocusIndexPath = context.nextFocusedIndexPath else {
            return
        }
        
        let newImage = contentManager.content[currentFocusIndexPath.row].image
        
        UIView.transition(with: imagePreview, duration: 0.5, options: .transitionCrossDissolve, animations: { () -> Void in
            self.imagePreview.image = newImage
        }, completion:nil)
    }
}

extension MainMenuViewController : UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCollectionViewCell = collectionView.cellForItem(at: indexPath)

        if collectionView.numberOfItems(inSection: 0) - 1 == indexPath.row {
            performSegue(withIdentifier: aboutSegue, sender: selectedCollectionViewCell)
        } else {
            performSegue(withIdentifier: contentSegue, sender: selectedCollectionViewCell)
        }
    }
}
