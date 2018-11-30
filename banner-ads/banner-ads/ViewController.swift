//
//  ViewController.swift
//  banner-ads
//
//  Created by Eric Hernandez on 11/27/18.
//  Copyright © 2018 Eric Hernandez. All rights reserved.
//

import GoogleMobileAds
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bannerView: GADBannerView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())

    }
    



}

