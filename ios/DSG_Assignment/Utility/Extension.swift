//
//  Extension.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 26/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

let imageCache = NSCache<AnyObject, AnyObject>()

var topController: UIViewController? {
    return UIApplication.shared.windows.first?.topViewController()
}

var isHudVisible: Bool {
    return SVProgressHUD.isVisible()
}

func showHud() {
    SVProgressHUD.show()
}

func dismissHud(_ completion: (()->Void)? = nil) {
    SVProgressHUD.dismiss(completion: completion)
}

extension Array {
    
    func getElement(_ index: Int) -> Any? {
        if index >= 0 && index < self.count {
            return self[index]
        } else {
            return nil
        }
    }
}

extension String {
    
    func widthOfString(_ font: UIFont) -> CGFloat {
        
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

extension UITableViewCell {
    
    @objc func configureUI(_ model: Any, indexpath: IndexPath? = nil, viewController: UIViewController? = nil) {
    }
    @objc func cellDidSelect(_ tableView: UITableView? = nil, _ model: Any, _ indexpath: IndexPath? = nil) {
    }
    @objc func cellDidEndDisplay( _ model: Any?, indexPath: IndexPath) {
    }
    @objc func cellWillDisplay(_ tableView: UITableView? = nil, _ model: Any, indexPath: IndexPath) {
    }
}

extension UICollectionViewCell {
    
    @objc func configureUI(_ model: Any, indexpath: IndexPath? = nil, viewController: UIViewController? = nil) {
    }
    @objc func cellDidSelect(_ collectionView: UICollectionView? = nil, _ model: Any, _ indexpath: IndexPath? = nil) {
    }
    @objc func cellWillDisplay( _ model: Any, indexPath: IndexPath) {
    }
}

extension NSObject {
    
    @objc func getCellIdentifier(_ type: cellType) -> String {
        return "Cell"
    }
    
    @objc func getCellSize() -> CGSize {
        return CGSize.zero
    }
}

extension UIWindow {
    
    func topViewController() -> UIViewController? {
        var top = self.rootViewController
        while true {
            if let presented = top?.presentedViewController {
                top = presented
            } else if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else {
                break
            }
        }
        return top
    }
}

extension UIImageView {
    
    func downloadImage(with string: String, contentMode: UIView.ContentMode = UIView.ContentMode.scaleAspectFit) {
        
        guard let url = NSURL(string: BaseImageUrl + string) else {return}
        
        if let cachedImage = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url as URL, completionHandler: { (data, response, error) -> Void in
            
            DispatchQueue.main.async { [weak self] in
                self?.contentMode =  contentMode
                if let data = data, let img = UIImage(data: data) {
                    
                    self?.image = img
                    imageCache.setObject(img, forKey: url as AnyObject)
                }
            }
        }).resume()
    }
}

extension UITableView {
    
    func indicatorView() -> UIActivityIndicatorView {
        
        var activityIndicatorView = UIActivityIndicatorView()
        if self.tableFooterView == nil {
            let indicatorFrame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 80)
            activityIndicatorView = UIActivityIndicatorView(frame: indicatorFrame)
            activityIndicatorView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
            
            if #available(iOS 13.0, *) {
                activityIndicatorView.style = .large
            } else {
                // Fallback on earlier versions
                activityIndicatorView.style = .whiteLarge
            }
            
            activityIndicatorView.color = .white
            activityIndicatorView.hidesWhenStopped = true
            
            self.tableFooterView = activityIndicatorView
            return activityIndicatorView
        }
        else {
            return activityIndicatorView
        }
    }
    
    func addLoading(_ indexPath:IndexPath, closure: @escaping (() -> Void)) {
        
        indicatorView().startAnimating()
        if let lastVisibleIndexPath = self.indexPathsForVisibleRows?.last {
            if indexPath == lastVisibleIndexPath && indexPath.row == self.numberOfRows(inSection: 0) - 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    closure()
                }
            }
        }
    }
    
    func stopLoading() {
        
        if self.tableFooterView != nil {
            self.indicatorView().stopAnimating()
            self.tableFooterView = nil
        }
        else {
            self.tableFooterView = nil
        }
    }
}
