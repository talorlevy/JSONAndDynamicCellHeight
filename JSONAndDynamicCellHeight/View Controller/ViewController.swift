//
//  ViewController.swift
//  JsonDataExample
//
//  Created by Talor Levy on 2/8/23.
//

import UIKit

class ViewController: UIViewController {
    
// MARK: @IBOutlet

    @IBOutlet weak var titlesTableView: UITableView!
    
    var viewModel: TitleViewModel?
    var titlesArray: [TitleModel] = []
    var filteredTitlesArray: [TitleModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TitleViewModel()
        viewModel?.fetchUsersData {
            DispatchQueue.main.async {
                self.titlesArray = self.viewModel?.titlesArray ?? []
                self.filteredTitlesArray = self.titlesArray.filter { object in
                    object.completed == true
                }
                self.titlesTableView.reloadData()
            }
        }
    }
}


// MARK: UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredTitlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as? TitleTableViewCell else { return UITableViewCell() }
        let title = filteredTitlesArray[indexPath.row]
        cell.titleLabel.text = "Title: \(title.title ?? "")"
        return cell
    }
}


// MARK: UITableViewCell

class TitleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}
