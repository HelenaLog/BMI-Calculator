

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorModel = CalculatorModel()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calculate_background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var calculateLabel: UILabel = {
        let label = UILabel()
        label.text = "CALCULATE YOUR BMI"
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 45, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var heightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 100
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "Height"
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "1.5m"
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 150
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "Weight"
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberWeightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "100kg"
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var heightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 3.0
        slider.value = 1.5
        slider.thumbTintColor = #colorLiteral(red: 0.6302859187, green: 0.6340871453, blue: 0.8704416156, alpha: 1)
        slider.tintColor = #colorLiteral(red: 0.6302859187, green: 0.6340871453, blue: 0.8704416156, alpha: 1)
        slider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    lazy var weightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 200
        slider.value = 100
        slider.thumbTintColor = #colorLiteral(red: 0.6302859187, green: 0.6340871453, blue: 0.8704416156, alpha: 1)
        slider.tintColor = #colorLiteral(red: 0.6302859187, green: 0.6340871453, blue: 0.8704416156, alpha: 1)
        slider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.3833496571, green: 0.3785275221, blue: 0.6149173975, alpha: 1)
        button.setTitle("CALCULATE", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    @objc func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        numberLabel.text = "\(height)m"
    }
    
    @objc func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        numberWeightLabel.text = "\(weight)kg"
    }
    
    @objc func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorModel.calculateBMI(height: height, weight: weight)
        
        let resultVC = ResultViewController()
        resultVC.bmiValue = calculatorModel.getBMIValue()
        resultVC.adviceLabel.text = calculatorModel.getAdvice()
        resultVC.view.backgroundColor = calculatorModel.getColor()
        self.present(resultVC, animated: true, completion: nil)
    }
}

extension CalculateViewController {
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(calculateLabel)
        stackView.addArrangedSubview(heightStackView)
        stackView.addArrangedSubview(heightSlider)
        stackView.addArrangedSubview(weightStackView)
        stackView.addArrangedSubview(weightSlider)
        stackView.addArrangedSubview(calculateButton)
        
        heightStackView.addArrangedSubview(heightLabel)
        heightStackView.addArrangedSubview(numberLabel)
        
        weightStackView.addArrangedSubview(weightLabel)
        weightStackView.addArrangedSubview(numberWeightLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
}
