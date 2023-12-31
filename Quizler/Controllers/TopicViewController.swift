//
//  TopicViewController.swift
//  Quizler
//
//  Created by Davron Abdukhakimov on 05/07/23.
//

import UIKit

class TopicViewController: UIViewController {
    

    @IBOutlet weak var topicTableView: UITableView!
    var selectedTopic = ""
    struct cellContent{
        let label:String
        let imageName:String
    }
    let data = [
        cellContent(label: "General Knowledge", imageName: "book"),
        cellContent(label: "Mythology", imageName: "mythology"),
        cellContent(label: "Sports", imageName: "sports"),
        cellContent(label: "Geography", imageName: "globe"),
        cellContent(label: "History", imageName: "history"),
        cellContent(label: "Politics", imageName: "politician"),
        cellContent(label: "Art", imageName: "palette"),
        cellContent(label: "Celebrities", imageName: "fame"),
        cellContent(label: "Animals", imageName: "pawprint"),
        cellContent(label: "Vehicles", imageName: "vehicles")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Quizler"
        topicTableView.dataSource = self
        topicTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "topicToSettings"{
            let questionSettingsVC = segue.destination as! QuizSettingsViewController
            questionSettingsVC.topic = selectedTopic
        }
    }
    

}

extension TopicViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topic = data[indexPath.row]
        let cell = topicTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellViewController
        cell.topicLabel.text = topic.label
        cell.iconImageView.image = UIImage(named: topic.imageName)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTopic = data[indexPath.row].label
        performSegue(withIdentifier: "topicToSettings", sender: self)
    }
}
