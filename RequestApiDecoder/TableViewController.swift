//
//  ViewController.swift
//  RequestApiDecoder
//
//  Created by Vu on 4/29/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var dataQuake: [ExtensionEarthQuake.Event] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.shared.requestApiEarthQuake { (void) in
            
            self.dataQuake = void
            self.tableView.reloadData()
            self.tableView.rowHeight = 120
        }
        
        // Do any additional setup after lovarng the view, typically from a nib.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataQuake.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCellA
        cell.magLabel.text = "\(dataQuake[indexPath.row].mag)"
        cell.distanceLabel.text = "\(dataQuake[indexPath.row].distanceString!)"
        cell.locationName.text = dataQuake[indexPath.row].locationName
        cell.timeLabel.text = "\(dataQuake[indexPath.row].timeString)"
        cell.dateLabel.text = "\(dataQuake[indexPath.row].dateString)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destination.urlFromTableView = dataQuake[indexPath.row].url
        }
    }

}

