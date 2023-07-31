
import UIKit


// ⭐️ 스토리보드에서 화면 전환 할때 잊지 말고 스토리보드 ID 입력하기
class DetailViewController: UIViewController {
    
    // 1️⃣ receive - 공간 만들기: 데이터를 받을 공간 만들기
    var detailString: String?
    
    @IBOutlet var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBgColor()
        // 3️⃣ receive - 받은 데이터 표현하기
        self.detailLabel.text = detailString
        self.detailLabel.textColor = .brown
        self.detailLabel.numberOfLines = 0
        
        
    }
    
    @IBAction func deleteBtnClicked(_ sender: UIBarButtonItem) {
        
        //push - pop (nav)
        navigationController?.popViewController(animated: true)
      
    }
    
}
