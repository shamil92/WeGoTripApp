//
//  FirstFeedbackVC.swift
//  TestApp
//
//  Created by Shamil on 14.05.2022.
//

import UIKit
import PanModal
import SnapKit


class FirstFeedbackVC: UIViewController {
    
    // MARK: - Property
    
    var feedback: FeedbackRequestModel?
    
    // MARK: - Views
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 80 / 2
        return image
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Офигенно, вы дошли до конца! \nРасскажите, как вам?"
        label.textColor = .black
        label.font = .systemFont(ofSize: Constant.isThiniPhone ? 18 : 20, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var firstSlider: CustomSliderView = {
        let firstSwitch = CustomSliderView()
        return firstSwitch
    }()
    
    private lazy var secondSlider: CustomSliderView = {
        let firstSwitch = CustomSliderView()
        firstSwitch.titleLabel.text = "Понравился гид?"
        return firstSwitch
    }()
    
    private lazy var thirdSlider: CustomSliderView = {
        let firstSwitch = CustomSliderView()
        firstSwitch.titleLabel.text = "Как вам подача информации?"
        return firstSwitch
    }()
    
    private lazy var fourthSlider: CustomSliderView = {
        let firstSwitch = CustomSliderView()
        firstSwitch.titleLabel.text = "Удобная навигация между шагами?"
        return firstSwitch
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        button.setTitle("Далее", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        NetworkServiceManager.shared.view = self
        NetworkServiceManager.shared.getImage()
        addSubviews()
        setConstraints()
    }
    
    // MARK: - AddSubviews
    
    func addSubviews() {
        view.backgroundColor = .white
        [logoImageView,titleLabel,firstSlider,secondSlider,thirdSlider,fourthSlider,button].forEach { view.addSubview($0) }
    }
    
    // MARK: - SetConstraints
    
    func setConstraints() {
        logoImageView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.width.equalTo(80)
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(10)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        firstSlider.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.height.equalTo(Constant.isThiniPhone ? 50 : 80)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        secondSlider.snp.makeConstraints {
            $0.top.equalTo(firstSlider.snp.bottom).offset(10)
            $0.height.equalTo(Constant.isThiniPhone ? 50 : 80)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        thirdSlider.snp.makeConstraints {
            $0.top.equalTo(secondSlider.snp.bottom).offset(10)
            $0.height.equalTo(Constant.isThiniPhone ? 50 : 80)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        fourthSlider.snp.makeConstraints {
            $0.top.equalTo(thirdSlider.snp.bottom).offset(10)
            $0.height.equalTo(Constant.isThiniPhone ? 50 : 80)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        button.snp.makeConstraints {
            $0.top.equalTo(fourthSlider.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
    // MARK: - Action
    
    @objc func buttonAction() {
        feedback = FeedbackRequestModel(tourID: Int.random(in: 1...100), estimationOfTour: firstSlider.slider.value , estimationOfGuide: secondSlider.slider.value , submissionOfInformation: thirdSlider.slider.value , navigatingBetweenSteps: fourthSlider.slider.value , positiveText: "", adviceText: "")
        
        let vc = SecondFeedbackVC()
        vc.feedback = feedback
        presentPanModal(vc)
    }
}


// MARK: - PanModalPresentable

extension FirstFeedbackVC: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeight(Constant.isThiniPhone ? (70 * 4) + 220 : (100 * 4) + 220 )
    }
}

// MARK: - UpdateViewControllerDelegate

extension FirstFeedbackVC: UpdateViewControllerDelegate {
    func update(data: Data) {
        DispatchQueue.main.async {
            self.logoImageView.image = UIImage(data: data)
        }
    }
}
