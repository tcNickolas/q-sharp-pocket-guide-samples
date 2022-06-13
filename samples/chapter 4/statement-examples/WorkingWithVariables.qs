namespace StatementsExamples {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;

    // Define a type used in the copy-and-update expression example.
    newtype NamedPair = (Fst : Int, Snd : Bool);

    // Q# does not support global variables, so you cannot define a variable outside of a callable.

    /// # Summary
    /// The collection of loop examples.
    operation WorkingWithVariablesExamples() : Unit {
        Message("============================== Q# statements: working with variables ==============================");

        // Example 1: use let statement to define immutable variables (= constants) of different types.
        let n = 10;
        let doubleArray = [1., 2., 3.];
        let name = "Mariia";
        // You cannot define an empty array without using it later,
        // since the Q# compiler won't be able to infer its type.
        // The following line yields a compilation error:
        // let unusedEmptyArray = [];

        // Example 2: use mutable statement to define mutable variables of different types.
        mutable m = 10;
        mutable intArray = [1, 2, 3];
        mutable greeting = $"Hello, {name}!";
        mutable np = NamedPair(1, false);
        // You can define an empty array to use it later.
        mutable emptyArray = [];

        // Example 3: use set statement to update the values of mutable variables.
        set m = 13 - n;
        set emptyArray = [0] + intArray;
        set np = np w/ Snd <- true;

        // Example 4: use evaluate-and-reassign statements as a shorthand for set statements.
        // Increment a number by 32.
        set m = m + 32;
        set m += 32;
        // Multiply a number by 2 using bit shift.
        set m = m <<< 1;
        set m <<<= 1;
        // Append an element to the current array.
        set intArray = intArray + [4];
        set intArray += [4];
        // Replace the first element of an array with 5
        // using a copy-and-update expression.
        set intArray = intArray w/ 0 <- 5;
        set intArray w/= 0 <- 5;
        // Replace an element of a UDT 
        // using a copy-and-update expression.
        set np = np w/ Fst <- 3;
        set np w/= Fst <- 3;

        Message(greeting);
        Message($"m = {m}");
        Message($"intArray = {intArray}");
        Message($"np = {np}");
    }
}
