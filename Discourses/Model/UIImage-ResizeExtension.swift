//
//  UIImage-ResizeExtension.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/16/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//
import UIKit
extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
