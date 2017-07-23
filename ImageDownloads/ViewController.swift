//
//  ViewController.swift
//  ImageDownloads
//
//  Created by Lena Lee on 2017. 7. 21..
//  Copyright © 2017년 Lena Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    @IBOutlet var progressView: UIProgressView!
    
    
    var downloadTask : URLSessionDownloadTask!
    
    
    @IBAction func downLoadAction(_ sender: Any) {
        indicator.startAnimating()
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        
        downloadTask = session.downloadTask(with: URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!)
        downloadTask.resume()
    }
   
    /*
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        <#code#>
    }
    */
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        let tempData: Data = try! Data(contentsOf: location)
        self.imageView.image = UIImage(data: tempData)
        
        indicator.startAnimating()
    }
    
    
    
    @IBAction func stopAction(_ sender: Any) {
    }
  
    @IBAction func reStartAction(_ sender: Any) {
    }
    
    @IBAction func cancelAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

