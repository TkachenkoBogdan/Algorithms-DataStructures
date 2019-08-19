import UIKit





let arr = [1,4,5,6]
let arrIdxs = arr.indices
print(arrIdxs)

arrIdxs.contains(3)

arrIdxs.contains(4)

arrIdxs.startIndex


let revIdxs = arrIdxs.reversed()


revIdxs.map{print($0)}
