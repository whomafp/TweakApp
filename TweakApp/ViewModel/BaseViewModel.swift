//
//  BaseViewModel.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 08/01/22.
//

import Foundation

protocol BaseViewModelProtocol {
    var showLoading: (()-> Void)? { get set }
    var removeLoading: (() -> Void)? { get set }
}

class BaseViewModel: BaseViewModelProtocol {
    var showLoading: (() -> Void)?
    var removeLoading: (() -> Void)?
}
