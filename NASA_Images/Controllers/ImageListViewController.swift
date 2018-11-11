//
//  ViewController.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 10/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import UIKit

// This class handles lifecycle events for the app's main 'Image List' view
class ImageListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HTTPServiceDelegate, ImageCellDelegate {
    

    // UI Outlets:
    @IBOutlet weak var navBarTitle: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    // Hold fetched Image Data and View-Models:
    var imagesData = [NASAImageData]()
    var imageCellViewModels = [ImageCellViewModel]()
    
    var httpService: HTTPService?
    
    // When viewController loads configure tableView and httpService instance before requesting to download new data
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        httpService = HTTPService()
        httpService?.delegate = self
        
        getImagesData()
    }
    
    
    // This method requests new data for the tableView
    func getImagesData(){
        
        httpService?.getData()
        
    }
    
    
    // This method handles the response from a request to the HTTPService class. If data was successfully returned, it is assigned to this ViewController's main scope and used to instantiate ImageCellViewModel objects, which are appended to the main scope's imageCellViewModels array. The tableView is finally called to reload its data - drawing from the newly created NASAImageDataViewModel objects.
    func finishedHTTPDataRequest(err: HTTPServiceError?, data: AnyObject?) {
        
        if let responseImagesData = data as? [NASAImageData] {
            imagesData = responseImagesData
            for imageData in responseImagesData {
                imageCellViewModels.append(ImageCellViewModel(imageData: imageData))
            }
        }
        tableView.reloadData()
    }
    
    
    
    // This method registers a user's tap on a tableView cell and shows image details in a presented ViewController
    func imageCellTapped(row: Int) {
        
        // get destination vc
        guard
        let imageDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "imageDetailsView") as? ImageDetailsViewController,
        let navigator = navigationController
        else { return }
        
        // set destination vc properties and present here:
        imageDetailsViewController.imageData = imagesData[row]
        navigator.pushViewController(imageDetailsViewController, animated: true)
    }
    

    // This method configures the tableView cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {

            // return a blank cell for padding at top of tableView
            let paddingCell = UITableViewCell()
            return paddingCell
        } else {
            
            // return a configured ImageCell - assigning this viewController as delegate and setting the cell's ImageCellViewModel property to the corresponding object in this viewControllers array of ImageCellViewModel objects. The cell's tag is also set to the corresponding row in the tableView to enable identification when calling delegate methods.
            let imageCell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as! ImageCell
            imageCell.imageViewModel = imageCellViewModels[indexPath.row - 1]
            imageCell.delegate = self
            imageCell.tag = indexPath.row - 1
            return imageCell
        }
    }
    
    // This method defines the number of cells in the tableView - set to the number of objects in this viewController's array of ImageCellViewModel objects, plus 1 to account for the padding at the top of the tableView (or set to zero if the array is empty)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if imageCellViewModels.isEmpty {
            
            return 0
        } else {
            return imageCellViewModels.count + 1
        }
    }
    
    // This method sets the height of each cell in the tableView. The first cell (used for padding) has a smaller height than the others.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 10
        } else {
            return 250
        }
    }

    
    
    // This method removes the grey 'selection' formatting when cell's are tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // This method sets the NavigationBar title before the Viewcontroller is displayed
    override func viewWillAppear(_ animated: Bool) {
       navBarTitle.title = "The Milky Way"
    }


}

