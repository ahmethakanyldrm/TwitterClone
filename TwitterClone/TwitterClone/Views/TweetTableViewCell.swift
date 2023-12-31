//
//  TweetTableViewCell.swift
//  TwitterClone
//
//  Created by AHMET HAKAN YILDIRIM on 27.07.2023.
//

import UIKit

protocol TweetTableViewCellDelegate: AnyObject {
    func tweetTableViewCellDidTapReply()
    func tweetTableViewCellDidTapRetweet()
    func tweetTableViewCellDidTapLike()
    func tweetTableViewCellDidTapShare()
}

class TweetTableViewCell: UITableViewCell {
    // MARK: - Properties

    static let identifier = "TweetTableViewCell"

    private let actionSpacing: CGFloat = 60

    weak var delegate: TweetTableViewCellDelegate?

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .red
        return imageView
    }()

    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ahmet Hakan"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@ahmethakan"
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let tweetTextContentLabel: UILabel = {
        let label = UILabel()
        label.text = "This is my Mockup tweet. it is going to take multiple lines. i believe some more text is enough but lets add some more anyway.."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()

    private let retweetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()

    private let likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()

    private let shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()

    // MARK: - initialize methods

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(tweetTextContentLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        configureConstraints()
        configureButtons()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selector

    @objc private func didTapReply() {
        delegate?.tweetTableViewCellDidTapReply()
    }

    @objc private func didTapRetweet() {
        delegate?.tweetTableViewCellDidTapRetweet()
    }

    @objc private func didTapLike() {
        delegate?.tweetTableViewCellDidTapLike()
    }

    @objc private func didTapShare() {
        delegate?.tweetTableViewCellDidTapShare()
    }

    // MARK: - Helpers

    private func configureButtons() {
        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
    }

    private func configureConstraints() {
       
        let avatarImageViewConstraints = [
                    avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                    avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
                    avatarImageView.heightAnchor.constraint(equalToConstant: 50),
                    avatarImageView.widthAnchor.constraint(equalToConstant: 50)
                ]
                
                
                let displayNameLabelConstraints = [
                    displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
                    displayNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
                ]
                
                let usernameLabelConstraints = [
                    userNameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor, constant: 10),
                    userNameLabel.centerYAnchor.constraint(equalTo: displayNameLabel.centerYAnchor)
                ]
                
                let tweetTextContentLabelConstraints = [
                    tweetTextContentLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
                    tweetTextContentLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 10),
                    tweetTextContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                ]
                
                let replyButtonConstraints = [
                    replyButton.leadingAnchor.constraint(equalTo: tweetTextContentLabel.leadingAnchor),
                    replyButton.topAnchor.constraint(equalTo: tweetTextContentLabel.bottomAnchor, constant: 10),
                    replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
                ]
                
                
                let retweetButtonConstraints = [
                    retweetButton.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor, constant: actionSpacing),
                    retweetButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor),
                    ]
        
        let likeButtonConstraints = [
                   likeButton.leadingAnchor.constraint(equalTo: retweetButton.trailingAnchor, constant: actionSpacing),
                   likeButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
               ]
               
               let shareButtonConstraints = [
                   
                   shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: actionSpacing),
                   shareButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
               
               ]
               
               NSLayoutConstraint.activate(avatarImageViewConstraints)
               NSLayoutConstraint.activate(displayNameLabelConstraints)
               NSLayoutConstraint.activate(usernameLabelConstraints)
               NSLayoutConstraint.activate(tweetTextContentLabelConstraints)
               NSLayoutConstraint.activate(replyButtonConstraints)
               NSLayoutConstraint.activate(retweetButtonConstraints)
               NSLayoutConstraint.activate(likeButtonConstraints)
               NSLayoutConstraint.activate(shareButtonConstraints)
        
    }
}
