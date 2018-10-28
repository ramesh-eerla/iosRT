//
//  ViewController.swift
//  OperationQueueExample
//
//  Created by Sunil on 26/10/18.
//  Copyright © 2018 Sunil. All rights reserved.
//

import UIKit

class Downloader {

    class func downloadImageWithURL(url:String) -> UIImage! {

        let data = NSData(contentsOf: NSURL(string: url)! as URL)
        //print(data)
        guard let data1 = data else {
            return nil
        }
        return UIImage(data: data1 as! Data)
    }
}
class tableCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension UIImageView
{
    func loadImage() {

    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let queue = OperationQueue()
    let imageChache = NSCache<AnyObject, AnyObject>()

    let arrayValue = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://horticulturaltherapy.in/wp-content/uploads/2016/03/Pic-for-web2.jpg", "http://horticulturaltherapy.in/wp-content/uploads/2016/03/Pic-for-web2.jpg","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://horticulturaltherapy.in/wp-content/uploads/2016/03/Pic-for-web2.jpg", "http://horticulturaltherapy.in/wp-content/uploads/2016/03/Pic-for-web2.jpg","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://horticulturaltherapy.in/wp-content/uploads/2016/03/Pic-for-web2.jpg", "http://horticulturaltherapy.in/wp-content/uploads/2016/03/Pic-for-web2.jpg","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://horticulturaltherapy.in/wp-content/uploads/2016/03/Pic-for-web2.jpg", "http://horticulturaltherapy.in/wp-content/uploads/2016/03/Pic-for-web2.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://horticulturaltherapy.in/wp-content/uploads/2016/03/Pic-for-web2.jpg", "http://horticulturaltherapy.in/wp-content/uploads/2016/03/Pic-for-web2.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomCell")
        //tableView.register(tableCell.self, forCellReuseIdentifier: "CustomCell")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return arrayValue.count

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 120

    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let urlString = self.arrayValue[indexPath.row]
        //let cell = tableCell() as! tableCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
            as! tableCell
        cell.lblTitle.text = "Sravan"
        cell.lblSubTitle.text = "android"

        /*let img1 = Downloader.downloadImageWithURL(url: self.arrayValue[indexPath.row])
         cell.imgView.image = img1*/

        if let imageFromCache = imageChache.object(forKey: urlString as AnyObject) as? UIImage {
            cell.imgView.image = imageFromCache
            return cell
        }

        let operation1 = BlockOperation(block: {
            //print(" cell \(indexPath.row)")
             print(" cell \(indexPath.row)")

            let img1 = Downloader.downloadImageWithURL(url: urlString)
            OperationQueue.main.addOperation({
                let imageToCache = img1
                self.imageChache.setObject(imageToCache!, forKey: urlString as AnyObject)
                cell.imgView.image = img1
            })
        })
        queue.addOperation(operation1)

        return cell
    }

    // create a cell for each table view row

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }


}

