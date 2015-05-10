//
//  DetailViewController.swift
//  MoviePreviewOficial
//
//  Created by Kaue Mendes on 4/30/15.
//  Copyright (c) 2015 Fellas Group. All rights reserved.
//

import UIKit
import MediaPlayer

class DetailViewController: UIViewController {

    var filmes = [String:String]()
    var player:MPMoviePlayerController?

    @IBOutlet weak var txtDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        setupScreen()
        if let url : String? = filmes["movieURL"] {
            executarVideo(url)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func executarVideo(url:String?){
        
        if url == nil {
            
        } else {
        
            let videoPath:NSURL = NSURL(string: url!)!

            // Inicializa o player com o video recuperado
            self.player = MPMoviePlayerController(contentURL: videoPath)
        
            // Configura o frame do video
            self.player!.view.frame = CGRectMake(20, 80, 380, 190)
        
            // Adiciona o player a view
            self.view.addSubview(self.player!.view)
        
            // Inicia o video
            self.player!.play()
        }
    }

    
    func setupScreen() {
        self.txtDetail.text = filmes["descricao"]
       
        UIView.animateWithDuration(1.0, animations: { () -> Void in
        
            self.txtDetail.alpha = 1.0
            
            self.txtDetail.frame = CGRectMake(
                self.txtDetail.frame.origin.x,
                self.txtDetail.frame.origin.y - 50,
                self.txtDetail.frame.size.width,
                self.txtDetail.frame.size.height)
            
        }) { (completed) -> Void in
            //...
        }
    }
    
}

