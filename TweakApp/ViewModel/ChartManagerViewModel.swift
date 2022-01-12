//
//  ChartManagerViewModel.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 09/01/22.
//

import Foundation
import Combine

protocol ChartManagerViewModelProtocol: AnyObject {
    var chartData: Chart? { get }
    func fetchChartData()
    var didSetData: ((Chart?) -> Void)? { get set }
    var onFetchError: ((Error?) -> Void)? { get set }
}


class ChartManagerViewModel: BaseViewModel, ChartManagerViewModelProtocol {
    var chartsSuscriber : AnyCancellable? //combine var to fetch data from publisher
    var didSetData: ((Chart?) -> Void)?
    var onFetchError: ((Error?) -> Void)?
    
    override init() { }
    
    var chartData: Chart? {
        didSet {
            didSetData?(chartData)
        }
    }
    
    func fetchChartData() {
        self.showLoading?()
        self.chartsSuscriber = APIServices().chartDataPublishers.sink(receiveCompletion: { [weak self] error in
            self?.removeLoading?()
            debugPrint("error fetch : \(error)")
            self?.onFetchError?(error as? Error)
        }, receiveValue: { [weak self] response in
            self?.removeLoading?()
            let errorTemp = NSError(domain:"Unknown Error", code: 404, userInfo: nil)
            guard let chartInfo = response else { self?.onFetchError?(errorTemp as Error); return }
            self?.chartData = chartInfo
        })
    }
    
    //get all question data from indexPath index
    func getQuestionFromIndex(at index: Int) -> Question? {
    return self.chartData?.questions?[index]
    }
}
