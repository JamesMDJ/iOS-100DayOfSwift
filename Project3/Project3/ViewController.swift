//
//  ViewController.swift
//  Project3
//
//  Created by 馬丹君 on 2019/6/27.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit
import GoogleMobileAds
 var bannerView: GADBannerView!


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        // Do any additional setup after loading the view.
    }
   

    @IBAction func showBanner(_ sender: Any) {
        let request = GADRequest()
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(request)
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
}

