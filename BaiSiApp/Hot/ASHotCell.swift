//
//  ASHotCell.swift
//  BaiSiApp
//
//  Created by ashen on 16/3/29.
//  Copyright © 2016年 Ashen<http://www.devashen.com>. All rights reserved.
//

import UIKit
import Kingfisher

class ASHotCell: UITableViewCell {

    @IBOutlet weak var imgVHeader: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblText: UILabel!
    
    @IBOutlet weak var commentHeight: NSLayoutConstraint!
    @IBOutlet weak var commentHot: UILabel!
    @IBOutlet weak var commentView: UIView!
    
    @IBOutlet weak var lblComment: UILabel!
    
    @IBOutlet weak var scrollTag: UIScrollView!
    
    @IBOutlet weak var btnDing: UIButton!
    
    @IBOutlet weak var btnBad: UIButton!
    
    @IBOutlet weak var btnShare: UIButton!
    
    @IBOutlet weak var btnComment: UIButton!


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupData(listModel:ASListsModel) {
        
        imgVHeader.kf_setImageWithURL(NSURL(string: listModel.u.header[0])!, placeholderImage: UIImage(named: "defaultUserIcon"))
        lblText.text = listModel.text
        lblName.text = listModel.u.name
        lblTime.text = listModel.passtime
        
        var frame = commentView.frame
        if listModel.top_comment.content.isEmpty {
            frame.size.height = 0
            commentView.frame = frame
            commentView.hidden = true
        } else {
            commentView.hidden = false
            frame.size.height = lblComment.frame.size.height + 30
            commentView.frame = frame
        }
        
        lblComment.text = listModel.top_comment.user.name + ": " + listModel.top_comment.content
        btnDing.setTitle(" " + listModel.up, forState: .Normal)
        btnBad.setTitle(" \(listModel.down!)", forState: .Normal)
        btnShare.setTitle(" " + listModel.forward, forState: .Normal)
        btnComment.setTitle(" \(listModel.comment!)", forState: .Normal)
        
        
        for item in scrollTag.subviews {
            item.removeFromSuperview()
        }
        var lastTagBtn:UIButton!
        for i in 0..<listModel.tags.count {
            
            let tagBtn = UIButton(type: .Custom)
          
            let width = ASToolHelper.getSizeForText(listModel.tags[i].name, size: CGSizeMake(self.frame.width - 20, 30),font: 15).width
            
            tagBtn.frame = CGRect.init(x: i == 0 ? 0 :CGRectGetMaxX(lastTagBtn.frame), y: 0, width: width + 20, height: 30)
            tagBtn.setTitle(listModel.tags[i].name, forState: .Normal)
            tagBtn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
            tagBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
            scrollTag.addSubview(tagBtn)
            lastTagBtn = tagBtn
        }
        
    }
  
}