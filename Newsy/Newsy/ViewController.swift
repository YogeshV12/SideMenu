//
//  ViewController.swift
//  Newsy
//
//  Created by Yogesh Kumar Verma on 24/11/21.
//

import UIKit
import SideMenu

class ViewController: UIViewController {

    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: true)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapMenu(){
        present(menu!, animated: true)
    }
}

class MenuListController: UITableViewController {
    var items = ["Most Recent Stories", "Top Stories", "Environment", "Entertainment", "Sports", "Tech"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .systemGray6
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.backgroundColor = .systemGray6
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

        let index = indexPath.row
//        let vacationSpot = items[index]
        print(index)
        // 2
        let identifier = "\(index)" as NSString

        return UIContextMenuConfiguration(
          identifier: identifier,
          previewProvider: nil) { _ in
            // 3
            let mapAction = UIAction(
              title: "View map",
              image: UIImage(systemName: "map")) { _ in }

            // 4
            let shareAction = UIAction(
              title: "Share",
              image: UIImage(systemName: "square.and.arrow.up")) { _ in }

            // 5
            return UIMenu(title: "", image: nil, children: [mapAction, shareAction])
          }
    }
}
