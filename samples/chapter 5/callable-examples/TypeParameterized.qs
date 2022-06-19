namespace CallableExamples {
    open Microsoft.Quantum.Intrinsic;

    /// # Summary
    /// A function that converts an argument to a string
    /// and appends a prefix to it.
    function ToStringWithPrefix<'T>(
        a : 'T,
        prefix : String
    ) : String {
        return $"{prefix} {a}";
    }


    /// # Summary
    /// A function that returns a sub-array of the elements of 
    /// the input array at even indexes.
    function EvenElements<'T>(a : 'T[]) : 'T[] {
        return a[... 2 ...];
    }


    /// # Summary
    /// A function that swaps the elements of the input tuple.
    function TSwap<'T, 'S>(
        t : 'T,
        s : 'S
    ) : ('S, 'T) {
        return (s, t);
    }


    /// # Summary
    /// A function that returns the minimum of the given inputs.
    function Min<'T>(
        a : 'T, 
        b : 'T,
        lessThan : ('T, 'T) -> Bool
    ) : 'T {
        return lessThan(a, b) ? a | b;
    }


    /// # Summary
    /// A function that converts two arguments to strings
    /// and appends a prefix to their concatenation.
    function ToStrWithPrefix2<'T>(
        a : 'T,
        b : 'T,
        prefix : String
    ) : String {
        return $"{prefix} {a} {b}";
    }


    /// # Summary
    /// The collection of examples of type-parameterized callables.
    operation TypeParameterizedExamples() : Unit {
        Message("============================== Q# callables: type-parameterized callables ==============================");

        // Example 1: Calling type-parameterized callables.
        Message("\nExample 1: Calling type-parameterized callables.");
        Message(ToStringWithPrefix("World", "Hello"));
        Message(ToStringWithPrefix<Int>(5, "N ="));

        Message($"Even elements of an Int array {EvenElements([1, 2, 3, 4])}");
        Message($"Even elements of a Bool array {EvenElements([true, true, true, false, false])}");

        Message($"Swap tuple elements {TSwap("Hello", "World")}");

        let minI = Min(1, 2, (a, b) -> a < b);
        let minD = Min(.2, .1, (a, b) -> a < b);
        Message($"minI = {minI}, minD = {minD}");

        // Example 2: Using type-parameterized callables with partial application.
        Message("\nExample 2: Using type-parameterized callables with partial application.");
        let f1 = ToStrWithPrefix2(2, _, _);
        let f2 = ToStrWithPrefix2<String>(_, _, "Hello");
        Message(f1(5, "Tuple is"));
        Message(f2("Quantum", "World"));
    }
}
