namespace ExpressionsExamples {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Random;

    /// # Summary
    /// The collection of examples of conditional expressions.
    operation ConditionalExamples() : Unit {
        Message("============================== Q# expressions: conditional ==============================");

        // Conditional operator returns one of two values depending on the value of a logical condition.

        // Example 1: Generate a random Boolean value with 50% chance of being true and 50% - false
        // and define another variable based on it.
        Message("\nExample 1: Define one variable based on the value of the other.");
        let a = DrawRandomBool(0.5);
        let b = a ? 1 | DrawRandomInt(2, 4);
        Message($"a = {a}, b = {b}");

        // Example 2: Print a message based on the parity of the number.
        // Note the use of both string interpolation and string concatenation expressions.
        Message("\nExample 2: Print a message based on the parity of the number.");
        let n = DrawRandomInt(1, 10);
        Message($"The number {n} is " + (n % 2 == 0 ? "even" | "odd"));

        // Example 3: use a conditional expression in the FooBar task: 
        // given an integer number, print "Foo" if it is divisible by 3, 
        // "Bar" if it is divisible by 5, "Foobar" if it is divisible by both, 
        // and the number itself if it is divisible by neither 3 nor 5.
        Message("\nExample 3: use a conditional expression in the FooBar task.");
        for i in 1 .. 15 {
            Message(i % 15 == 0 ? "Foobar" | i % 3 == 0 ? "Foo" | i % 5 == 0 ? "Bar" | $"{i}");
        }
    }
}
