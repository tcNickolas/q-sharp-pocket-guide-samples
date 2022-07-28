namespace LibraryExamples {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Random;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Random library.
    operation RandomExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Random ==============================");

        // Operations of the Microsoft.Quantum.Random library implement routines for working with probability distributions.
        // Note that these operations use classical random number generation tools.

        // Example 1: Random number generation.
        Message("\nExample 1: Random number generation.");
        Message($"Random integer = {DrawRandomInt(13, 42)}");
        Message($"Random double = {DrawRandomDouble(13., 42.)}");
        Message($"Random categorical integer = {DrawCategorical([0.1, 0.0, 0.3, 0.0, 0.6])}");

        // Example 2: Random Boolean generation.
        Message("\nExample 2: Random Boolean generation.");
        Message($"Random boolean = {DrawRandomBool(0.8)}");
    }
}
