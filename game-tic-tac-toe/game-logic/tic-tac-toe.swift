import UIKit

enum State : String {
    case o
    case x
    case empty
}

class Field: Identifiable {
    static func == (lhs: Field, rhs: Field) -> Bool {
        return lhs.id == rhs.id
    }
    
    var state: State = .empty
    var id: Int
    
    init(_ id: Int) {
        self.id = id
    }
    
    func own(_ state: State) {
        if (state == .empty) {
            fatalError("Unable to own field by empty")
        }
        
        self.state = state
    }
}

extension Field: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
}


class Game: NSObject {
    var fields: [[Field]] = [[Field(0), Field(1), Field(2)],
                             [Field(3), Field(4), Field(5)],
                             [Field(6), Field(7), Field(8)]]
    
    
    func gameEnded() -> Bool {
        return hasWon(player: .o) || hasWon(player: .x)
    }
    
    func play(player: State, row: Int, column: Int) {
        fields[row][column].own(player)
    }
    
    func hasWon(player state: State) -> Bool {
        for row in fields {
            var rowWinner = true
            for f in row {
                rowWinner = rowWinner && f.state == state
            }
            
            if rowWinner {
                return rowWinner
            }
        }
        
        return false
    }
    
    public override var description: String {
        var result = "Game ["
        fields.forEach { (row: [Field]) in
            result += "\n\t"
            row.forEach { (f: Field) in
                result += f.state.rawValue + "|"
            }
        }
        
        result += "\n]"
        
        return result
    }
}
