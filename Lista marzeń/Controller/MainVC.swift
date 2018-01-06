//
//  MainVC.swift
//  Lista marzeń
//
//  Created by Karol Zmyslowski on 06.01.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var controller : NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // generateTestData()
        attemptFetch()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
        return  sectionInfo.numberOfObjects
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DreamCell", for: indexPath) as! ItemCell
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let section = controller.sections{
            return section.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func configureCell(cell: ItemCell, indexPath: IndexPath){
        let item = controller.object(at: indexPath)
        cell.configureCell(item: item)
    }
    
    func attemptFetch(){
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        
        do {
            try self.controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
        
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case .update:
            if let indexPath = indexPath {
           let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                configureCell(cell: cell, indexPath: indexPath)
                
            }
            break
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    func generateTestData() {
        
        let item = Item(context: context)
        item.title = "MacBook Pro"
        item.price = 5300
        item.details = "When I Will come Developer, I have to buy my own Mac"
        
        let item2 = Item(context: context)
        item2.title = "Bose Headphones"
        item2.price = 1200
        item2.details = "When I Will come Developer, I have to buy my own Headphone"
        
        let item3 = Item(context: context)
        item3.title = "Tesla Model S"
        item3.price =  300000
        item3.details = "oh man this is a beautiful car"
        
        ad.saveContext()
    }
}






