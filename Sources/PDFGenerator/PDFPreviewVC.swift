//
//  PDFPreviewVC.swift
//  PDF_Demo
//
//  Created by Ansar on 12/05/23.
//

import UIKit
import WebKit

public class PDFPreviewVC: UIViewController {

    var webView: WKWebView?
    var url: URL!
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: self.view.bounds)
        let req = NSMutableURLRequest(url: url)
        req.timeoutInterval = 60.0
        req.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        self.view.addSubview(webView!)
        // webView.scalesPageToFit = true
        webView?.load(req as URLRequest)
        
        if let pdfURL = Bundle.main.url(forResource: "/sample_tblview.pdf", withExtension: "pdf"), let testData = try? Data(contentsOf: pdfURL)  {
            let baseURL = pdfURL.deletingLastPathComponent()
            webView?.load(testData, mimeType: "application/pdf", characterEncodingName: "", baseURL: baseURL)
        }
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction fileprivate func close(_ sender: AnyObject!) {
        dismiss(animated: true, completion: nil)
    }

    func setupWithURL(_ url: URL) {
        self.url = url
    }
}
