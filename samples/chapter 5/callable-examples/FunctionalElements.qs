namespace CallableExamples {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;

    /// # Summary
    /// The collection of examples of using the functional elements of Q#.
    operation FunctionalElementsExamples() : Unit {
        Message("============================== Q# callables: functional elements of Q# ==============================");

        // Example 1: Callable-typed variables.
        Message("\nExample 1: Callable-typed variables.");
        use qs = Qubit[2] {
            let statePrep = ApplyRyArray;
            let angles = [.2, .4];
            statePrep(qs, angles);
            DumpMachine();
            ResetAll(qs);
        }

        // Example 2: Using callable types in data structures.
        Message("\nExample 2: Using callable types in data structures.");
        // An array of functions that act on two integers.
        let binaryIntFunctions = [Sum, Product];
        // Evaluate each function for the given inputs.
        for op in binaryIntFunctions {
            Message($"{op(5, 13)}");
        }

        // Example 3: Using callable types in conditional expression.
        Message("\nExample 3: Using callable types in conditional expression.");
        // Choose whether to calculate sum or product.
        mutable calcSum = true;
        let (a, b) = (5, 13);
        // Choose between two integer expressions.
        Message($"{calcSum ? Sum(a, b) | Product(a, b)}");
        // Choose between two functions and evaluate the chosen function.
        set calcSum = false;
        let func = calcSum ? Sum | Product;
        Message($"{func(a, b)}");

        // Example 4: Using callables as arguments.
        Message("\nExample 4: Using callables as arguments.");
        let array = [1, 2, 3, 4];
        Message($"Array product = {Reduce(array, Product)}");
        Message($"Array sum = {Reduce(array, (x, y) -> x + y)}");

        // Example 5: Partial application.
        Message("\nExample 5: Partial application.");
        let increment = Sum(1, _);
        Message($"Increment 2 = {increment(2)}");

        // Example 6: Lambda expressions.
        Message("\nExample 6: Lambda expressions.");
        // Defining a function using a lambda expression.
        let sum = (x, y) -> x + y;
        Message($"{sum(a, b)}");
        // Defining an operation using a lambda expression.
        let applyRyArray = (qs, angles) =>
            ApplyToEachCA(Ry, Zipped(qs, angles));
        // Note that you don't need to use applyRyArray for 
        // the Q# compiler to infer the types of its parameters.
    }


    /// # Summary
    /// A function that "reduces" an array of integers by applying 
    /// the given function to the first two elements of the array, 
    /// then to the result of that and the third element, then 
    /// to the result of that and the fourth element, and so forth. 
    function Reduce(
        array : Int[],
        f : (Int, Int) -> Int
    ) : Int {
        if Length(array) == 0 {
            fail "Undefined result for empty array.";
        }
        mutable res = array[0];
        // Iterate through all array elements,
        // starting with the second one.
        for a in array[1 ...] {
            set res = f(res, a);
        }
        return res;
    }

    /// # Summary
    /// A function that increments the input 
    /// (equivalent to increment defined using partial application).
    function Increment(b : Int) : Int {
        return Sum(1, b);
    }
}
