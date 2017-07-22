//
//  ViewController.swift
//  JS0NBookSearching
//
//  Created by YERZHAN SERIKBAY on 6/20/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var results = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getBook(with text: String?) {
        guard let text = text, !text.characters.isEmpty else {return}
        let formatedString = text.lowercased().replacingOccurrences(of: " ", with: "+")
        
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(formatedString)"
        let url = URL(string: urlString)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: url!) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : Any]
                
                let items = json["items"] as! [[String: Any]]
                
                for item in items {
                   
                    let info = item["volumeInfo"] as! [String: Any]
                    
                    let title = info["title"] as! String
                    let authors = info["authors"] as! [String]
                    let smallThumbnail = (info["imageLinks"] as! [String: String])["smallThumbnail"]
                    
                    let book = Book(title: title, authors: authors, smallThumbnail: smallThumbnail)
                    
                    self.results.append(book)
                }
                print(self.results)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } .resume()

    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BookUITableViewCell
        
        let book = results[indexPath.row]
        
        
        cell.nameLabel.text = book.title
        cell.authorLabel.text = book.authors?.first
    
        if let imageUrl = book.smallThumbnail,
            let url = URL(string: imageUrl) {
            cell.bookImage.setImage(from: url)
        }
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let request = searchBar.text else { return }
//        getBook(with: request)
//        tableView.reloadData()
        getBook(with: searchBar.text)
        
    }
}

extension UIImageView {
    func setImage(from url: URL) {
        let urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: url) {(data, _, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                self.image = UIImage(data: data)
            }
        } .resume()
    }
}
