//
//  RootViewController.swift
//  HelloWorld
//
//  Created by tonyguan on 2016/10/19.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建视图viewA
        let viewA = UIView()
        viewA.backgroundColor = UIColor.gray
        //设置viewA的frame属性
        viewA.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        //将viewA添加到根视图中
        self.view.addSubview(viewA)
        
        //创建视图viewB
        let viewB = UIView()
        viewB.backgroundColor = UIColor.green
        //设置viewB的frame属性
        viewB.frame = CGRect(x: 50, y: 100, width: 100, height: 200)
        //将viewB添加到viewA视图中
        viewA.addSubview(viewB)
        
        NSLog("frame_x: %.2f, frame_y: %.2f", viewB.frame.origin.x, viewB.frame.origin.y)
        NSLog("frame_w: %.2f, frame_h: %.2f", viewB.frame.size.width, viewB.frame.size.height)
        
        NSLog("bounds_x: %.2f, bounds_y: %.2f", viewB.bounds.origin.x, viewB.bounds.origin.y)
        NSLog("bounds_w: %.2f, bounds_h: %.2f", viewB.bounds.size.width, viewB.bounds.size.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
