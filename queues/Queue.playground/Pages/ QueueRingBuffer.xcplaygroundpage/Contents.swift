public struct QueueRingBuffer<T>: Queue {
    
    private var ringBuffer: RingBuffer<T>
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        return ringBuffer.isEmpty
    }
    
    public var peek: T? {
        return ringBuffer.first
    }
    
    public mutating func enqueue(_ element: Element) -> Bool {
        return ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        return ringBuffer.isEmpty ? nil : ringBuffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        return ringBuffer.description
    }
}

var queue = QueueRingBuffer<String>(count: 10)
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
