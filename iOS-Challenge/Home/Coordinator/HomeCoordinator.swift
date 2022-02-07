//
//  HomeCoordinator.swift
//  iOS-Challenge
//
//  Created by Alejandro Ulloa on 2022-02-02.
//

import Foundation
import XCoordinator

enum HomeRoute: Route {
    case home
    case showDetails(show: Show)
}

final class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    
    init() {
        super.init(initialRoute: .home)
    }
    
    override func prepareTransition(for route: HomeRoute) -> NavigationTransition {
        switch route {
        case .home:
            let vc = HomeViewController()
            vc.bind(to: HomeViewModel(router: strongRouter))
            return .push(vc)
            
        case let .showDetails(show):
            let vc = ShowDetailViewController()
            vc.bind(to: ShowDetailViewModel(router: strongRouter, show: show))
            return .push(vc)
        }
    }
    
}
