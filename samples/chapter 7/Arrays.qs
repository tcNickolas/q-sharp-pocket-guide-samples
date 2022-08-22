namespace LibraryExamples {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Arrays;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Arrays library.
    operation ArraysExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Arrays ==============================");

        // Functions of the Microsoft.Quantum.Arrays library implement array manipulation routines.

        // Example 1: Array comparison.
        let a1 = [1, 2, 3, 4, 5];
        let a2 = [-1, -2, -3, -4];
        Message("\nExample 1: Array comparison.");
        Message($"{a1} is {EqualA((x, y) -> x == y, a1, a1) ? "equal" | "not equal"} to {a1}");
        Message($"{a1} is {EqualA((x, y) -> x == y, a1, a2) ? "equal" | "not equal"} to {a2}");

        // Example 2: Array elements access.
        Message("\nExample 2: Array elements access.");
        Message($"The first element of the array = {Head(a1)} = {a1[0]}");
        Message($"The last element of the array = {Tail(a1)} = {a1[Length(a1) - 1]}");
        Message($"The middle element of the array = {ElementAt(Length(a1) / 2, a1)} = {a1[Length(a1) / 2]}");

        // Example 3: Array reshaping functions.
        Message("\nExample 3: Array reshaping functions.");
        Message($"All elements of the array except the first one = {Rest(a1)} = {a1[1 ...]}");
        Message($"All elements of the array except the last one = {Most(a1)} = {a1[... Length(a1) - 2]}");
        Message($"All elements of the array with even indices = {Subarray([0, 2, 4], a1)} = {a1[... 2 ...]}");
        Message($"All elements of the array except those with even indices = {Excluding([0, 2, 4], a1)}");
        Message($"Reversed array = {Reversed(a1)} = {a1[... -1 ...]}");
        Message($"Sorted array with all even elements going before all odd elements = {Sorted((x, y) -> x % 2 <= y % 2 and x <= y, a1)}");
        Message($"Flattened array = {Flattened([[1, 2, 3], [4, 5]])}");
        Message($"Array in chunks of size 2 = {Chunks(2, a1)}");
        Message($"Array in partitions of varying size = {Partitioned([2, 1], a1)}");
        Message($"Array windows of size 2 = {Windows(2, a1)}");

        // Example 4: Search and condition checks functions.
        Message("\nExample 4: Search and condition checks functions.");
        Message($"Is any of the array elements divisible by 3? {Any(x -> x % 3 == 0, a1)}");
        Message($"Are all array elements even? {All(x -> x % 2 == 0, a1)}");
        Message($"The first array element divisible by 3 = {a1[IndexOf(x -> x % 3 == 0, a1)]}");
        Message($"Even array elements are at indices {Where(x -> x % 2 == 0, a1)}");
        Message($"Even array elements are {Filtered(x -> x % 2 == 0, a1)}");
        Message($"The array has {Count(x -> x % 2 == 0, a1)} even elements");

        // Example 5: Combining arrays.
        Message("\nExample 5: Combining arrays.");
        Message($"Zipping arrays: {Zipped(a1, a2 + [-5])}");
        Message($"Interleaving arrays: {Interleaved(a1, a2)}");

        // Example 6: Array transformations.
        Message("\nExample 6: Array transformations.");
        Message($"Array of squares: {Mapped(x -> x^2, a1)}");
        Message($"Array elements with indices: {Enumerated(a1)}");
        Message($"Sum of array elements: {Fold((x, y) -> x + y, 0, a1)}");
    }
}
