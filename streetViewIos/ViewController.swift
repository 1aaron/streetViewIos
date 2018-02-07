//
//  ViewController.swift
//  streetViewIos
//
//  Created by Developer on 2/7/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var panoramaView: GMSPanoramaView!
    @IBOutlet weak var openImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapDetected))
        openImg.isUserInteractionEnabled = true
        openImg.addGestureRecognizer(singleTap)
    }
    @objc func tapDetected(){
        print("image Tapped")
        performSegue(withIdentifier: "toBigMap", sender: "Main")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPanoramIn(latitude: Double, longitude: Double){
        self.latitude = latitude
        self.longitude = longitude
        self.panoramaView.moveNearCoordinate(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
    }
    private var latitude: Double?
    private var longitude: Double?
    
    override func viewDidAppear(_ animated: Bool) {
        setPanoramIn(latitude: 37.3317134, longitude: -122.0307466)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBigMap" {
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
            
            let controller = segue.destination as! BigMapViewController
            controller.latitude = self.latitude
            controller.longitude = self.longitude
        }
    }
    
}

