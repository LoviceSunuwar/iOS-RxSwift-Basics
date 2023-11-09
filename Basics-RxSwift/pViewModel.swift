//
//  pViewModel.swift
//  Basics-RxSwift
//
//  Created by Lovice Sunuwar on 09/11/2023.
//

import Foundation
import RxSwift
import RxCocoa

struct ProductViewModel {
    var items = PublishSubject<[Product]>()
    // This is a colleciton of items of a type PublishSubject which takes in a generic
    // Here items is basically a publisher which allows the oobserver to notify the data has changed via onComplete 
    
    func fetchItems() {
        // In a real world scenario this would be where you would fetch your data from API or a coredata, Swiftdata. But for now we are just creating a list by ourseleves here.
        let products = [
            Product(imageName: "house", title: "Home"),
            Product(imageName: "person,circle", title: "Profile"),
            Product(imageName: "gear", title: "Settings"),
            Product(imageName: "airplane", title: "Flights"),
            Product(imageName: "bell", title: "Activity")
        ]
        
        // Next Collections will be product and assinging onComplete
        items.onNext(products)
        items.onCompleted()
     
    }
}

