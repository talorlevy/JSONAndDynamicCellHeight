//
//  PostViewModel.swift
//  JsonDataExample
//
//  Created by Talor Levy on 2/8/23.
//

import Foundation

class TitleViewModel {
    
    var titlesArray: [TitleModel] = []
    
    func fetchUsersData(completion: @escaping() -> Void) {
        NetworkManager.sharedInstance.fetchData(urlString: Constants.urls.link.rawValue) {  [weak self] (result: Result<[TitleModel], Error>) in
            switch result {
            case .success(let titles):
                self?.titlesArray = titles
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
