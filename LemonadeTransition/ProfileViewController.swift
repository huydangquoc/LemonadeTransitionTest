//
//  ProfileViewController.swift
//  LemonadeTransition
//
//  Created by Dang Quoc Huy on 5/5/17.
//  Copyright © 2017 Dang Quoc Huy. All rights reserved.
//

import UIKit
import Interpolate

class ProfileViewController: UIViewController {
  @IBOutlet weak var coverView: UIView!
  @IBOutlet weak var avatarView: UIView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var coverViewTopSpaceConstrain: NSLayoutConstraint!
  @IBOutlet weak var infoViewTopSpaceConstrain: NSLayoutConstraint!

  let movingCover: CGFloat = 100
  var movingAvatar: CGFloat!
  
  // Interpolations
  var coverViewPosition: Interpolate?
  var infoViewPosition: Interpolate?
  var avatarTransform: Interpolate?
  // Interpolations supporter
  var avatarOriginalTransform: CGAffineTransform!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    scrollView.delegate = self
    movingAvatar = (coverView.frame.height - movingCover) / 2
    
    // Interpolations supporter
    avatarOriginalTransform = avatarView.transform
    
    setupInterpolations()
  }

}

// MARK: Scroll View Delegate

extension ProfileViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let delta = scrollView.contentOffset.y
    
    guard delta <= movingCover else { return }
    guard delta >= 0 else { return }
    
    let progress = delta / movingCover
    animateInterpolations(progress: progress)
  }
  
}

// MARK: Interpolate
extension ProfileViewController {
  
  func setupInterpolations() {
    
    coverViewPosition = Interpolate(from: 0, to: 1, function: BasicInterpolation.linear, apply: { [weak self] (progress) in
      self?.coverViewTopSpaceConstrain.constant = -self!.movingCover * progress
    })
    
    infoViewPosition = Interpolate(from: 0, to: 1, function: BasicInterpolation.linear, apply: { [weak self] (progress) in
      self?.infoViewTopSpaceConstrain.constant = self!.movingCover * progress
    })
    
    avatarTransform = Interpolate(from: CGFloat(0), to: CGFloat(1), function: BasicInterpolation.linear, apply: { [weak self] (progress) in
      
      let deltaY = self!.movingAvatar * progress
      let scale = 1 - progress / 2
      var t = (self?.avatarOriginalTransform)!.translatedBy(x: 0, y: -deltaY)
      t = t.scaledBy(x: scale, y: scale)
      self?.avatarView.transform = t
    })
    
  }
  
  func animateInterpolations(progress: CGFloat) {
    coverViewPosition?.progress = progress
    infoViewPosition?.progress = progress
    avatarTransform?.progress = progress
  }
  
}
