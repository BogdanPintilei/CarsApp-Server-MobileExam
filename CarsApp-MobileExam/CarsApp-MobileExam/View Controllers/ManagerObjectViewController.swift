//
//  ManagerObjectViewController.swift
//  CarsApp-MobileExam
//
//  Created by Bogdan Pintilei on 2/20/18.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

class ManagerObjectViewController: UIViewController {

    var cars = [Object]()
    var selectedObject = Object()

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getObjects()
    }

    @IBAction func addObject(_ sender: Any) {

    }

    private func getObjects() {
        LoadingView.startLoadingAnimation()
        APIClient.getObjects { (cars) -> Void in
            LoadingView.stopLoadingAnimation()
            self.cars = cars
            print(cars.count)
            self.tableView.reloadData()
            self.cars = Helper.sortObjects(objects: cars)
        }
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowNavigationObjectDetailsModalSegueID" {
            let navVC = segue.destination as! UINavigationController
            let vc = navVC.viewControllers.first as! ManagerObjectDetailsTableTableViewController
            vc.object = selectedObject
        }
    }
    
}

extension ManagerObjectViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Table View Delegate & Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellID", for: indexPath) as! CustomTableViewCell
        cell.object = cars[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedObject = cars[indexPath.row]
        performSegue(withIdentifier: "ShowNavigationObjectDetailsModalSegueID", sender: nil)
    }

}
