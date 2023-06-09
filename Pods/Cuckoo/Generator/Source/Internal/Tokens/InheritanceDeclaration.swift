public struct InheritanceDeclaration: Token {
    public static let empty = InheritanceDeclaration(name: Tokenizer.nameNotSet)
    public let name: String

    public func isEqual(to other: Token) -> Bool {
        guard let other = other as? InheritanceDeclaration else { return false }
        return self.name == other.name
    }
}
