

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "result_background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR RESULT"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 45, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bmiLabel: UILabel = {
        let label = UILabel()
        label.text = bmiValue
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 100, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var adviceLabel: UILabel = {
        let label = UILabel()
        label.text = "EAT SOME MORE SNACKS!"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var recalculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("RECALCULATE", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(#colorLiteral(red: 0.6302859187, green: 0.6340871453, blue: 0.8704416156, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(recalculatePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    @objc func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ResultViewController {
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
        view.addSubview(recalculateButton)
        
        stackView.addArrangedSubview(resultLabel)
        stackView.addArrangedSubview(bmiLabel)
        stackView.addArrangedSubview(adviceLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            recalculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            recalculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
}
