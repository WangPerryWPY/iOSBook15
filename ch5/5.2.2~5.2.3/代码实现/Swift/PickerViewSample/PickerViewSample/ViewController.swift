//
//  ViewController.swift
//  PickerViewSample
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

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var label: UILabel!
    var pickerView: UIPickerView!
    
    var pickerData : NSDictionary!          //保存全部数据
    var pickerProvincesData: NSArray!       //当前的省数据
    var pickerCitiesData : NSArray!         //当前的省下面的市数据
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        //获取属性列表文件中的全部数据
        let dict = NSDictionary(contentsOfFile: plistPath!)
        self.pickerData = dict
        
        //省份名数据
        self.pickerProvincesData = self.pickerData.allKeys as NSArray!
        
        //默认取出第一个省的所有市的数据
        let seletedProvince = self.pickerProvincesData[0] as! String
        self.pickerCitiesData = self.pickerData[seletedProvince] as! NSArray
        
        let screen = UIScreen.main.bounds
        
        /// 1.选择器
        let pickerViewWidth: CGFloat = 320
        let pickerViewHeight: CGFloat = 162
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: pickerViewWidth, height: pickerViewHeight))
        
        //设置self为委托对象、self为数据源对象
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        self.view.addSubview(self.pickerView)
        
        ///2.添加标签
        let labelWidth:CGFloat = 200
        let labelHeight:CGFloat = 21
        let labelTopView:CGFloat = 273
        self.label = UILabel(frame: CGRect(x: (screen.size.width - labelWidth)/2 , y: labelTopView, width: labelWidth, height: labelHeight))
        
        self.label.text = "Label"
        //字体左右居中
        self.label.textAlignment = .center
        self.view.addSubview(self.label)
        
        /// 3.Button按钮
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("Button", for: UIControlState())
        
        let buttonWidth:CGFloat = 46
        let buttonHeight:CGFloat = 30
        let buttonTopView:CGFloat = 374
        
        button.frame = CGRect(x: (screen.size.width - buttonWidth)/2 , y: buttonTopView, width: buttonWidth, height: buttonHeight)
        //指定事件处理方法
        button.addTarget(self, action: #selector(onclick(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onclick(_ sender: AnyObject) {
        
        let row1 = self.pickerView.selectedRow(inComponent: 0)
        let row2 = self.pickerView.selectedRow(inComponent: 1)
        
        let selected1 = self.pickerProvincesData[row1] as! String
        let selected2 = self.pickerCitiesData[row2] as! String
        let title = String(format: "%@，%@市", selected1, selected2)
        
        self.label.text = title
    }
    
    //MARK: --实现协议UIPickerViewDataSource方法
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       	if (component == 0) {//省份个数
            return self.pickerProvincesData.count
           } else {//市的个数
            return self.pickerCitiesData.count
        }
    }
    
    //MARK: --实现协议UIPickerViewDelegate方法
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       	if (component == 0) {//选择省份名
            return self.pickerProvincesData[row] as? String
           } else {//选择市名
            return self.pickerCitiesData[row] as? String
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            let seletedProvince = self.pickerProvincesData[row] as! String
            self.pickerCitiesData = self.pickerData[seletedProvince] as! NSArray
            self.pickerView.reloadComponent(1)
        }
    }
}


