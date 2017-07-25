//
//  ViewController.swift
//  08_map
//
//  Created by ChoYoungKwang on 2017. 7. 25..
//  Copyright © 2017년 choyoungkwang. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        labelTitle.text = "위치정보"
        labelLocation.text = "주소"
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func goLocation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue: CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpanMake(span, span)
        let pRegion = MKCoordinateRegionMake(pLocation, spanValue)
        mapView.setRegion(pRegion, animated: true)
        
        return pLocation
    }

    func setAnnotation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue: CLLocationDegrees, delta span :Double, title strTitle :String, subtitle strSubtitle :String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        
        _ = goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.labelTitle.text = "현재 위치"
            self.labelLocation.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            setAnnotation(latitude: 37.387965, longitude: 127.123252, delta: 0.01, title: "NTS", subtitle: "경기도 성남시 분당구 서현동")
            self.labelTitle.text = "NTS"
            self.labelLocation.text = "경기도 성남시 분당구 서현동"
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitude: 37.400122, longitude: 127.106800, delta: 0.01, title: "HIVELAB", subtitle: "경기도 성남시 분당구 대왕판교로 660")
            self.labelTitle.text = "HIVELAB"
            self.labelLocation.text = "경기도 성남시 분당구 대왕판교로 660"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitude: 37.475158, longitude: 126.981333, delta: 0.01, title: "MOIM", subtitle: "서울특별시 관악구 과천대로 947 사당타워 ")
            self.labelTitle.text = "MOIM"
            self.labelLocation.text = "서울특별시 관악구 과천대로 947 사당타워 "
        }
    }
    
}

