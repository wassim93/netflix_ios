//
//  UpcomingViewController.swift
//  netflix_clone
//
//  Created by wassim on 24/7/2022.
//

import UIKit

class UpcomingViewController: UIViewController {
    private var movies:[Movie] = [Movie]()
    
    private let upcomingTable:UITableView = {
        let table = UITableView()
        table.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        table.allowsSelection = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = Constants.UPCOMING_MOVIES
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        getUpcomingMovies()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    
    
    func getUpcomingMovies()  {
        APICaller.shared.getUpcomingMovies { [weak self] res in
            switch res {
            case .success(let movies):
                self?.movies = movies
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


extension UpcomingViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier,for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
       
        cell.configure(with: MovieViewModel(titleName: movies[indexPath.row].original_name ?? movies[indexPath.row].original_title ?? "Unknown", posterUrl: movies[indexPath.row].poster_path ?? ""))
        return cell
    }
}
