//
//  Spinner.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 11/4/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import Foundation
import UIKit


//spinner for beofre pages load
open class Spinner
{
    internal static var spinner: UIActivityIndicatorView?
    public static var style: UIActivityIndicatorView.Style = .whiteLarge
    
    public static var baseBackColor = UIColor(white: 0, alpha: 0.6)
    public static var baseColor = UIColor.red
    public static func start(style: UIActivityIndicatorView.Style = style, backColor: UIColor = baseBackColor, baseColor: UIColor = baseColor) {
        if spinner == nil, let window = UIApplication.shared.keyWindow {
            let frame = UIScreen.main.bounds
            spinner = UIActivityIndicatorView(frame: frame)
            spinner!.backgroundColor = backColor
            spinner!.style = style
            spinner?.color = baseColor
            window.addSubview(spinner!)
            spinner!.startAnimating()
        }
    }
    
    public static func stop() {
        if spinner != nil {
            spinner!.stopAnimating()
            spinner!.removeFromSuperview()
            spinner = nil
        }
    }
}
