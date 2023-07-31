
import UIKit


// ⭐️ 스토리보드에서 화면 전환 할때 잊지 말고 스토리보드 ID 입력하기
class DetailViewController: UIViewController {

    
    var detailString: String?
    
    @IBOutlet var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.detailLabel.text = detailString
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
