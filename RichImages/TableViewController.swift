//
//  TableViewController.swift
//  RichImages
//
//  Created by devedbox on 2017/11/30.
//  Copyright © 2017年 devedbox. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    /// The image object.
    var image = #imageLiteral(resourceName: "image_to_merge") {
        didSet {
            resultViewController.original = image
        }
    }
    /// The result image view controller.
    let resultViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .scrollableAxes
        }
        
        resultViewController.original = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Table view delegate.
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 1:// Bluring effects.
            switch indexPath.row {
            case 0:
                resultViewController.result = image.lightBlur
            case 1:
                resultViewController.result = image.extraLightBlur
            case 2:
                resultViewController.result = image.darkBlur
            default: break
            }
            resultViewController.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
            navigationController?.pushViewController(resultViewController, animated: true)
        default: break
        }
    }
}