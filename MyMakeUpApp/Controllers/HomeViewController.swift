//
//  HomeViewController.swift
//  MyMakeUpApp
//
//  Created by Jennifer Chukwuemeka on 28/06/2022.
//

import UIKit
import Kingfisher
import ProgressHUD

class HomeViewController: UIViewController{
    
    //var filteredItem = [WelcomeElement]()
    var  filteredItems = [MakeoverElement]()
    var makeoverElement = [MakeoverElement]()
  //  var makeups = [WelcomeElement]()
    
    var isSearchBarEmpty: Bool {
        return searchVC.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchVC.isActive && !isSearchBarEmpty
    }
  
    
    @IBOutlet weak var makeUpTableView: UITableView!
    
    private let searchVC = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        creatSearchBar()
        initSearchController()
        ProgressHUD.show()
        ApiCaller.shared.fetchproduct { [weak self] result in
            switch result {
            case.success(let makeups):
                ProgressHUD.dismiss()
                DispatchQueue.main.async {
                    self?.makeoverElement = makeups
                    self?.makeUpTableView.reloadData()
                    self?.searchVC.dismiss(animated: true, completion: nil)
               
                }
            case .failure(let error):
                print("fetching failed with:\(error)")
            }
        }
        

        
    }
    
    private func registerCells()  {
        makeUpTableView.register(UINib(nibName: TableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    private func creatSearchBar() {
        navigationItem.searchController = searchVC
        searchVC.searchBar.delegate = self
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
     
        
        guard let text = searchBar.text, !text.isEmpty else {
            return
        }
        
        
        
        ApiCaller.shared.search(with: text) { [weak self] result in
            switch result {
            case.success(let makeup):
                DispatchQueue.main.async {
                    self?.makeoverElement = makeup
                    self?.makeUpTableView.reloadData()
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
        ApiCaller.shared.searchData(with: text) { [weak self] result in
            switch result {
            case.success(let makeup):
                DispatchQueue.main.async {
                   // self?.makeups = makeup
                    self?.makeUpTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    func initSearchController() {
       // searchVC.loadViewIfNeeded()
        searchVC.searchResultsUpdater = self
        searchVC.obscuresBackgroundDuringPresentation = false
        searchVC.searchBar.placeholder = "Search Makeup"
       // searchVC.searchBar.enablesReturnKeyAutomatically = false
        //searchVC.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        navigationItem.searchController = searchVC
       // navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func filterContentForSearchText(_ searchText: String) {
        
        filteredItems = makeoverElement.filter { (makeoverElement: MakeoverElement) -> Bool in
            return (makeoverElement.name.lowercased().contains(searchText.lowercased()))
            
        }
        makeUpTableView.reloadData()
        
    }
    
    
    

    

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredItems.count
        }
        return makeoverElement.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let makeoverElements: MakeoverElement
        if isFiltering {
            makeoverElements = filteredItems[indexPath.row]
        }else {
            makeoverElements = makeoverElement[indexPath.row]
        }
        cell.setup(makeups: makeoverElements)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController.instantiate()
        let makeoverElements: MakeoverElement
        
        if isFiltering {
            
            controller.makeoverElements = filteredItems[indexPath.row]
        } else {
            
            controller.makeoverElements = makeoverElement[indexPath.row]
         
        }
        navigationController?.pushViewController(controller, animated: true)
        
    }

    
}

extension HomeViewController: UISearchResultsUpdating, UISearchBarDelegate  {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchVC.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
}
