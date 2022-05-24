//
//  ViewController.swift
//  HelloRealm
//
//  Created by 今橋浩樹 on 2022/05/25.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField1.placeholder = "名前を入力してください"
        textField2.placeholder = "年齢を入力してください"
        
        let userData = realm.objects(User.self)
        print("すべてのデータ\(userData)")
    }

    @IBAction func addButtonAction(_ sender: Any) {
        let user = User()
        user.name = textField1.text!
        user.age = Int(textField2.text!)!
        try! realm.write {
            realm.add(user)
        }
        
        textField1.text = ""
        textField2.text = ""
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userData = realm.objects(User.self)
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // realmでデータを丸ごと取ってきて、添字とカラム名を設定することでデータを取得できる
        // テーブル行に紐づく形でデータを引き出して、セルに当てはめていく
        let userData = realm.objects(User.self)
        cell.textLabel!.text = "\(userData[indexPath.row].name)さん"
        cell.detailTextLabel!.text = String("\(userData[indexPath.row].age)歳")
        return cell
    }
    
}

