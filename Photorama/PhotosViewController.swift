//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Angel Caro on 4/27/16.
//  Copyright © 2016 AngelCaro. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchRecentPhotos()
    }
    
}
