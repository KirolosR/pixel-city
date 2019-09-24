//
//  MapVC.swift
//  pixel-city
//
//  Created by Kirolos on 1/12/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate{

    @IBOutlet weak var MkMapView: MKMapView!
    var locationManager = CLLocationManager()
    var authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius : Double = 1000
    override func viewDidLoad() {
        super.viewDidLoad()
        MkMapView.delegate = self
        locationManager.delegate = self
        requestLocationService()
      
    }

    
    @IBAction func centerMapBtnPressed(_ sender: Any) {
        
    }
    
    
    func requestLocationService(){
        if authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        else {
            return
        }
    }
  
    func centerUserLocation () {
        guard let coordinate = locationManager.location?.coordinate  else {return}
        let coordinatRegon = MKCoordinateRegionMakeWithDistance(coordinate, regionRadius * 0.2, regionRadius * 0.2)
        MkMapView.setRegion(coordinatRegon, animated: true)
    }
    
   func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        centerUserLocation()
    }
 
}

