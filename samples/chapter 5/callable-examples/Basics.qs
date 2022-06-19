namespace CallableExamples {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    // Defining Q# functions.
    function Sum(a : Int, b : Int) : Int {
        return a + b;
    }

    function Product(a : Int, b : Int) : Int {
        return a * b;
    }


    // Defining Q# operations.
    operation ApplyRyArray(
        qs : Qubit[],
        angles : Double[]
    ) : Unit {
        for (q, angle) in Zipped(qs, angles) {
            Ry(angle, q);
        }
    }


    // Two ways of using tuple arguments:
    // 1. Embed tuple deconstruction in the arguments.
    function AddInputs1(
        a : Int,
        (b : Int, c : Int, d : Int),
        (e : Int, f : Int)
	) : Int {
        return a + b + c + d + e + f;
    }

    // 2. Define types of tuple arguments.
    function AddInputs2(
        a : Int,
        t1 : (Int, Int, Int),
        t2 : (Int, Int)
    ) : Int {
        // Deconstruct tuple arguments in body.
        let (b, c, d) = t1;
        let (e, f) = t2;
        return a + b + c + d + e + f;
    }


    /// # Summary
    /// The collection of examples of defining and calling operations and functions.
    operation BasicsExamples() : Unit {
        Message("============================== Q# callables: the basics ==============================");

        // Example 1: Calling an operation or a function with non-Unit return type.
        Message("\nExample 1: Calling an operation or a function with non-Unit return type.");
        let sum = Sum(5, 13);
        Message($"Sum = {sum}");
        let sumOfAll1 = AddInputs1(1, (2, 3, 4), (5, 6)); 
        let sumOfAll2 = AddInputs2(1, (2, 3, 4), (5, 6)); 
        Message($"Sum of all arguments = {sumOfAll1} = {sumOfAll2}");


        // Example 2: Calling an operation of a function with Unit return type.
        Message("\nExample 2: Calling an operation of a function with Unit return type.");
        // Allocate two qubits in the |00⟩ state.
        use qs = Qubit[2];
        ApplyRyArray(qs, [0.5 * PI(), 0.5 * PI()]);
        // Print the qubits' state to see it is
        // (|00⟩ + |01⟩ + |10⟩ + |11⟩) / 2.
        DumpMachine();
        ResetAll(qs);
    }
}
