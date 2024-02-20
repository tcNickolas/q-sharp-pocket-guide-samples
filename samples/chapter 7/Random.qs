namespace LibraryExamples {
    open Microsoft.Quantum.Random;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Random library.
    @EntryPoint()
    operation RandomExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Random ==============================");

        // Operations of the Microsoft.Quantum.Random library implement routines for working with probability distributions.
        // Note that these operations use classical random number generation tools.

        // Example 1: Random number generation.
        Message("\nExample 1: Random number generation.");
        Message($"Random integer = {DrawRandomInt(13, 42)}");
        Message($"Random double = {DrawRandomDouble(13., 42.)}");

        // Example 2: Random Boolean generation.
        Message("\nExample 2: Random Boolean generation.");
        Message($"Random boolean = {DrawRandomDouble(0., 1.) < 0.8}");
    }
}
