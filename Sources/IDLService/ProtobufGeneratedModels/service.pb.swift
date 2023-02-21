// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: chesscom/themes/v1alpha/service.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public enum Chesscom_Themes_V1alpha_TargetPlatform: SwiftProtobuf.Enum {
  public typealias RawValue = Int
  case unspecified // = 0
  case web // = 1
  case android // = 2
  case iphone // = 3
  case ipad // = 4
  case UNRECOGNIZED(Int)

  public init() {
    self = .unspecified
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .web
    case 2: self = .android
    case 3: self = .iphone
    case 4: self = .ipad
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .web: return 1
    case .android: return 2
    case .iphone: return 3
    case .ipad: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Chesscom_Themes_V1alpha_TargetPlatform: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Chesscom_Themes_V1alpha_TargetPlatform] = [
    .unspecified,
    .web,
    .android,
    .iphone,
    .ipad,
  ]
}

#endif  // swift(>=4.2)

public struct Chesscom_Themes_V1alpha_ListThemesRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var platform: Chesscom_Themes_V1alpha_TargetPlatform = .unspecified

  public var backgroundResolution: String {
    get {return _backgroundResolution ?? String()}
    set {_backgroundResolution = newValue}
  }
  /// Returns true if `backgroundResolution` has been explicitly set.
  public var hasBackgroundResolution: Bool {return self._backgroundResolution != nil}
  /// Clears the value of `backgroundResolution`. Subsequent reads from it will return its default value.
  public mutating func clearBackgroundResolution() {self._backgroundResolution = nil}

  public var boardSize: Int32 {
    get {return _boardSize ?? 0}
    set {_boardSize = newValue}
  }
  /// Returns true if `boardSize` has been explicitly set.
  public var hasBoardSize: Bool {return self._boardSize != nil}
  /// Clears the value of `boardSize`. Subsequent reads from it will return its default value.
  public mutating func clearBoardSize() {self._boardSize = nil}

  public var piecesSize: Int32 {
    get {return _piecesSize ?? 0}
    set {_piecesSize = newValue}
  }
  /// Returns true if `piecesSize` has been explicitly set.
  public var hasPiecesSize: Bool {return self._piecesSize != nil}
  /// Clears the value of `piecesSize`. Subsequent reads from it will return its default value.
  public mutating func clearPiecesSize() {self._piecesSize = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _backgroundResolution: String? = nil
  fileprivate var _boardSize: Int32? = nil
  fileprivate var _piecesSize: Int32? = nil
}

public struct Chesscom_Themes_V1alpha_ListThemesResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var themes: [Chesscom_Themes_V1alpha_Theme] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Chesscom_Themes_V1alpha_ListBackgroundsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var platform: Chesscom_Themes_V1alpha_TargetPlatform = .unspecified

  public var backgroundResolution: String {
    get {return _backgroundResolution ?? String()}
    set {_backgroundResolution = newValue}
  }
  /// Returns true if `backgroundResolution` has been explicitly set.
  public var hasBackgroundResolution: Bool {return self._backgroundResolution != nil}
  /// Clears the value of `backgroundResolution`. Subsequent reads from it will return its default value.
  public mutating func clearBackgroundResolution() {self._backgroundResolution = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _backgroundResolution: String? = nil
}

public struct Chesscom_Themes_V1alpha_ListBackgroundsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var backgrounds: [Chesscom_Themes_V1alpha_Background] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Chesscom_Themes_V1alpha_ListBoardStylesRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var platform: Chesscom_Themes_V1alpha_TargetPlatform = .unspecified

  public var boardSize: Int32 {
    get {return _boardSize ?? 0}
    set {_boardSize = newValue}
  }
  /// Returns true if `boardSize` has been explicitly set.
  public var hasBoardSize: Bool {return self._boardSize != nil}
  /// Clears the value of `boardSize`. Subsequent reads from it will return its default value.
  public mutating func clearBoardSize() {self._boardSize = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _boardSize: Int32? = nil
}

public struct Chesscom_Themes_V1alpha_ListBoardStylesResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var boardStyles: [Chesscom_Themes_V1alpha_BoardStyle] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Chesscom_Themes_V1alpha_ListPieceSetsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var platform: Chesscom_Themes_V1alpha_TargetPlatform = .unspecified

  public var piecesSize: Int32 {
    get {return _piecesSize ?? 0}
    set {_piecesSize = newValue}
  }
  /// Returns true if `piecesSize` has been explicitly set.
  public var hasPiecesSize: Bool {return self._piecesSize != nil}
  /// Clears the value of `piecesSize`. Subsequent reads from it will return its default value.
  public mutating func clearPiecesSize() {self._piecesSize = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _piecesSize: Int32? = nil
}

public struct Chesscom_Themes_V1alpha_ListPieceSetsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var pieceSets: [Chesscom_Themes_V1alpha_PieceSet] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Chesscom_Themes_V1alpha_ListSoundSetsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var platform: Chesscom_Themes_V1alpha_TargetPlatform = .unspecified

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Chesscom_Themes_V1alpha_ListSoundSetsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var soundSets: [Chesscom_Themes_V1alpha_SoundSet] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Chesscom_Themes_V1alpha_GetActiveThemeRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var platform: Chesscom_Themes_V1alpha_TargetPlatform = .unspecified

  public var backgroundResolution: String {
    get {return _backgroundResolution ?? String()}
    set {_backgroundResolution = newValue}
  }
  /// Returns true if `backgroundResolution` has been explicitly set.
  public var hasBackgroundResolution: Bool {return self._backgroundResolution != nil}
  /// Clears the value of `backgroundResolution`. Subsequent reads from it will return its default value.
  public mutating func clearBackgroundResolution() {self._backgroundResolution = nil}

  public var boardSize: Int32 {
    get {return _boardSize ?? 0}
    set {_boardSize = newValue}
  }
  /// Returns true if `boardSize` has been explicitly set.
  public var hasBoardSize: Bool {return self._boardSize != nil}
  /// Clears the value of `boardSize`. Subsequent reads from it will return its default value.
  public mutating func clearBoardSize() {self._boardSize = nil}

  public var piecesSize: Int32 {
    get {return _piecesSize ?? 0}
    set {_piecesSize = newValue}
  }
  /// Returns true if `piecesSize` has been explicitly set.
  public var hasPiecesSize: Bool {return self._piecesSize != nil}
  /// Clears the value of `piecesSize`. Subsequent reads from it will return its default value.
  public mutating func clearPiecesSize() {self._piecesSize = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _backgroundResolution: String? = nil
  fileprivate var _boardSize: Int32? = nil
  fileprivate var _piecesSize: Int32? = nil
}

public struct Chesscom_Themes_V1alpha_GetActiveThemeResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var theme: Chesscom_Themes_V1alpha_Theme {
    get {return _theme ?? Chesscom_Themes_V1alpha_Theme()}
    set {_theme = newValue}
  }
  /// Returns true if `theme` has been explicitly set.
  public var hasTheme: Bool {return self._theme != nil}
  /// Clears the value of `theme`. Subsequent reads from it will return its default value.
  public mutating func clearTheme() {self._theme = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _theme: Chesscom_Themes_V1alpha_Theme? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Chesscom_Themes_V1alpha_TargetPlatform: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_ListThemesRequest: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_ListThemesResponse: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_ListBackgroundsRequest: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_ListBackgroundsResponse: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_ListBoardStylesRequest: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_ListBoardStylesResponse: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_ListPieceSetsRequest: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_ListPieceSetsResponse: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_ListSoundSetsRequest: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_ListSoundSetsResponse: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_GetActiveThemeRequest: @unchecked Sendable {}
extension Chesscom_Themes_V1alpha_GetActiveThemeResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "chesscom.themes.v1alpha"

extension Chesscom_Themes_V1alpha_TargetPlatform: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "TARGET_PLATFORM_UNSPECIFIED"),
    1: .same(proto: "WEB"),
    2: .same(proto: "ANDROID"),
    3: .same(proto: "IPHONE"),
    4: .same(proto: "IPAD"),
  ]
}

extension Chesscom_Themes_V1alpha_ListThemesRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListThemesRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "platform"),
    2: .standard(proto: "background_resolution"),
    3: .standard(proto: "board_size"),
    4: .standard(proto: "pieces_size"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.platform) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self._backgroundResolution) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self._boardSize) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self._piecesSize) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.platform != .unspecified {
      try visitor.visitSingularEnumField(value: self.platform, fieldNumber: 1)
    }
    try { if let v = self._backgroundResolution {
      try visitor.visitSingularStringField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._boardSize {
      try visitor.visitSingularInt32Field(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._piecesSize {
      try visitor.visitSingularInt32Field(value: v, fieldNumber: 4)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_ListThemesRequest, rhs: Chesscom_Themes_V1alpha_ListThemesRequest) -> Bool {
    if lhs.platform != rhs.platform {return false}
    if lhs._backgroundResolution != rhs._backgroundResolution {return false}
    if lhs._boardSize != rhs._boardSize {return false}
    if lhs._piecesSize != rhs._piecesSize {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chesscom_Themes_V1alpha_ListThemesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListThemesResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "themes"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.themes) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.themes.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.themes, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_ListThemesResponse, rhs: Chesscom_Themes_V1alpha_ListThemesResponse) -> Bool {
    if lhs.themes != rhs.themes {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chesscom_Themes_V1alpha_ListBackgroundsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListBackgroundsRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "platform"),
    2: .standard(proto: "background_resolution"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.platform) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self._backgroundResolution) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.platform != .unspecified {
      try visitor.visitSingularEnumField(value: self.platform, fieldNumber: 1)
    }
    try { if let v = self._backgroundResolution {
      try visitor.visitSingularStringField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_ListBackgroundsRequest, rhs: Chesscom_Themes_V1alpha_ListBackgroundsRequest) -> Bool {
    if lhs.platform != rhs.platform {return false}
    if lhs._backgroundResolution != rhs._backgroundResolution {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chesscom_Themes_V1alpha_ListBackgroundsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListBackgroundsResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "backgrounds"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.backgrounds) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.backgrounds.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.backgrounds, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_ListBackgroundsResponse, rhs: Chesscom_Themes_V1alpha_ListBackgroundsResponse) -> Bool {
    if lhs.backgrounds != rhs.backgrounds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chesscom_Themes_V1alpha_ListBoardStylesRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListBoardStylesRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "platform"),
    3: .standard(proto: "board_size"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.platform) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self._boardSize) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.platform != .unspecified {
      try visitor.visitSingularEnumField(value: self.platform, fieldNumber: 1)
    }
    try { if let v = self._boardSize {
      try visitor.visitSingularInt32Field(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_ListBoardStylesRequest, rhs: Chesscom_Themes_V1alpha_ListBoardStylesRequest) -> Bool {
    if lhs.platform != rhs.platform {return false}
    if lhs._boardSize != rhs._boardSize {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chesscom_Themes_V1alpha_ListBoardStylesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListBoardStylesResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "board_styles"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.boardStyles) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.boardStyles.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.boardStyles, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_ListBoardStylesResponse, rhs: Chesscom_Themes_V1alpha_ListBoardStylesResponse) -> Bool {
    if lhs.boardStyles != rhs.boardStyles {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chesscom_Themes_V1alpha_ListPieceSetsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListPieceSetsRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "platform"),
    4: .standard(proto: "pieces_size"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.platform) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self._piecesSize) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.platform != .unspecified {
      try visitor.visitSingularEnumField(value: self.platform, fieldNumber: 1)
    }
    try { if let v = self._piecesSize {
      try visitor.visitSingularInt32Field(value: v, fieldNumber: 4)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_ListPieceSetsRequest, rhs: Chesscom_Themes_V1alpha_ListPieceSetsRequest) -> Bool {
    if lhs.platform != rhs.platform {return false}
    if lhs._piecesSize != rhs._piecesSize {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chesscom_Themes_V1alpha_ListPieceSetsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListPieceSetsResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "piece_sets"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.pieceSets) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.pieceSets.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.pieceSets, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_ListPieceSetsResponse, rhs: Chesscom_Themes_V1alpha_ListPieceSetsResponse) -> Bool {
    if lhs.pieceSets != rhs.pieceSets {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chesscom_Themes_V1alpha_ListSoundSetsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListSoundSetsRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "platform"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.platform) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.platform != .unspecified {
      try visitor.visitSingularEnumField(value: self.platform, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_ListSoundSetsRequest, rhs: Chesscom_Themes_V1alpha_ListSoundSetsRequest) -> Bool {
    if lhs.platform != rhs.platform {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chesscom_Themes_V1alpha_ListSoundSetsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListSoundSetsResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "sound_sets"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.soundSets) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.soundSets.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.soundSets, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_ListSoundSetsResponse, rhs: Chesscom_Themes_V1alpha_ListSoundSetsResponse) -> Bool {
    if lhs.soundSets != rhs.soundSets {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chesscom_Themes_V1alpha_GetActiveThemeRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GetActiveThemeRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "platform"),
    2: .standard(proto: "background_resolution"),
    3: .standard(proto: "board_size"),
    4: .standard(proto: "pieces_size"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.platform) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self._backgroundResolution) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self._boardSize) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self._piecesSize) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.platform != .unspecified {
      try visitor.visitSingularEnumField(value: self.platform, fieldNumber: 1)
    }
    try { if let v = self._backgroundResolution {
      try visitor.visitSingularStringField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._boardSize {
      try visitor.visitSingularInt32Field(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._piecesSize {
      try visitor.visitSingularInt32Field(value: v, fieldNumber: 4)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_GetActiveThemeRequest, rhs: Chesscom_Themes_V1alpha_GetActiveThemeRequest) -> Bool {
    if lhs.platform != rhs.platform {return false}
    if lhs._backgroundResolution != rhs._backgroundResolution {return false}
    if lhs._boardSize != rhs._boardSize {return false}
    if lhs._piecesSize != rhs._piecesSize {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Chesscom_Themes_V1alpha_GetActiveThemeResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GetActiveThemeResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "theme"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._theme) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._theme {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Chesscom_Themes_V1alpha_GetActiveThemeResponse, rhs: Chesscom_Themes_V1alpha_GetActiveThemeResponse) -> Bool {
    if lhs._theme != rhs._theme {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}