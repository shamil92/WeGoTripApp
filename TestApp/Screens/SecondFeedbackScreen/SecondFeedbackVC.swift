//
//  SecondFeedBackVC.swift
//  TestApp
//
//  Created by Shamil on 17.05.2022.
//

import UIKit
import PanModal
import SnapKit


class SecondFeedbackVC: UIViewController  {

    // MARK: - Property

    var feedback: FeedbackRequestModel?

    // MARK: - Views

    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Что вам особенно понравилось в этом \nтуре?"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: Constant.isThiniPhone ? 15 : 18, weight: .bold)
        return label
    }()
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Как мы могли бы улучшить подачу \nинформации?"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: Constant.isThiniPhone ? 15 : 18, weight: .bold)
        return label
    }()
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 80 / 2
        return image
    }()
    private lazy var positiveFeedbackTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 16)
        textView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        return textView
    }()
    private lazy var adviceFeedbackTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        textView.layer.cornerRadius = 5
        return textView
    }()
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        button.setTitle("Сохранить отзыв", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        NetworkServiceManager.shared.view = self
        NetworkServiceManager.shared.getImage()
        addSubviews()
        setConstraints()
    }
    
    //MARK: - AddSubviews

    func addSubviews() {
        view.backgroundColor = .white
        [firstLabel,secondLabel, logoImageView,positiveFeedbackTextView,adviceFeedbackTextView,button].forEach({ view.addSubview($0)})
    }
    
    //MARK: - SetConstraints
    
    func setConstraints() {
        logoImageView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.width.equalTo(80)
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(10)
        }
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(20)
            $0.height.equalTo(50)
        }
        positiveFeedbackTextView.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(100)
        }
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(positiveFeedbackTextView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(20)
            $0.height.equalTo(50)
        }
        adviceFeedbackTextView.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(100)
        }
        button.snp.makeConstraints {
            $0.top.equalTo(adviceFeedbackTextView.snp.bottom).offset(30)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: - Action

    @objc func buttonAction() {
        let feedbacks = FeedbackRequestModel(tourID: feedback?.tourID ?? 0, estimationOfTour: feedback?.estimationOfTour ?? 0, estimationOfGuide: feedback?.estimationOfGuide ?? 0, submissionOfInformation: feedback?.submissionOfInformation ?? 0, navigatingBetweenSteps: feedback?.navigatingBetweenSteps ?? 0, positiveText: positiveFeedbackTextView.text ?? "", adviceText: adviceFeedbackTextView.text ?? "")
        
        OrderServiceImp.shared.createFeeback(model: feedbacks) { result in
            switch result {
            case .success(_):
                let alert = UIAlertController(title: "Внимание", message: "Cпасибо за оставленный отзыв)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                    self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            case .failure(_):
                print("error")
            }
        }
    }
}

//MARK: - PanModalPresentable
extension SecondFeedbackVC: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeight(600)
    }
    
}

//MARK: - UpdateViewControllerDelegate
extension SecondFeedbackVC: UpdateViewControllerDelegate {
    func update(data: Data) {
        DispatchQueue.main.async {
            self.logoImageView.image = UIImage(data: data)
        }
    }
}
