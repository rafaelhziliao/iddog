import Foundation

public protocol Fillable {
    associatedtype FillData
    func fill(with data: FillData)
}
