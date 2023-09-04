import UIKit

class HeaderLayout: UICollectionViewFlowLayout{
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributtes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributtes?.forEach({ attribute in
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader {
                guard let collectionView = collectionView else { return }
                let contentOffSetY = collectionView.contentOffset.y
                attribute.frame = CGRect(x: 0,
                                         y: contentOffSetY,
                                         width: collectionView.bounds.width,
                                         height: attribute.bounds.height - contentOffSetY)
            }
        })
        return layoutAttributtes
    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
class DetailsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var user: Usuario? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    let cellId = "cellId"
    let headerId = "headerId"
    let profileId = "profileId"
    let photoId = "PhotoId"
    
    init() {
        super.init(collectionViewLayout: HeaderLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(DetalheHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerId)
        collectionView.register(DetailProfileCell.self, forCellWithReuseIdentifier: profileId)
        collectionView.register(DetailPhotoCell.self, forCellWithReuseIdentifier: photoId)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height * 0.7)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileId, for: indexPath) as! DetailProfileCell
            cell.user = self.user
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoId, for: indexPath) as! DetailPhotoCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DetalheHeaderView
            header.user = self.user
            return header
        } else {
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = UIScreen.main.bounds.width
        var height: CGFloat = UIScreen.main.bounds.width * 0.66
        
        if indexPath.item == 0 {
            let cell = DetailProfileCell(frame: CGRect(x: 0, y: 0, width: width, height: height))
            cell.user = self.user
            cell.layoutIfNeeded()
            let sizeEstimate = cell.systemLayoutSizeFitting(CGSizeMake(width, 1000))
            height = sizeEstimate.height
        }
        return .init(width: width, height: height)
    }
}
