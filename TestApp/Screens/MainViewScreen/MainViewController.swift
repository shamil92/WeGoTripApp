//
//  ViewController.swift
//  TestApp
//
//  Created by Shamil on 14.05.2022.
//

import UIKit
import SnapKit
import PanModal
import Alamofire


class MainViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var weGoTripImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weGoTrip")
        return image
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "WeGoTrip"
        label.font = .systemFont(ofSize: Constant.isThiniPhone ? 17 : 20, weight: .bold)
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        button.setTitle("Добавить отзыв", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setConstraints()
    }
    
    // MARK: - AddSubviews
    
    func addSubviews() {
        view.backgroundColor = .white
        [button,weGoTripImage,textLabel].forEach({view.addSubview($0)})
    }
    
    // MARK: - SetConstraints
    
    func setConstraints() {
        weGoTripImage.snp.makeConstraints {
            $0.height.width.equalTo(100)
            $0.top.equalToSuperview().offset(70)
            $0.centerX.equalToSuperview()
        }
        textLabel.snp.makeConstraints {
            $0.top.equalTo(weGoTripImage.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        button.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().offset(-40)
        }
    }
    
    // MARK: - Action
    
    @objc func buttonAction() {
        let vc = FirstFeedbackVC()
        presentPanModal(vc)
    }
}
