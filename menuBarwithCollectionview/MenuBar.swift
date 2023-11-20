//
//  MenuBar.swift
//  menuBarwithCollectionview
//
//  Created by Talib on 23/08/23.
//

import UIKit


class MenuBar:UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
   
    
    override init(frame: CGRect) {
        super.init(frame:frame)
       
        backgroundColor = .blue
        
     setupUI()
        
    }
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame:.zero, collectionViewLayout:layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .red
        
        return cv
        
    }()
    
    let cellId = "cellId"
    let imageArr = ["house.fill","person.crop.circle","circle.fill","sun.max"]
    func setupUI(){
        addSubview(collectionView)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier:cellId)
        collectionView.selectItem(at:IndexPath(item:0, section:0), animated:true, scrollPosition:.top)
        
        let indexPath = IndexPath(item:0, section:0)
        
        collectionView.selectItem(at:indexPath, animated:true, scrollPosition:.centeredHorizontally)
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo:leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo:trailingAnchor),
            collectionView.topAnchor.constraint(equalTo:topAnchor),
            collectionView.bottomAnchor.constraint(equalTo:bottomAnchor)
        
        
        
        
        
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:cellId, for:indexPath) as! MenuCell
        cell.imageView.image = UIImage(systemName:imageArr[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.imageView.tintColor = .systemGray4
//        cell.backgroundColor = .blue
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:frame.width/4, height:frame.height)
    }
    
}

class MenuCell:UICollectionViewCell{
    
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName:"house.fill")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
        
    }()
    
    override var isHighlighted: Bool  {
        
        didSet{
              
            imageView.tintColor = isHighlighted ? .white : .gray
        }
    
    }
    
    
    override var isSelected: Bool  {
        
        didSet{
              
            imageView.tintColor = isSelected ? .white : .gray
        }
    
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            
            imageView.heightAnchor.constraint(equalToConstant:28),
            imageView.widthAnchor.constraint(equalToConstant:28),
            imageView.centerXAnchor.constraint(equalTo:centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo:centerYAnchor)
            
        
        
        
        
        ])
        
        
    }
    
    
}

