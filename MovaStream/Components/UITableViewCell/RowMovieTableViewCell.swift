//
//  RowTableViewCell.swift
//  MovaStream
//
//  Created by HauNguyen on 27/04/2566 BE.
//

import UIKit

protocol RowMovieTableViewCellDelegate: AnyObject {
    func rowTableViewCellDidTapCell(_ cell: RowMovieTableViewCell, model movie: Movie)
}

struct RowMovieTableViewCellModel: Codable {
    init() {
        self.rowName = ""
        self.movies = [Movie]()
    }
    init(rowName: String, movies: [Movie]) {
        self.rowName = rowName
        self.movies = movies
    }
    let rowName: String
    let movies: [Movie]
}

class RowMovieTableViewCell: UITableViewCell {
    
    static let identifier = "RowTableViewCell"
    
    weak var delegate: RowMovieTableViewCellDelegate?
    
    private var movies = [Movie]()
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 140, height: 200)
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(CardMovieImageCollectionViewCell.self, forCellWithReuseIdentifier: CardMovieImageCollectionViewCell.identifier)
        collectionView.backgroundColor = .greyDark
        return collectionView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.insertSubview(collectionView, at: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    private func downloadTitleAt(indexPath: IndexPath) {
        print("Item index at: " + indexPath.description)
    }
    
    public func updateCellWith(with movies: [Movie]) {
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}


extension RowMovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMovieImageCollectionViewCell.identifier, for: indexPath) as? CardMovieImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.updateCellWith(model: movies[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let movie = self.movies[indexPath.row]
        self.delegate?.rowTableViewCellDidTapCell(self, model: movie)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil) {[weak self] _ in
                let downloadAction = UIAction(title: "Download", subtitle: nil, image: nil, identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                    self?.downloadTitleAt(indexPath: indexPath)
                }
                return UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [downloadAction])
            }
        
        return config
    }
}


import SwiftUI

struct RowTableViewCellDelegate_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: HomeViewController())
    }
}
