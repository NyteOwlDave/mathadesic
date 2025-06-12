
function lambertW(z, tolerance = 1e-6, maxIterations = 100) {
    if (z < 0) throw new Error("Lambert W not implemented for negative z in this version");
    if (z === 0) return 0;

    // Initial guess: for z > 0, log(z) or a refined approximation
    let w = z < 10 ? Math.log(z) : Math.log(z) - Math.log(Math.log(z));

    // Newton's method
    for (let i = 0; i < maxIterations; i++) {
        let ew = Math.exp(w);
        let wew = w * ew;
        let delta = (wew - z) / (ew * (w + 1)); // Newton's update
        w -= delta;
        if (Math.abs(delta) < tolerance) break;
    }

    return w;
}

// Example usage for x^x = 25
function solveXXEqualsC( c = 25 ) {
    let lnC = Math.log(c); // ln(25) ≈ 3.2189
    let w = lambertW(lnC); // W(ln(25))
    let x = Math.exp(w); // x = e^W(ln(c))
    console.log(x);     // ~2.236
    // alert(x);
    return x;
}

// solveXXEqualsC();

