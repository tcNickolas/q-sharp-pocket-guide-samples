namespace ExpressionsExamples {
    /// # Summary
    /// The collection of examples of array expressions.
    @EntryPoint()
    operation ArrayExamples() : Unit {
        Message("============================== Q# expressions: array ==============================");

        // Example 1: creating arrays using a variety of array literals.
        Message("\nExample 1: Array literals.");
        // let initiallyEmptyArray = [];
        let oneArray = [1, size = 3];
        let arr = [1, 2, 3, 4];
        Message($"Array {arr}");

        // Example 2: array item access operator allows to access an array element by its index.
        Message("\nExample 2: Array item access.");
        Message($"First element = {arr[0]}, last element = {arr[Length(arr) - 1]}");

        // Example 3: the same operator is used for array slicing, producing subarrays of the array.
        Message("\nExample 3: Array slicing.");
        Message($"First half of the array = {arr[0 .. Length(arr) / 2 - 1]}");
        Message($"Elements at even (0-based) indexes = {arr[0 .. 2 .. Length(arr) - 1]}");
        Message($"Reversed array = {arr[Length(arr) - 1 .. -1 .. 0]}");

        // Example 4: contextual range operator allows to omit range start or end when used in array slicing.
        Message("\nExample 4: Contextual range operator in array slicing.");
        Message($"First half of the array = {arr[... Length(arr) / 2 - 1]}");
        Message($"Elements at even (0-based) indexes = {arr[0 .. 2 ...]}");
        Message($"Reversed array = {arr[... -1 ...]}");

        // Example 5: copy-and-update expression creates a copy of the array with some elements replaced.
        Message("\nExample 5: Copy-and-update expression.");
        Message($"Update the first element = {arr w/ 0 <- -1}");
        Message($"Update all even elements = {arr w/ 0 .. 2 .. 3 <- [-1, -3]}");

        // Example 6: copy-and-update expression for 2D arrays.
        Message("\nExample 6: Copy-and-update expression for 2D arrays.");
        let a = [[1, 2, 3], [4, 5, 6, 7]];
        let (i, j) = (1, 2);
        let b = a w/ i <- (a[i] w/ j <- 13);
        Message($"{b}");
    }
}
