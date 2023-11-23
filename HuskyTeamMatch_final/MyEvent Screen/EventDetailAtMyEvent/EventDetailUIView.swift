//
//  EventDetailUIView.swift
//  HuskyTeamMatch_final
//
//  Created by Lingjing Liu on 11/22/23.
//

import UIKit

class EventDetailUIView: UIView {
    var event : Event!
    var scrollView = UIScrollView()
    let contentView = UIView()
    var titleLabel : UILabel!
    var timeLabel : UILabel!
    var dateLabel:UILabel!
    var locationLabel:UILabel!
    var capacityLabel:UILabel!
    var imageLabel:UILabel!
    var descriptionLabel: UILabel!
    var dropOutButton:UIButton!

    override init(frame:CGRect){
        super.init(frame:frame)
        self.backgroundColor = .white
        scrollView = UIScrollView(frame: self.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        self.addSubview(scrollView)
        setupContentView()
      
        
        // set up UI
        setupUI(in: contentView)
        
        
        
        
        
        initConstraints()
        
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContentView(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
    }
    
    func setupUI(in contentView: UIView){
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize:24, weight: .bold)
        contentView.addSubview(titleLabel)
        
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .systemFont(ofSize:18, weight: .bold)
        contentView.addSubview(dateLabel)
        
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = .systemFont(ofSize:18, weight: .bold)
        contentView.addSubview(timeLabel)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = .systemFont(ofSize: 18)
        contentView.addSubview(locationLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        contentView.addSubview(descriptionLabel)
        
        dropOutButton = UIButton(type: .system)
        dropOutButton.translatesAutoresizingMaskIntoConstraints = false
        dropOutButton.setTitle("Drop out", for: .normal)
        dropOutButton.backgroundColor = .systemGray
        dropOutButton.layer.cornerRadius = 25
        contentView.addSubview(descriptionLabel)
        
    }
    func configure(with event: Event) {
        titleLabel.text = event.title
        // Format the date and time using DateFormatter or similar
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        dateLabel.text = dateFormatter.string(from: event.date)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        timeLabel.text = timeFormatter.string(from: event.time)
        locationLabel.text = event.location
        capacityLabel.text = "Allow \(event.maxParticipants)"
        descriptionLabel.text = event.description
        
    }
    
    
    
    func initConstraints() {
        NSLayoutConstraint.activate([
           
            
            ])
        
        
        
        
       
    }
    

}
