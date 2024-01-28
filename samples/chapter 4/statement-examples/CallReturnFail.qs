namespace StatementsExamples {
    /// # Summary
    /// The collection of examples for call statements, return and fail.
    @EntryPoint()
    operation CallReturnFailExamples() : Unit {
        Message("============================== Q# statements: call statements, return and fail ==============================");

        // Use a call statement to invoke a callable that returns Unit type.
        use q = Qubit();
        // Calling an operation.
        PrepareBasisState(q, Zero);
        // Calling a function.
        Message("\nExample: Use a call statement to invoke a callable Message with Unit return type.");

        // Calling a callable that returns a non-Unit type is a call expression.
        Message($"{Factorial(3)}");
    }


    /// # Summary
    /// Prepares the qubit in the basis state given
    /// by the measurement result in computational
    /// basis. The qubit starts in the |0⟩ state.
    operation PrepareBasisState(
        q : Qubit,
        state : Result
    ) : Unit {
        // Every execution path of the callable must end in a return statement.
        if state == Zero {
            // The qubit is already in the Zero state.
            return ();
        }
        X(q);
        // The last return statement of a callable with Unit return type can be omitted.
    }

    /// # Summary
    /// Calculates factorial of the given integer.
    function Factorial(n : Int) : Int {
        if n <= 0 {
            fail "The argument n should be positive";
        }
        if n == 1 {
            return 1;
        }
        return n * Factorial(n - 1);
    }
}
