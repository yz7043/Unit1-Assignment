//
//  ViewController.swift
//  Flix
//
//  Created by Yuxiang Zhu on 18/2/2022.
//

import UIKit
import AlamofireImage
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                // TODO: Get the array of movies
                 self.movies = dataDictionary["results"] as! [[String:Any]]
                 self.tableView.reloadData()
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data

             }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MyMovieCell
        let movie = self.movies[indexPath.row]
        let title = movie["title"] as! String
        cell.TitleLabel.text = title
        cell.SynopsisLabel.text = movie["overview"] as? String
        let baseurl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseurl + posterPath)
        cell.MovieImage.af_setImage(withURL: posterURL!)
        return cell
    }

}

