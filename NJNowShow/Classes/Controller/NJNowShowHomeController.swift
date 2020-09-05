//
//  NJNowShowHomeController.swift
//  NJNowShow
//
//  Created by HuXuPeng on 2018/7/9.
//

import UIKit
import NJKit
import MJRefresh
import NJMediator
import NJMediator_NJNowShowPlay

class NJNowShowHomeController: NJRefreshTableViewController {

    let nowShowHomeListViewModel = NJNowShowHomeListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nj_isBackActionBtnHidden = true
        var contentInset = self.tableView.contentInset
        contentInset.bottom += (self.tabBarController?.tabBar.frame.height ?? 0)
        self.tableView.contentInset = contentInset
        self.tableView.separatorStyle = .none
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
            self?.tableView.mj_footer?.state = hasMore ? MJRefreshState.idle : MJRefreshState.noMoreData
        }
    }
}

extension NJNowShowHomeController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 + UIScreen.main.bounds.size.width + 10
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nowShowHomeListViewModel.nowShowList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = NJNowShowHomeCell.cell(tableView: tableView)
        cell.nowShow = nowShowHomeListViewModel.nowShowList[indexPath.row]

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let liveUrl = nowShowHomeListViewModel.nowShowList[indexPath.row].flv
        if let nowShowPlay = NJMediator.sharedMediator.Mediator_NJNowShowPlayRoom_Controller(liveUrl: liveUrl) {
            present(nowShowPlay, animated: true, completion: nil)
        }
    }
}

// MARK:- StatusBar
//        setNeedsStatusBarAppearanceUpdate()
extension NJNowShowHomeController {
    open override var prefersStatusBarHidden: Bool {
        return false
    }
    open  override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    open  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
    open override var shouldAutorotate: Bool {
        return false
    }
    // MARK: - about keyboard orientation
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait;
    }
    //返回最优先显示的屏幕方向
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
}
