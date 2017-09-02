//
//  AboutViewController.swift
//  flametouch
//
//  Created by tominsam on 2/27/16.
//  Copyright © 2016 tominsam. All rights reserved.
//

import UIKit
import SafariServices
import Crashlytics

class AboutViewController: UIViewController, UIWebViewDelegate {

    override func loadView() {
        Answers.logContentView(withName: "about", contentType: "screen", contentId: nil, customAttributes: nil)

        title = "About"
        view = UIView(frame: CGRect.null)
        view.backgroundColor = UIColor.white
        perform(#selector(initWebview), with: nil, afterDelay: 0)
        automaticallyAdjustsScrollViewInsets = false
    }
    
    @objc func initWebview() {
        let webView = UIWebView()
        view.addSubview(webView)
        view.backgroundColor = UIColor.white
        webView.backgroundColor = UIColor.white

        // limit webview width so lines aren't too long
        webView.pinEdgesTo(guide: view.readableContentGuide)

        webView.scrollView.contentInset.top = 40
        webView.delegate = self
        let localfilePath = Bundle.main.url(forResource: "about", withExtension: "html")
        webView.loadRequest(URLRequest(url: localfilePath!))
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == .linkClicked {
            //let controller = SFSafariViewController(url: request.url!)
            //navigationController?.pushViewController(controller, animated: true)
            
            UIApplication.shared.open(request.url!, options: [:], completionHandler: nil)
            return false
        }
        return true
    }
}
