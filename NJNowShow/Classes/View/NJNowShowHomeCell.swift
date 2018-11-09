//
//  NJNowShowHomeCell.swift
//  NJNowShow
//
//  Created by HuXuPeng on 2018/7/11.
//

import UIKit
import NJKit
import SnapKit
import AlamofireImage

class NJNowShowHomeCell: UITableViewCell {
    
    private var headerImageView: UIImageView = UIImageView()
    private var nickNameLabel: UILabel = UILabel()
    private var locationBtn: UIButton  = UIButton(type: UIButton.ButtonType.custom)
    private var countLabel: UILabel = UILabel()
    private var ingDesLabel: UILabel = UILabel()
    private var mainImageView: UIImageView = UIImageView()
    var nowShow: NJNowShow? {
        willSet {
            
            headerImageView.image = UIImage.nj_image(name: "defaulthead70", bundleClass: NJNowShowHomeCell.self)
            mainImageView.image = UIImage.nj_image(name: "videoDefault", bundleClass: NJNowShowHomeCell.self)
            

            
            nickNameLabel.text = newValue?.myname
            locationBtn.setTitle(newValue?.gps, for: .normal)
            countLabel.text = newValue?.allnum
            
            if newValue != nil, let url = URL(string: newValue!.bigpic) {
                
                mainImageView.af_setImage(withURL: url)
                
                if let url = URL(string: newValue!.smallpic) {
                    headerImageView.af_setImage(withURL: url)
                }
            }
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension NJNowShowHomeCell
{
    private func setupUI()
    {
        let headerContentView = UIView()
        self.contentView.addSubview(headerContentView)
        headerContentView.addSubview(headerImageView)
        headerContentView.addSubview(nickNameLabel)
        headerContentView.addSubview(locationBtn)
        headerContentView.addSubview(countLabel)
        headerContentView.addSubview(ingDesLabel)
        self.contentView.addSubview(mainImageView)
        
        headerContentView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.contentView)
            make.height.equalTo(70);
        }
        headerImageView.layer.cornerRadius = 25
        headerImageView.layer.masksToBounds = true
        headerImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(headerContentView)
            make.left.equalTo(headerContentView).offset(10)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        nickNameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(headerImageView.snp.centerY).offset(-3)
            make.left.equalTo(headerImageView.snp.right).offset(5)
        }
        locationBtn.snp.makeConstraints { (make) in
            make.top.equalTo(headerImageView.snp.centerY).offset(3)
            make.left.equalTo(headerImageView.snp.right).offset(5)
        }
        ingDesLabel.snp.makeConstraints { (make) in
            make.right.equalTo(headerContentView).offset(-10)
            make.bottom.equalTo(headerContentView.snp.bottom).offset(-5);
        }
        countLabel.snp.makeConstraints { (make) in
           make.right.equalTo(ingDesLabel.snp.left).offset(-5)
           make.bottom.equalTo(ingDesLabel.snp.bottom)
        }

        mainImageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.contentView)
            make.top.equalTo(headerContentView.snp.bottom).offset(0);
            make.height.equalTo(mainImageView.snp.width)
        }
        
        let sepLineView = UIView()
        sepLineView.backgroundColor = UIColor.groupTableViewBackground
        self.contentView.addSubview(sepLineView)
        sepLineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(10)
        }
        
        ingDesLabel.textColor = UIColor.lightGray
        ingDesLabel.font = UIFont.systemFont(ofSize: 13)
        countLabel.textColor = UIColor.purple
        countLabel.font = UIFont.boldSystemFont(ofSize: 15)
        locationBtn.isUserInteractionEnabled = false
        locationBtn.setTitleColor(UIColor.darkGray, for: .normal)
        locationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        ingDesLabel.text = "在看"
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.clipsToBounds = true
        self.selectionStyle = .default
    }
}


extension NJNowShowHomeCell
{
    class func cell(tableView: UITableView) -> NJNowShowHomeCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(self))
        
        if cell == nil {
            cell = NJNowShowHomeCell(style: .default, reuseIdentifier: NSStringFromClass(self))
        }
        return cell as! NJNowShowHomeCell
    }
}


