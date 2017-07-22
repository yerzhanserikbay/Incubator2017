//
//  ViewController.swift
//  URLSessionApp
//
//  Created by Galym Kulyn on 20.06.2017.
//  Copyright © 2017 galymco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tablemView: UITableView!
    
    var results = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tablemView.delegate = self
        tablemView.dataSource = self
    }


    
    func getBooks(with text: String?) {
        
        guard let text = text, !text.characters.isEmpty else { return }
        let formatedString = text.lowercased().replacingOccurrences(of: " ", with: "+")
        
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(formatedString)&maxResults=5"
        let url = URL(string: urlString)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: url!) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : Any]
                
                let items = json["items"] as! [[String: Any]]
                
                for item in items {
                    let info = item["volumeInfo"] as! [String: Any]
                    
                    let title = info["title"] as! String
                    let authors = info["authors"] as! [String]
                    let smallThumbnail = (info["imageLinks"] as! [String: String])["smallThumbnail"]
                    let book = Book(title: title, authors: authors, thumbnail: smallThumbnail)
                    
                    self.results.append(book)
                }
                
                print(self.results)
                
                DispatchQueue.main.async {
                    self.tablemView.reloadData()
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookUITableViewCell
        
        let book = results[indexPath.row]
        
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.authors?.first
        
        if let imageUrl = book.smallThumbnail,
            let url = URL(string: imageUrl) {
            cell.bookImageView.setImage(from: url)
        }
        return cell
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getBooks(with: searchBar.text)
    }
}

extension UIImageView {
    func setImage(from url: URL) {
        let urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

