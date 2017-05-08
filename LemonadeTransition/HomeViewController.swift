//
//  HomeViewController.swift
//  LemonadeTransition
//
//  Created by Dang Quoc Huy on 4/28/17.
//  Copyright © 2017 Dang Quoc Huy. All rights reserved.
//

import UIKit
import Hero

class HomeViewController: UIViewController {
  @IBOutlet weak var leftMenuButton: UIButton!
  @IBOutlet weak var rightMenuButton: UIButton!
  @IBOutlet weak var carouselView: UIImageView!
  @IBOutlet weak var bubblesView: UIImageView!
  @IBOutlet weak var compassView: UIImageView!
  @IBOutlet weak var centerBubble: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    setupHero()
  }
  
  @IBAction func tapCenterBubble(_ sender: Any) {
    let storyboard = UIStoryboard(name: "HostingMulti", bundle: nil)
    if let controller = storyboard.instantiateViewController(withIdentifier: "HostingMultiViewController") as? HostingMultiViewController {
      self.present(controller, animated: true, completion: nil)
    }
  }
  
  func setupHero() {
    centerBubble.heroID = "hostAvatar"
    leftMenuButton.heroModifiers = [.fade, HeroModifier.duration(1.0)]
    rightMenuButton.heroModifiers = [.fade, HeroModifier.duration(1.0)]
    carouselView.heroModifiers = [.fade, .scale(0.5), HeroModifier.duration(1.5)]
    bubblesView.heroModifiers = [.fade, .scale(0.5), HeroModifier.duration(2.0)]
    compassView.heroModifiers = [.fade, .rotate(CGFloat.pi), HeroModifier.duration(1.5)]
  }
  
}
