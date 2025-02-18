//
//  MyEventTableViewCell.swift
//  HuskyTeamMatch_final
//
//  Created by Lingjing  on 11/20/23.
//

import UIKit

class MyEventTableViewCell: UITableViewCell {
    
    var wrapperCellView = UIView()
    var LabelEvent : UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style :style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupLabelEvent()
        initConstraints()
    }
    
    
    
    
    func setupWrapperCellView(){
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 4.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 2.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
        
        
        
        
    }
    func setupLabelEvent(){
        LabelEvent=UILabel()
        LabelEvent.font=UIFont.boldSystemFont(ofSize: 16)
        LabelEvent.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(LabelEvent)
        
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            LabelEvent.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            LabelEvent.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            LabelEvent.heightAnchor.constraint(equalToConstant: 20),
            LabelEvent.widthAnchor.constraint(equalTo:wrapperCellView.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
        required init?(coder: NSCoder){
            fatalError("init(coder:) has not been implemented")
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
