//
//  CustomSwitchView.swift
//  TestApp
//
//  Created by Shamil on 16.05.2022.
//


import UIKit
import SnapKit

class CustomSliderView: UIView {

    //MARK: - Properties
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Как вам тур в целом?"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: Constant.isThiniPhone ? 14 : 17, weight: .regular)
        return label
    }()
    lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
     lazy var slider: UISlider = {
        let slider = UISlider()
         slider.minimumValue = 1
         slider.maximumValue = 5
         slider.value = 3
         slider.addTarget(self, action: #selector(actionSlider), for: .allEvents)
         slider.thumbTintColor = .white
         slider.minimumTrackTintColor = .blue
         slider.maximumTrackTintColor = .blue
        return slider
    }()
    
    //MARK: - Lifecycle

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addSubviews()
        layout()
        actionSlider()
    }
    
    //MARK: - SetupSubviews

    func addSubviews() {
        [imageView,titleLabel,slider].forEach({ addSubview($0) })
    }
        
    //MARK: - Layout

    func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constant.isThiniPhone ? 5 : 10)
            $0.leading.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.top.equalTo(titleLabel.snp.top)
            $0.trailing.equalToSuperview()
            $0.size.equalTo(Constant.isThiniPhone ? 20 : 35)
        }
        slider.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(Constant.isThiniPhone ? 5 : 10)
            $0.height.equalTo(Constant.isThiniPhone ? 15 : 25)
        }
    }
    
    //MARK: - Action func
    
    @objc func actionSlider() {
        slider.value = roundf(slider.value)
        
        switch slider.value {
        case 1:
            imageView.image = UIImage(named: "emoji1")
        case 2:
            imageView.image = UIImage(named: "emoji2")
        case 3:
            imageView.image = UIImage(named: "emoji3")
        case 4:
            imageView.image = UIImage(named: "emoji4")
        case 5:
            imageView.image = UIImage(named: "emoji5")
        default:
            break
        }
    }
    
    
}
