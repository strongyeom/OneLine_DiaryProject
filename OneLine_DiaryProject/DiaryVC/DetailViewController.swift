
import UIKit


// ⭐️ 스토리보드에서 화면 전환 할때 잊지 말고 스토리보드 ID 입력하기
class DetailViewController: UIViewController {
    
    
    var detailString: String?
    
    @IBOutlet var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBgColor()
        self.detailLabel.text = detailString
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteBtnClicked(_ sender: UIBarButtonItem) {
        
        //push - pop (nav)
        navigationController?.popViewController(animated: true)
      
    }
    
}
