//
//  MyEventView.swift
//  HuskyTeamMatch_final
//
//  Created by Iris on 11/16/23.
//

import UIKit

class MyEventView: UIView {
    var tableViewEvents: UITableView!
    var createEventButton:UIButton!
    var addButton: UIButton!
    var scrollView = UIScrollView()
    let contentView = UIView()
   
    
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
        setupTableViewEvents(in: contentView)
        setUpCreateEventButton(in: contentView)
        setupAddButton(in: contentView)
        initConstraints()
        
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
    
    func setupTableViewEvents(in contentView: UIView){
        tableViewEvents = UITableView()
        tableViewEvents.register(MyEventTableViewCell.self, forCellReuseIdentifier: "names")
        tableViewEvents.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tableViewEvents)
    }
    
    
    func setUpCreateEventButton(in contentView: UIView) {
        createEventButton = UIButton(type: .system)
        createEventButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        createEventButton.setTitle("Create An Event", for: .normal)
        createEventButton.setTitleColor(.black, for: .normal) // Set title color to black
        createEventButton.backgroundColor = .gray
        createEventButton.layer.cornerRadius = 10 // Rounded corners
        createEventButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(createEventButton)
    }
    
    func setupAddButton(in contentView: UIView) {
        addButton = UIButton(type: .system)
        let plusIcon = UIImage(systemName: "plus.circle.fill")
        addButton.setImage(plusIcon, for: .normal)
        
        addButton.tintColor = .black
        addButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addButton) // Add the button directly to the top view, not the contentView

        // Setup constraints within the initConstraints method
    }
    
    
    
    
    func initConstraints() {
          NSLayoutConstraint.activate([
            
            // Constraints for addButton
            addButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            addButton.widthAnchor.constraint(equalToConstant: 44),
            addButton.heightAnchor.constraint(equalToConstant: 44),
            
            
            
              // Constraints for createEventButton
              createEventButton.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
              createEventButton.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
              createEventButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -300),
              createEventButton.heightAnchor.constraint(equalToConstant: 50),

              // Constraints for tableViewEvents
              tableViewEvents.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 40),
              tableViewEvents.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
              tableViewEvents.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
              tableViewEvents.bottomAnchor.constraint(equalTo: createEventButton.topAnchor, constant: -8)
          ])
      }

    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
}
