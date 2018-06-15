//
//  DetailViewController.swift
//  Test
//
//  Created by Adrian Coroian on 6/12/18.
//  Copyright © 2018 Adrian Coroian. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController {
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var text: UIImageView?
    
    /// Container
    @IBOutlet private weak var contentContainerView: UIView!
    @IBOutlet private weak var containerLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var containerTrailingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var containerTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var containerBottomConstraint: NSLayoutConstraint!
    
    /// Header Image Height
    @IBOutlet private weak var headerImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var headerImageView: UIImageView!
    
    
    @IBAction func close(sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    internal func positionContainer(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) {
        containerLeadingConstraint.constant = left
        containerTrailingConstraint.constant = right
        containerTopConstraint.constant = top
        containerBottomConstraint.constant = bottom
        view.layoutIfNeeded()
    }
    
    internal func setHeaderHeight(_ height: CGFloat) {
        headerImageHeightConstraint.constant = height
        view.layoutIfNeeded()
    }
    
    internal func configureRoundedCorners(shouldRound: Bool) {
        headerImageView.layer.cornerRadius = shouldRound ? 14.0 : 0.0
    }
}
