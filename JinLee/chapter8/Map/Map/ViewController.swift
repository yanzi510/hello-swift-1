//
//  ViewController.swift
//  Map
//
//  Created by NAVER on 2017. 7. 25..
//  Copyright © 2017년 Jin Lee. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func goLocation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue: CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpanMake(span, span)
        let pRegin = MKCoordinateRegionMake(pLocation, spanValue)
        myMap.setRegion(pRegin, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitile strSubtitle:String){
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemark, error) -> Void in
            let pm = placemark!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil{
                address += ""
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += ""
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        
        })
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
            
        }else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitude: 37.388263, longitude: 127.123808, delta: 1, title: "NHN Technology Services", subtitile: "경기 성남시 분당구 황새울로359번길 11")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "NHN Technology Services"
            
        }else if sender.selectedSegmentIndex == 2{
            setAnnotation(latitude: 37.464895, longitude: 126.990086, delta: 1, title: "우리 집", subtitile: "서울시 서초구 방배동 2877-32")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "우리 집"

        }
        
    }
    
}

