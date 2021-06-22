//
//  ViewController.swift
//  Guess the flag milestone 1
//
//  Created by Igor Polousov on 22.06.2021.
//
// TASKS:
// List various flags in table view
// Move on detailed view controller with a full screen flag picture on tap
// On detail view controller add button allow to share picture and country name

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  1 Создаем доступ к файлам
        let fm = FileManager.default
        // 2 Задаем путь где лежат наши файлы
        let path  = Bundle.main.resourcePath!
        // 3 Задаем название контента для поиска и используем try! чтобы он не искал ошибки
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // 4 Делаем поиск и сохранение в массив всех найденных файлов
        for item in items {
            if item.hasSuffix("@3x.png") {
                pictures.append(item)
            // 5 Делаем сортировку в массиве по алфавиту
                pictures.sort()
            }
        }
        // 6 Делаем проверку содержимого массива pictures
        print(pictures)
    }

// 7 Задаём количество строк в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
        pictures.count
    }
 // 8 Определяем название строк в таблице и создаём ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
}

