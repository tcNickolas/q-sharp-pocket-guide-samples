namespace StatementsExamples {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;


    /// # Summary
    /// The collection of loop examples.
    operation ForWhileLoopsExamples() : Unit {
        Message("============================== Q# statements: for and while loops ==============================");

        let n = 3;
        // Example 1: use a for loop to iterate over a range of integers.
        // Calculate n!.
        Message("\nExample 1: Use a for loop to calculate the factorial of a number.");
        mutable fact = 1;
        for i in 2 .. n {
            set fact *= i;
        }
        Message($"{n}! = {fact}");

        // Example 2: use a for loop to iterate over a range of integers.
        // with the loop variable omitted.
        // Calculate 2^n.
        Message("\nExample 2: Use a for loop to calculate the given power of 2.");
        mutable power = 1;
        for _ in 1 .. n {
            set power *= 2;
        }
        Message($"2^{n} = {power}");

        // Example 3: use a for loop to iterate over the elements of an array.
        // Apply a Hadamard gate to each qubit.
        Message("\nExample 3: Use a for loop to apply a Hadamard gate to each qubit of the array.");
        use qs = Qubit[2] {
            for q in qs {
                H(q);
            }
            // Print the state of the system after the gates application.
            DumpMachine();
            ResetAll(qs);
        }

        // Example 4: use a for loop to iterate over an array of tuples, 
        // using tuple deconstruction to access items of the current tuple.
        // Apply variable gates to each qubit.
        Message("\nExample 4: Use a for loop to apply a rotation gate with different parameter to each qubit of the array.");
        use qs = Qubit[3] {
            let gates = [Rx, Ry, Rz];
            let angles = [1., 2., 3.];
            let array = Zipped3(gates, angles, qs);
            for (gate, angle, qubit) in array {
                H(qubit);
                gate(angle, qubit);
            }
            // Print the state of the system after the gates application.
            DumpMachine();
            ResetAll(qs);
        }

        // Example 5: use a for loop to iterate over an array of tuples, 
        // using tuple deconstruction to access items of the current tuple.
        // Apply variable gates to each qubit using two loops.
        Message("\nExample 5: Use a for loop to apply a rotation gate with different parameter to each qubit of the array.");
        use qs = Qubit[3] {
            let gates = [Rx, Ry, Rz];
            let angles = [1., 2., 3.];
            let array = Zipped3(gates, angles, qs);
            for (_, _, qubit) in array {
                H(qubit);
            }
            for (gate, angle, qubit) in array {
                gate(angle, qubit);
            }
            // Print the state of the system after the gates application.
            DumpMachine();
            ResetAll(qs);
        }

        // Example 6: use a while loop to iterate as long as a certain condition is met.
        // Find the index of the first negative element in an array.
        // While loops can only be used in functions, so the code is moved out of the operation.
        Message("\nExample 6: Use a while loop to find the first negative element in the array.");
        let a = [2, 3, -1, 0, -4, 5];
        Message($"First negative element in the array {a} is at index {FirstNegativeElementIndex(a)}");
    }


    /// # Summary
    /// A function that finds the index of the first negative element in the array.
    /// Returns -1 if all array elements are non-negative.
    function FirstNegativeElementIndex(a : Int[]) : Int {
        mutable ind = 0;
        while ind < Length(a) and a[ind] >= 0 {
            set ind += 1;
        }
        return ind == Length(a) ? -1 | ind;
    }
}
