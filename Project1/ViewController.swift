//
//  ViewController.swift
//  Project1
//
//  Created by Jessi Zimmerman on 1/16/24.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
//        Set up the file manager and define the file path. Make sure to unwrap the file path.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
//        attempt to gather the pictures from the file path
        let items = try! fm.contentsOfDirectory(atPath: path)
//        Iterate over the pictures and choose only those starting with "nssl"
        for item in items {
            if item.hasPrefix("nssl"){
//                add the pictures with "nssl" prefix to the pictures array
                pictures.append(item)
            }
        }
        print(pictures)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

