//
//  HostingMultiViewController.swift
//  LemonadeTransition
//
//  Created by Dang Quoc Huy on 4/28/17.
//  Copyright © 2017 Dang Quoc Huy. All rights reserved.
//

import UIKit
import Hero

class HostingMultiViewController: UIViewController {
  @IBOutlet weak var avatarImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var verifiedHostLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var tableView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupHero()
  }
  
  func setupHero() {
    isHeroEnabled = true
    avatarImage.heroID = "hostAvatar"
    avatarImage.heroModifiers = [HeroModifier.duration(1.0), .delay(2.0)]
    tableView.heroModifiers = [.translate(y: 300), HeroModifier.duration(1.0), .delay(3.0)]
  }
}
