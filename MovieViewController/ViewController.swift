import UIKit

class MovieViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var actionCollectionView: UICollectionView?
    private var animationCollectionView: UICollectionView?

    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "frozenHeader")
        return imageView
    }()

    private let headerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    private let headerTitleView: UILabel = {
        let label = UILabel()
        label.text = "Movie"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    private let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menuIcon"), for: .normal)
        return button
    }()

    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "searchIcon"), for: .normal)
        return button
    }()

    private let actionLabel: UILabel = {
        let label = UILabel()
        label.text = "Action"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .blue
        return label
    }()
    
   
    private let animationLabel: UILabel = {
        let label = UILabel()
        label.text = "Animation"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .blue
        return label
    }()

    private let actionMovies: [Movie] = [
        Movie(title: "Star Wars", imageName: "starwars"),
        Movie(title: "Jumanji", imageName: "jumanji"),
        Movie(title: "Zombieland", imageName: "zombieland")
    ]
    
    private let animationMovies: [Movie] = [
        Movie(title: "Frozen II", imageName: "frozen2"),
        Movie(title: "Red Shoes", imageName: "redshoes"),
        Movie(title: "Spies in Disguise", imageName: "spies")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(headerContainerView)
        headerContainerView.addSubview(headerTitleView)
        headerContainerView.addSubview(menuButton)
        headerContainerView.addSubview(searchButton)
        view.addSubview(headerImageView)

        view.addSubview(actionLabel)
        view.addSubview(animationLabel)

        let actionLayout = UICollectionViewFlowLayout()
        actionLayout.scrollDirection = .horizontal
        actionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        actionLayout.minimumLineSpacing = 10

        actionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: actionLayout)
        actionCollectionView?.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        actionCollectionView?.delegate = self
        actionCollectionView?.dataSource = self
        actionCollectionView?.backgroundColor = .clear
        view.addSubview(actionCollectionView!)

        let animationLayout = UICollectionViewFlowLayout()
        animationLayout.scrollDirection = .horizontal
        animationLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        animationLayout.minimumLineSpacing = 10

        animationCollectionView = UICollectionView(frame: .zero, collectionViewLayout: animationLayout)
        animationCollectionView?.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        animationCollectionView?.delegate = self
        animationCollectionView?.dataSource = self
        animationCollectionView?.backgroundColor = .clear
        view.addSubview(animationCollectionView!)
        
        headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        headerTitleView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        actionCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        animationCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        actionLabel.translatesAutoresizingMaskIntoConstraints = false
        animationLabel.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerContainerView.heightAnchor.constraint(equalToConstant: 44),

            menuButton.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 10),
            menuButton.centerYAnchor.constraint(equalTo: headerContainerView.centerYAnchor),
            menuButton.widthAnchor.constraint(equalToConstant: 30),
            menuButton.heightAnchor.constraint(equalToConstant: 30),

            searchButton.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -10),
            searchButton.centerYAnchor.constraint(equalTo: headerContainerView.centerYAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 30),
            searchButton.heightAnchor.constraint(equalToConstant: 30),

            headerTitleView.centerXAnchor.constraint(equalTo: headerContainerView.centerXAnchor),
            headerTitleView.centerYAnchor.constraint(equalTo: headerContainerView.centerYAnchor),
            headerTitleView.leadingAnchor.constraint(greaterThanOrEqualTo: menuButton.trailingAnchor, constant: 10),
            headerTitleView.trailingAnchor.constraint(lessThanOrEqualTo: searchButton.leadingAnchor, constant: -10),

            headerImageView.topAnchor.constraint(equalTo: headerContainerView.bottomAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 200),

            actionLabel.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 20),
            actionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

            actionCollectionView!.topAnchor.constraint(equalTo: actionLabel.bottomAnchor, constant: 10),
            actionCollectionView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            actionCollectionView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            actionCollectionView!.heightAnchor.constraint(equalToConstant: 220),

            animationLabel.topAnchor.constraint(equalTo: actionCollectionView!.bottomAnchor, constant: 20),
            animationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

            animationCollectionView!.topAnchor.constraint(equalTo: animationLabel.bottomAnchor, constant: 10),
            animationCollectionView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationCollectionView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationCollectionView!.heightAnchor.constraint(equalToConstant: 220),
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == actionCollectionView {
            return actionMovies.count
        } else if collectionView == animationCollectionView {
            return animationMovies.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == actionCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
                return UICollectionViewCell()
            }
            let movie = actionMovies[indexPath.row]
            cell.configure(with: movie)
            return cell
        } else if collectionView == animationCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
                return UICollectionViewCell()
            }
            let movie = animationMovies[indexPath.row]
            cell.configure(with: movie)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 210) 
    }
}
