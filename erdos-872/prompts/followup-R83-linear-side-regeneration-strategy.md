This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

Your static sublinear-completion theorem, smooth/rough trapping sweep, and cross-carrier regeneration construction are accepted as sound pending final verification.

## New rigorous context (not in this thread)

Independent work on the same game, with complete elementary proofs, established the following; take them as given.

1. After any prefix of size \(k\), all but \(2kz^2+C\,2^r\big(n/\sqrt{\log z}+(3/2)^{\pi(z)}\big)\) live upper-half targets have at least \(r\) legal prime-removal divisors \(u/p\), \(p\le z\). Hence for \(k=o(n)\), almost every live upper target has an unboundedly growing number of legal codimension-one divisors.
2. Consequently the fractional packing value \(\nu(A)\) (maximize total mass on live upper targets so that every legal lower move sees mass at most one) satisfies \(\nu(A)=o(n)\) uniformly over all positions with \(|A|=o(n)\); there is even a static legal antichain of \(o(n)\) lower moves whose shadows cover all but \(o(n)\) of the live upper half. Any route to \(L(n)=\Theta(n)\) by forcing \(\nu(A)\ge cn\) at sublinear time is closed: \(T+\nu(A)=o(n)\) whenever \(T=o(n)\).
3. Pointwise interdiction is free: at any sublinear prefix with a linear live reservoir, some legal lower move kills at least \((2\eta-o(1))r(n)\) live targets, \(r(n)\to\infty\). What is missing for \(L(n)=o(n)\) is only amortization — organizing the divisor stars into \(O(|A|+o(n))\) online certificates of bounded multiplicity. Quantitatively, \(r(n)=O(\log\log H)\) fresh kills per turn at horizon \(|A|\asymp n/H\) totals \(o(n)\) and does not self-bootstrap.

## Request

Attack the linear side. Provide an unconditional proof of \(L(n)=\Theta(n)\) by converting cross-product regeneration into a Prolonger strategy — one sustaining a linear count of actual moves against arbitrary play while controlling all mixed proper divisors, not merely maintaining a linear live reservoir — or prove this is impossible by strengthening the interdiction facts above into a full \(L(n)=o(n)\) theorem. Full freedom of route; you may also abandon both framings. If neither side is closed, state precisely the single sub-step that cannot be closed; a clean concession of a specific gap is more useful than a patched argument with a structural weakness.

REMEMBER - this argument may require non-trivial, creative and novel elements.
