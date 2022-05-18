//
//  Protocols.swift
//  Navigation
//
//  Created by User on 05.05.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
