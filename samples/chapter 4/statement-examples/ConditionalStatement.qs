namespace StatementsExamples {
    /// # Summary
    /// The collection of conditional statement examples.
    @EntryPoint()
    operation ConditionalStatementExamples() : Unit {
        Message("============================== Q# statements: conditional statement ==============================");

        let n = 3;
        // Example 1: fail if a condition is not satisfied.
        Message("\nExample 1: Fail if a condition is not satisfied.");
        if n <= 0 {
            fail "The argument n should be positive";
        }
        Message($"The argument {n} is positive");

        // Example 2: use an if-else statement to choose one of two statement blocks to execute.
        Message("\nExample 2: Use an if-else statement to choose one of two statement blocks to execute.");
        if n % 2 == 0 {
            Message($"The number {n} is even");
        }
        else {
            Message($"The number {n} is odd");
        }

        // Example 3: use an if-elif-else statement in the FooBar task: 
        // given an integer number, print "Foo" if it is divisible by 3, 
        // "Bar" if it is divisible by 5, "Foobar" if it is divisible by both, 
        // and the number itself if it is divisible by neither 3 nor 5.
        Message("\nExample 3: use an if-elif-else statement in the FooBar task.");
        for i in 1 .. 15 {
            if i % 15 == 0 {
                Message("Foobar");
            }
            elif i % 3 == 0 {
                Message("Foo");
            }
            elif i % 5 == 0 {
                Message("Bar");
            }
            else {
                Message($"{i}");
            }
        }
    }
}
