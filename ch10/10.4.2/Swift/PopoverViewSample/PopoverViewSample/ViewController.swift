//
//  ViewController.swift
//  PopoverViewSample
//
//  Created by 关东升 on 2016-11-18.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//


import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func show(_ sender: AnyObject) {
        
        let popoverViewController = SelectViewController()
        popoverViewController.modalPresentationStyle = .popover
        self.present(popoverViewController, animated: true, completion: nil)
        
        // 配置PopoverPresentationController
        let popController = popoverViewController.popoverPresentationController
        popController!.permittedArrowDirections = .any
        popController!.barButtonItem = sender as? UIBarButtonItem
        popController!.delegate = self
        
    }
    
    //MARK: --实现UIPopoverPresentationControllerDelegate协议
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        print("呈现Popover视图")
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("关闭Popover视图")
    }

}

