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
        
        store.fetchRecentPhotos() {
            (photosResult) -> Void in
            
            switch photosResult {
            case let .Success(photos):
                print("Succesfully found \(photos.count) recent photos.")
                
                if let firstPhoto = photos.first {
                    self.store.fetchImageForPhoto(firstPhoto, completion: { (imageResult) in
                        
                        switch imageResult {
                        case let .Success(image):
                            NSOperationQueue.mainQueue().addOperationWithBlock {
                                self.imageView.image = image
                            }
                            
                        case let .Failure(error):
                            print("Error downloading image: \(error)")
                        }
                        
                    })
                }
                
            case let .Failure(error):
                print("Error fetching recent photos: \(error)")
            }
            
        }
    }
    
}
