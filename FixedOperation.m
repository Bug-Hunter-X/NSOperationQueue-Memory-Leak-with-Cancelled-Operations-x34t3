To fix this, we can make the strong reference to the large object a weak reference inside the NSOperation.  This way, when the object has no strong references left, it can be deallocated even if the operation is still in the queue. 

Here's an example:

```objectivec
// BuggyOperation.m (Problematic Code)
@interface MyOperation : NSOperation
@property (strong, nonatomic) UIImage *largeImage;
// ...
@end

// FixedOperation.m (Corrected Code)
@interface MyOperation : NSOperation
@property (weak, nonatomic) UIImage *largeImage;
// ...
@end
```

Alternatively, implement proper cleanup in the `main` method or ensure your `NSOperation` subclass properly deallocates and handles cancellations efficiently.