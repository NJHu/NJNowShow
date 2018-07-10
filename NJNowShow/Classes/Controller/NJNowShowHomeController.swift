//
//  NJNowShowHomeController.swift
//  NJNowShow
//
//  Created by HuXuPeng on 2018/7/9.
//

import UIKit
import NJKit
import MJRefresh

class NJNowShowHomeController: NJRefreshTableViewController {

    let nowShowHomeListViewModel = NJNowShowHomeListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nj_isBackActionBtnHidden = true
        var contentInset = self.tableView.contentInset
        contentInset.bottom += (self.tabBarController?.tabBar.frame.height ?? 0)
        self.tableView.contentInset = contentInset
        navigationItem.title = "热门主播"
    }
    override func loadData(isMore: Bool) {
        nowShowHomeListViewModel.loadLiveNowShows(isMore: isMore) {[weak self] (response: NJResponse, hasMore: Bool) in
            self?.endHeaderFooterRefreshing()
            
            if response.error != nil {
                print(response.errorMsg)
                return
            }
            
            self?.tableView.reloadData()
            self?.tableView.mj_footer.state = hasMore ? MJRefreshState.idle : MJRefreshState.noMoreData
        }
    }
}

extension NJNowShowHomeController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nowShowHomeListViewModel.nowShowList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "UITableViewCell")
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        label.textColor = UIColor.black
        cell.contentView.addSubview(label)
        label.text = nowShowHomeListViewModel.nowShowList[indexPath.row].myname
        return cell
    }
}
