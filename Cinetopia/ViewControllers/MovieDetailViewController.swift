//
//  MovieDetailViewController.swift
//  Cinetopia
//
//  Created by Alex Sandro on 07/01/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = movie.title
        
        return label
    }()
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16.0
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: movie.image)
        
        return imageView
    }()
    
    private lazy var movieRatioTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.text = "Classificação dos usuários: \(movie.rate)"
        
        return label
    }()
    
    private lazy var movieSynopsisTextLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textDescription
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = movie.synopsis
        
        return label
    }()
    
    private func addSubview() {
        view.addSubview(movieTitleLabel)
        view.addSubview(moviePosterImageView)
        view.addSubview(movieRatioTextLabel)
        view.addSubview(movieSynopsisTextLabel)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            movieTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            moviePosterImageView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 32),
            moviePosterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 176),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 236),
            
            movieRatioTextLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 24),
            movieRatioTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            movieSynopsisTextLabel.topAnchor.constraint(equalTo: movieRatioTextLabel.bottomAnchor, constant: 40),
            movieSynopsisTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieSynopsisTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubview()
        setupContraints()
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
