//
//  ViewController.swift
//  Basics-RxSwift
//
//  Created by Lovice Sunuwar on 09/11/2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableView.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var viewModel = ProductViewModel()
    
    private var bag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableData()
        // Do any additional setup after loading the view.
    }
    
    func bindTableData() {
        // Bind items to table
        
        
        // Here, concept is to tell the UI that this is the data related to you, and take this data update yourself
        // binding the viewmodels item to table items
        
        viewModel.items.bind(
            to: tableView.rx.items(cellIdentifier: "cell",
                                   cellType: UITableViewCell.self)) { row, model, cell in
                                       cell.textLabel?.text = model.title
                                       cell.imageView?.image = UIImage(systemName: model.imageName)
        }.disposed(by: bag)
        // since the binding return will be unused we are disposig it in the disposebag
        
        
        
        // Bind a model Selected handler
        
        // Since we are nto using deleaget and data soouoorce function we want the data of the selected item, so we use modelselected and we are binding(listening) to the product in this case,
        // We can say that this is a subscriber
        tableView.rx.modelSelected(Product.self).bind { product in
            print(product.title)
        }.disposed(by: bag)
        
        
        
        
        
        // fetch items
        viewModel.fetchItems()
    }


}

