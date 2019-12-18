//
//  TasksVC.swift
//  fire_JsON
//
//  Created by pop on 12/17/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit

class TasksVC: UIViewController {
    var tasks:[Taskmodel]?
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.tableFooterView = UIView()
        handlerefresh()
    }
    
    private func handlerefresh(){
        api.tasks { ( error:Error?, task:[Taskmodel]?) in
            if let task = task {
                self.tasks = task
                self.tableview.reloadData()
            }
            
        }
        
    }
}



extension TasksVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tasks?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "taskcell")
        cell?.textLabel?.text = tasks![indexPath.row].task
        return cell!
    }
    
}




