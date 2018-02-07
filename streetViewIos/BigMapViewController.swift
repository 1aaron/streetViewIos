//
//  BigMapViewController.swift
//  streetViewIos
//
//  Created by Developer on 2/7/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit
import GoogleMaps

class BigMapViewController: UIViewController {

    public var latitude: Double?
    public var longitude: Double?
    
    @IBOutlet weak var panoView: GMSPanoramaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let latitude = self.latitude {
            if let longitude = self.longitude{
                self.panoView.moveNearCoordinate(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
