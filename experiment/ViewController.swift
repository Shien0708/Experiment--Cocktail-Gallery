//
//  ViewController.swift
//  experiment
//
//  Created by 方仕賢 on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var neonLightImageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var galleryImageView: UIImageView!
    
    var tequilaIndex = 0
    
    var ginIndex = 0
    
    let tequila = ["domino", "iceBreaker", "mockingBird","rosita", "tequilaSunrise"]
    
    let Gin = ["ginTonic", "martinez", "martini", "negroni", "singaporeSling", "vesper", "whiteLady"]
    
    let tequilaCocktail = ["Domino", "Ice-Breaker", "Mocking Bird", "Rosita", "Tequila Sunrise"]
    
    let ginCocktail = ["Gin Tonic", "Martinez", "Martini", "Negroni", "Singapore Sling", "Vesper", "White Lady"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        galleryImageView.image = UIImage(named: Gin[0])
        name.text = ginCocktail[0]
        pageControl.currentPage = 0
        pageControl.numberOfPages = Gin.count
        view.backgroundColor = .black
        animatedNeonLight()
    }
    
    
    func animatedNeonLight() {
        let animatedImage = UIImage.animatedImageNamed("neonLight-", duration: 1.5)
        
        neonLightImageView.image = animatedImage
        
        neonLightImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180 * 25)
    }
    
    func nextTequilaImage() {
        tequilaIndex += 1
        tequilaIndex %= tequila.count
        
        galleryImageView.image = UIImage(named: tequila[tequilaIndex])
        name.text = tequilaCocktail[tequilaIndex]
    }
    
    func lastTequilaImage() {
        tequilaIndex -= 1
        tequilaIndex += tequila.count
        tequilaIndex %= tequila.count
        
        galleryImageView.image = UIImage(named: tequila[tequilaIndex])
        name.text = tequilaCocktail[tequilaIndex]
        
    }
    
    func lastGinImage() {
        ginIndex -= 1
        ginIndex += Gin.count
        ginIndex %= Gin.count
        
        galleryImageView.image = UIImage(named: Gin[ginIndex])
        name.text = ginCocktail[ginIndex]
        
    }
    
    func nextGinImage() {
        ginIndex += 1
        ginIndex %= Gin.count
        
        galleryImageView.image = UIImage(named: Gin[ginIndex])
        name.text = ginCocktail[ginIndex]
    }
    
    
    @IBAction func next(_ sender: Any) {
        if galleryImageView.image == UIImage(named: Gin[ginIndex]) {
            nextGinImage()
            pageControl.currentPage = ginIndex
        } else {
            nextTequilaImage()
            pageControl.currentPage = tequilaIndex
            
        }
    }
    
    
    @IBAction func previous(_ sender: Any) {
        if galleryImageView.image == UIImage(named: Gin[ginIndex]) {
            lastGinImage()
            pageControl.currentPage = ginIndex
        } else {
            lastTequilaImage()
            pageControl.currentPage = tequilaIndex
            
        }
    }
    
    
    @IBAction func picturesSegment(_ sender: UISegmentedControl) {
        
        if segmentControl.selectedSegmentIndex == 0 {
            galleryImageView.image = UIImage(named: Gin[ginIndex])
            pageControl.numberOfPages = Gin.count
            pageControl.currentPage = ginIndex
            name.text = ginCocktail[ginIndex]
        } else {
            galleryImageView.image = UIImage(named: tequila[tequilaIndex])
            pageControl.numberOfPages = tequila.count
            pageControl.currentPage = tequilaIndex
            name.text = tequilaCocktail[tequilaIndex]
        }
        
        
        
    }

    @IBAction func imagePageControl(_ sender: UIPageControl) {
       
        if galleryImageView.image == UIImage(named: Gin[ginIndex]) {
            nextGinImage()
            pageControl.currentPage = ginIndex
        } else {
            nextTequilaImage()
            pageControl.currentPage = tequilaIndex
        }
        
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        
        if galleryImageView.image == UIImage(named: Gin[ginIndex]) {
                lastGinImage()
                pageControl.currentPage = ginIndex
                
            } else {
                lastTequilaImage()
                pageControl.currentPage = tequilaIndex
            }
    
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
       
                
            
        
        if galleryImageView.image == UIImage(named: Gin[ginIndex]) {
            nextGinImage()
            pageControl.currentPage = ginIndex
            
        } else {
            nextTequilaImage()
            pageControl.currentPage = tequilaIndex
        }
        
    
    }
    

}
