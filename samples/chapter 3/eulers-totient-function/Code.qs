namespace EulersTotientFunction {
    open Microsoft.Quantum.Intrinsic; // Message
    
    /// # Summary
    /// Calculates Euler's totient function.
    function TotientFunction(n : Int) : Int {
        // Conditional statement checks input validity.
        if n <= 0 {
            // Fail statement throws an exception.
            fail "The argument n should be positive";
        }
        // Declare mutable variable to count coprimes.
        mutable nCoprimes = 0;
        // For loop runs through numbers from 1 to n.
        for i in 1 .. n {
            // Declare mutable variables to use when 
            // computing GCD of i and n.
            mutable (x, y) = (n, i);
            // While loop runs while y is positive.
            while y > 0 {
                // Reassign both mutable variables.
                set (x, y) = (y, x % y); 
            }
            // At this point GCD(i, n) = x.
            // Conditional statement checks whether 
            // the current number is coprime with n.
            if x == 1 {
                // Evaluate-and-reassign statement.
                set nCoprimes += 1;
            }
        }
        // Return statement.
        return nCoprimes;
    }


    @EntryPoint()
    function PrintEulersTotientFunction() : Unit {
        // Declare immutable variable - the argument
        // to use when computing the function.
        let n = 4;
        // Call statement prints the function value.
        Message($"φ({n}) = {TotientFunction(n)}");
    }
}
