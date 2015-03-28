//
//  CamUploads.swift
//  TruckingPro
//
//  Created by Faisal on 3/22/15.
//  Copyright (c) 2015 Smash Analytics. All rights reserved.
//

class CamUploadsViewController: UIViewController, UICollectionViewDelegate,UIImagePickerControllerDelegate, UICollectionViewDataSource,UINavigationControllerDelegate {
    
    var picker:UIImagePickerController?=UIImagePickerController()
    var images = []
    @IBOutlet weak var collectView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSON()
        super.viewDidLoad()
        picker!.delegate=self
    }

    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func shootPoto(sender: AnyObject) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker?.allowsEditing = false
            picker?.sourceType = UIImagePickerControllerSourceType.Camera
            picker?.cameraCaptureMode = .Photo
            presentViewController(picker!, animated: true, completion: nil)
        } else {
            noCamera()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        // borders around safety info
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.redColor()]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadJSON(){
        
        let documentsUrl =  NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL

        if var directoryContents =  NSFileManager.defaultManager().contentsOfDirectoryAtPath(documentsUrl.path! + "/TruckingPro/", error: nil) {
            self.images = (directoryContents)
        }
        println(self.images)
        self.collectView.reloadData()
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        println(self.images.count)
        return self.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("truckImg", forIndexPath: indexPath) as UICollectionViewCell
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true)
        
        let docsDir = dirPaths[0] as String
        let documentsUrl =  NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL
        var fileName = docsDir.stringByAppendingPathComponent("TruckingPro/" )

        var imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))

        if (cell.viewWithTag(5) != nil){
            cell.viewWithTag(5)?.removeFromSuperview()
        }

        var imageUrl: AnyObject = self.images[indexPath.row]
        var urlStr: NSString = imageUrl as NSString
        urlStr = fileName + "/" + urlStr
        imageView.image = UIImage(contentsOfFile: urlStr)

        imageView.tag = 5
        cell.addSubview(imageView)

        return cell
    }

    
    func saveFile(image : UIImage){
        
        let filemgr = NSFileManager.defaultManager()
        
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true)
        
        let docsDir = dirPaths[0] as String
        let newDir = docsDir.stringByAppendingPathComponent("TruckingPro")
        
        var error: NSError?
        
        if !filemgr.createDirectoryAtPath(newDir,
          withIntermediateDirectories: true,
          attributes: nil,
          error: &error) {
        
        }
        
        var timeStamp: String {
            get {
                return "\(NSDate().timeIntervalSince1970 * 1000)"
            }
        }
        
        var fileName = docsDir.stringByAppendingPathComponent("TruckingPro/" + timeStamp + ".png")
        println(fileName)
        println(UIImagePNGRepresentation(image).writeToFile(fileName, atomically: true))
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var chosenImage = info[UIImagePickerControllerOriginalImage] as UIImage
        self.saveFile(chosenImage)
        self.loadJSON()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}