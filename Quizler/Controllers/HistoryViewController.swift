//
//  HistoryViewController.swift
//  Quizler
//
//  Created by Davron Abdukhakimov on 07/07/23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
class HistoryViewController: UIViewController{
    
    @IBOutlet weak var historyTableView: UITableView!
    var documents = [[String: Any]]()
    let db = Firestore.firestore()
    var indexOrder = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.historyTableView.delegate = self
        self.historyTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadQuizzes()
    }
    
    func loadQuizzes(){
        documents = []
        db.collection((Auth.auth().currentUser?.email)!).order(by: "dateCreated",descending: true).getDocuments { querySnapshot, error in
                if let e = error{
                    print(e.localizedDescription)
                }
                else{
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        self.documents.append(data)
                    }
                    self.historyTableView.reloadData()
                }
    }
}
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHistoryQuestions"{
            let historyVC = segue.destination as! HistoryQuestionsViewController
            historyVC.questions = self.documents[self.indexOrder]["questions"] as! [[String : Any]]
            historyVC.type = self.documents[self.indexOrder]["type"] as! String
        }
    }

}
extension HistoryViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCellViewController
        if let topic = self.documents[indexPath.row]["topic"] as? String{
            cell.topicLabel.text = topic
            var imageName:String{
                switch topic{
                case "General Knowledge":
                    return "book"
                case "":
                    return "book"
                case "Mythology":
                    return "mythology"
                case "Sports":
                    return "sports"
                case "Geography":
                    return "globe"
                case "History":
                    return "history"
                case "Politics":
                    return "politician"
                case "Art":
                    return "palette"
                case "Celebrities":
                    return "fame"
                case "Animals":
                    return "pawprint"
                case "Vehicles":
                    return "vehicles"
                default:
                    return ""
                }
            }
            cell.topicLogoImageView.image = UIImage(named: imageName)
        }
        if let score = self.documents[indexPath.row]["score"], let number = self.documents[indexPath.row]["number"]{
            cell.resultLabel.text = "\(score)/\(number)"
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexOrder = indexPath.row
        performSegue(withIdentifier: "toHistoryQuestions", sender: self)
    }
    
}
