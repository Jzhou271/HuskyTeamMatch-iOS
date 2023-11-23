//
//  AddNewEvent.swift
//  HuskyTeamMatch_final
//
//  Created by Lingjing Liu on 11/20/23.
//

import UIKit

class AddNewEvent: UIView {
    var event : Event!
    var scrollView = UIScrollView()
    let contentView = UIView()
    var titleLabel : UILabel!
    var titleTextField : UITextField!
    var timeLabel : UILabel!
    var dateLabel:UILabel!
    var datePicker : UIDatePicker!
    var timePicker : UIDatePicker!
    
    var locationLabel:UILabel!
    var locationTextField: UITextField!
    var capacityLabel:UILabel!
    var capacityTextField:UITextField!
    var imageLabel:UILabel!
    var buttonUploadPhoto:UIButton!
    var descriptionLabel: UILabel!
    var descriptionTextView:UITextView!
    var postButton:UIButton!
    var cancelButton: UIButton!
    
    var amPmsegmentControl : UISegmentedControl!
    var underlineView: UIView!
    
    var bottomLineForTitle: CALayer!
    var bottomLineForTime: CALayer!
    var bottomLineForLocation: CALayer!
    var bottomLineForCapacity: CALayer!
    var bottomLineForDate :CALayer!
    
    
    
    
    
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
        setuptitleLabel(in: contentView)
        setupTitleTextField(in: contentView)
        setupDateLabel(in: contentView)
        setupDate(in: contentView)
        setuptimeLabel(in: contentView)
        setupTime(in: contentView)
        
        
        
        setupLocationLabel(in: contentView)
        setupLocationTextField(in: contentView)
        
        setupCapacityLabel(in: contentView)
        setupCapacityTextField(in: contentView)
        
        setupImageLabel (in: contentView)
        setupbuttonUploadPhoto(in: contentView)
        
        setupdescriptionLabel(in: contentView)
        setupdescriptionTextView(in: contentView)
        
        setUpcancelButton(in: contentView)
        setupPostButton(in: contentView)
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
    
    
    func setuptitleLabel(in contentView: UIView){
        titleLabel = UILabel()
        titleLabel.text = "Title*"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        
    }
    func setupTitleTextField(in contentView: UIView){
        titleTextField = UITextField()
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.borderStyle = .none
        
        bottomLineForTitle = CALayer()
        bottomLineForTitle.backgroundColor = UIColor.gray.cgColor
        titleTextField.layer.addSublayer(bottomLineForTitle)
        
        contentView.addSubview(titleTextField)
        
    }
    
    
    func setuptimeLabel(in contentView: UIView){
        timeLabel = UILabel()
        timeLabel.text = "Time:"
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(timeLabel)
        
        
    }
    
    func setupDateLabel(in contentView: UIView){
        dateLabel = UILabel()
        dateLabel.text = "Date:"
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        
    }
    func setupDate(in contentView: UIView){
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(datePicker)
        bottomLineForDate = CALayer()
        bottomLineForDate.backgroundColor = UIColor.gray.cgColor
        datePicker.layer.addSublayer(bottomLineForDate)
    }
    
    func setupTime(in contentView: UIView){
        timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(timePicker)
        bottomLineForTime = CALayer()
        bottomLineForTime.backgroundColor = UIColor.gray.cgColor
        timePicker.layer.addSublayer(bottomLineForTime)
        

    }
    
    
    
    func setupLocationLabel(in contentView: UIView){
        
        locationLabel = UILabel()
        locationLabel.text = "Location:"
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(locationLabel)
        
    }
    //location need to use GPS
    func setupLocationTextField(in contentView: UIView){
        locationTextField = UITextField()
        locationTextField.placeholder = "Address, City, State, Zipcode"
        locationTextField.borderStyle = .none
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.keyboardType = .numberPad
        
        bottomLineForLocation = CALayer()
        bottomLineForLocation.backgroundColor = UIColor.gray.cgColor
        locationTextField.layer.addSublayer(bottomLineForLocation)
        
        contentView.addSubview(locationTextField)
        
        
    }
    
    
    func setupCapacityLabel(in contentView: UIView){
        capacityLabel = UILabel()
        capacityLabel.text = "Maximum Participants:"
        capacityLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(capacityLabel)
        
    }
    func setupCapacityTextField(in contentView: UIView){
        capacityTextField = UITextField()
        capacityTextField.borderStyle = .none
        capacityTextField.translatesAutoresizingMaskIntoConstraints = false
        capacityTextField.keyboardType = .numberPad
        contentView.addSubview(capacityTextField)
        
        bottomLineForCapacity = CALayer()
        bottomLineForCapacity.backgroundColor = UIColor.gray.cgColor
        capacityTextField.layer.addSublayer(bottomLineForCapacity)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let textField = titleTextField, let bottomLine = bottomLineForTitle {
            bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1)
        }
        // Repeat the pattern for each text field and its associated bottom line
        if let textField = datePicker, let bottomLine = bottomLineForDate{
            bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1)
        }
        if let textField = timePicker, let bottomLine = bottomLineForTime {
            bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1)
        }
        if let textField = locationTextField, let bottomLine = bottomLineForLocation {
            bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1)
        }
        if let textField = capacityTextField, let bottomLine = bottomLineForCapacity {
            bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1)
        }
    }
    
    
    func setupImageLabel (in contentView: UIView){
        imageLabel = UILabel()
        imageLabel.text = "Upload Image"
        imageLabel.font = UIFont.preferredFont(forTextStyle: .body)
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageLabel)
        
    }
    
    func setupbuttonUploadPhoto(in contentView: UIView){
        buttonUploadPhoto = UIButton(type: .system)
        buttonUploadPhoto.setTitle("Upload Image", for: .normal)
        buttonUploadPhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonUploadPhoto.imageView?.contentMode = .scaleAspectFit
        buttonUploadPhoto.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 50)
        
        buttonUploadPhoto.contentHorizontalAlignment = .fill
        buttonUploadPhoto.contentVerticalAlignment = .fill
        buttonUploadPhoto.imageView?.contentMode = .scaleAspectFit
        buttonUploadPhoto.showsMenuAsPrimaryAction = true
        buttonUploadPhoto.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonUploadPhoto)
        
    }
    
    
    
    
    func setupdescriptionLabel(in contentView: UIView){
        descriptionLabel = UILabel()
        descriptionLabel.text = "Description:"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        
    }
    
    func setupdescriptionTextView(in contentView: UIView){
        descriptionTextView = UITextView()
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.font = UIFont.systemFont(ofSize: 16)
        descriptionTextView.layer.borderColor = UIColor.gray.cgColor
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.isScrollEnabled = true
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 5)
        contentView.addSubview(descriptionTextView)
        
        
    }
    
    
    func setUpcancelButton(in contentView: UIView) {
        cancelButton = UIButton(type: .system)
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.backgroundColor = .gray
        cancelButton.layer.cornerRadius = 10
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cancelButton)
    }
    
    func setupPostButton(in contentView: UIView) {
        postButton = UIButton(type: .system)
        let sendImage = UIImage(systemName: "paperplane.fill")?.withRenderingMode(.alwaysTemplate)
        postButton.setImage(sendImage, for: .normal)
        postButton.tintColor = .black
        postButton.setTitle("Post", for: .normal)
        postButton.setTitleColor(.black, for: .normal)
        postButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        // Adjust the insets if needed
        postButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        postButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
        
        // Align the content to the right
        postButton.contentHorizontalAlignment = .right
        
        postButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(postButton)
        
        // Make sure to set up constraints for the postButton
    }
    
    
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            postButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            postButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            titleTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Constraints for 'dateLabel'
            dateLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            // Constraints for 'datePicker'
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 2),
            datePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            // Constraints for 'timeLabel'
            timeLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            // Constraints for 'timePicker'
            timePicker.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 2),
            timePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

        
//            // Constraints for the underline view
//            underlineView.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 2),
//            underlineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            underlineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            underlineView.heightAnchor.constraint(equalToConstant: 1),
            
            locationLabel.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            locationTextField.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            locationTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            locationTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            capacityLabel.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 8),
            capacityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            capacityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            capacityTextField.topAnchor.constraint(equalTo: capacityLabel.bottomAnchor, constant: 8),
            capacityTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            capacityTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            
            
            imageLabel.centerYAnchor.constraint(equalTo: buttonUploadPhoto.centerYAnchor),
            imageLabel.leadingAnchor.constraint(equalTo: buttonUploadPhoto.trailingAnchor, constant: 8),
            imageLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor,constant: -20),
            
            buttonUploadPhoto.topAnchor.constraint(equalTo: capacityTextField.bottomAnchor, constant: 8),
            buttonUploadPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            buttonUploadPhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            
            buttonUploadPhoto.heightAnchor.constraint(equalToConstant: 60),
            buttonUploadPhoto.widthAnchor.constraint(equalToConstant: 200),
            
            
            descriptionLabel.topAnchor.constraint(equalTo: buttonUploadPhoto.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            descriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 100),
            cancelButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cancelButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 100),
            
            
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: cancelButton.bottomAnchor, constant: 20)
        ])
    }
    
}
    
   
   
    
    


