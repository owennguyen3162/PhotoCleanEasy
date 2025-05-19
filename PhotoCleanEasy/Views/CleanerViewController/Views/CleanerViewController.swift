import UIKit
import SnapKit
import RxSwift

class CleanerViewController: BaseViewController {
    
    private let disposeBag = DisposeBag()
    private let cleanerViewModel = CleanerViewModel()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .c141414
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var viewStorageUsage: UIView = {
        let view = UIView()
        view.backgroundColor = .c292929
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var circleProcessView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var titleStorageUsage: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.text = "Storage Usage"
        return label
    }()
    
    private lazy var titleDiskSpace: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textAlignment = .center
        label.text = "51 / 63 GB used"
        return label
    }()
    
    private lazy var buttonSmartScan: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Smart Scan", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = .c3DD071
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func initUI() {
        super.initUI()
        view.backgroundColor = .c141414
        setupView()
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(viewStorageUsage)
        viewStorageUsage.addSubview(circleProcessView)
        viewStorageUsage.addSubview(titleStorageUsage)
        viewStorageUsage.addSubview(titleDiskSpace)
        viewStorageUsage.addSubview(buttonSmartScan)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.bottom.greaterThanOrEqualTo(viewStorageUsage.snp.bottom).offset(20)
        }
        
        viewStorageUsage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(127)
        }
        
        circleProcessView.snp.makeConstraints { make in
            make.width.height.equalTo(103)
            make.centerY.equalToSuperview()
            make.leading.equalTo(viewStorageUsage.snp.leading).inset(24)
        }
        
        titleStorageUsage.snp.makeConstraints { make in
            make.top.equalTo(circleProcessView.snp.top).inset(15)
            make.leading.equalTo(circleProcessView.snp.trailing).inset(25)
            make.trailing.equalToSuperview().inset(-5)
        }
        
        titleDiskSpace.snp.makeConstraints { make in
            make.top.equalTo(titleStorageUsage.snp.bottom).inset(-7)
            make.leading.equalTo(circleProcessView.snp.trailing).inset(25)
            make.trailing.equalToSuperview().inset(-5)
        }
        
        buttonSmartScan.snp.makeConstraints { make in
            make.top.equalTo(titleDiskSpace.snp.bottom).inset(-7)
            make.leading.equalTo(circleProcessView.snp.trailing).inset(-25)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(35)
        }
       
        titleDiskSpace.text = cleanerViewModel.caculatorDiskSpaceInBytes()
        
    }
    
    override func unmount() {
        super.unmount()
    }
}
