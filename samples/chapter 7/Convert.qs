namespace LibraryExamples {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Convert library.
    @EntryPoint()
    operation ConvertExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Convert ==============================");

        // Functions of the Microsoft.Quantum.Convert library is used to perform conversions between data types.

        // Example 1: Converting between two primitive types.
        Message("\nExample 1: Converting between two primitive types.");
        Message($"Performing arithmetic on numbers of different types: {5L + IntAsBigInt(8)}, {IntAsDouble(3) + 3.14}");
        
        // Example 2: Converting between primitive types and arrays of other types.
        Message("\nExample 2: Converting between primitive types and arrays of other types.");
        Message($"Int and Bool[] (little endian bit representation): {BoolArrayAsInt([true, false, true, true])} = {IntAsBoolArray(13, 5)}");

        // Example 3: Interpreting measurement results.
        Message("\nExample 3: Interpreting measurement results.");
        let m = Zero;
        Message($"Result -> Bool: {m} -> {ResultAsBool(m)}");
        let ms = [One, Zero, One, One];
        Message($"Result[] -> Int (little endian bit representation): {ms} -> {ResultArrayAsInt(ms)}");
    }
}
