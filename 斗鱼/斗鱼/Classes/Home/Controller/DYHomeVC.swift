//
//  DYHomeVC.swift
//  斗鱼
//
//  Created by pba on 2017/1/13.
//  Copyright © 2017年 wenjun. All rights reserved.
//

import UIKit

let kTitleViewH : CGFloat = 40.0


class DYHomeVC: UIViewController {
    
    // MARK: - 懒加载的属性
    lazy var pageTitleView : DYPageTitleView = {
        let rect = CGRect(x: 0, y: kNavH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = DYPageTitleView(frame: rect, titles: titles)
        return titleView
    }()
    
    //懒加载pageContentView
    lazy var pageContentView : DYPageContentView = {[weak self] in
        //控制器的frame
        let frame = CGRect(x: 0, y: kNavH + kTitleViewH, width: kScreenW, height: kScreenH-kNavH-kTitleViewH)
        
        var childsVC = [UIViewController]()
        for _ in 0..<4{
            //1.创建子控制器
            let childVC = UIViewController()
            childVC.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            //2.添加到数组中
            childsVC.append(childVC)
        }
        
        let contentView = DYPageContentView(frame: frame, chlidsVC: childsVC, parentVC: self)
        
        return contentView
    }()

    // MARK: - View life
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置UI
        setupUI()
        
    }
    


}

// MARK: - 设置UI
extension DYHomeVC {
    //设置UI
    func setupUI() {
        //1. 设置导航栏item
        setupNavBarItem()
        
        //2. 添加标题栏
        view.addSubview(pageTitleView)
        automaticallyAdjustsScrollViewInsets = false
        
        //3. 添加滑动内容的view
        view.addSubview(pageContentView)
//        pageContentView.backgroundColor = UIColor.blue
    }
    
    //设置导航栏item
    func setupNavBarItem() {
        //1. 导航栏左边的item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "logo")
        
        //2. 导航栏右边的item
        let size = CGSize(width: 40, height: 40)
        let searchItem = UIBarButtonItem(imgName: "searchBtnIcon", hlImage: "searchBtnIconHL", size: size)
        let scanItem = UIBarButtonItem(imgName: "scanIcon", hlImage: "scanIconHL", size: size)
        let historyItem = UIBarButtonItem(imgName: "viewHistoryIcon", hlImage: "viewHistoryIconHL", size: size)
        
        navigationItem.rightBarButtonItems = [searchItem,scanItem,historyItem];
    }
    
    
    
    
    
    
}











