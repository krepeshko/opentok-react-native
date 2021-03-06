//
//  OTPublisherView.swift
//  OpenTokReactNative
//
//  Created by Manik Sachdeva on 1/17/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import Foundation

@objc(OTPublisherView)
class OTPublisherView : UIView {
  var publisherId: NSString?
  var fitToView: NSString?
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func layoutSubviews() {
    if (fitToView! as String) == "fit" {
        OTRN.sharedState.publishers[publisherId! as String]?.viewScaleBehavior = .fit;
    }
    if let publisherView = OTRN.sharedState.publishers[publisherId! as String]?.view {
      publisherView.frame = self.bounds
      publisherView.layer.cornerRadius = 8;
      publisherView.layer.masksToBounds = true;
      addSubview(publisherView)
    }
  }
}

