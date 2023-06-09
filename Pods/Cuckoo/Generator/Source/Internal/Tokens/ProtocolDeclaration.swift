public struct ProtocolDeclaration: ContainerToken, HasAccessibility {
    public let implementation: Bool = false
    public var name: String
    public var parent: Reference<ParentToken>?
    public var accessibility: Accessibility
    public var range: CountableRange<Int>
    public var nameRange: CountableRange<Int>
    public var bodyRange: CountableRange<Int>
    public var initializers: [Initializer]
    public var children: [Token]
    public var inheritedTypes: [InheritanceDeclaration]
    public var attributes: [Attribute]
    public var genericParameters: [GenericParameter]
    public var isNSObjectProtocol: Bool

    public func replace(children tokens: [Token]) -> ProtocolDeclaration {
        return ProtocolDeclaration(
            name: self.name,
            parent: self.parent,
            accessibility: self.accessibility,
            range: self.range,
            nameRange: self.nameRange,
            bodyRange: self.bodyRange,
            initializers: self.initializers,
            children: tokens,
            inheritedTypes: self.inheritedTypes,
            attributes: self.attributes,
            genericParameters: self.genericParameters,
            isNSObjectProtocol: self.isNSObjectProtocol
        )
    }

    public func replace(isNSObjectProtocol: Bool) -> ProtocolDeclaration {
        ProtocolDeclaration(
            name: self.name,
            parent: self.parent,
            accessibility: self.accessibility,
            range: self.range,
            nameRange: self.nameRange,
            bodyRange: self.bodyRange,
            initializers: self.initializers,
            children: self.children,
            inheritedTypes: self.inheritedTypes,
            attributes: self.attributes,
            genericParameters: self.genericParameters,
            isNSObjectProtocol: isNSObjectProtocol
        )
    }

    public func isEqual(to other: Token) -> Bool {
        guard let other = other as? ProtocolDeclaration else { return false }
        return self.name == other.name
    }
}
