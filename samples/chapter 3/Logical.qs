namespace ExpressionsExamples {
    /// # Summary
    /// The collection of examples of logical expressions.
    @EntryPoint()
    operation LogicalExamples() : Unit {
        Message("============================== Q# expressions: logical expressions ==============================");

        // Logical expressions are defined for Boolean type.
        let a = false;
        let b = true;
        Message($"not A = {not a}");            // true
        Message($"A or B = {a or b}");          // true
        Message($"A and B = {a and b}");        // false
    }
}
