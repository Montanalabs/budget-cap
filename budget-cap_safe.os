#! Injection-safe batch processor under a cost `budget`. Each refund costs 30; the program
#! budget of 100 bounds total spend, so this fixed plan of three refunds (90) is within cap.
#! A runaway sequence that would over-spend is rejected at compile time (see the unsafe pair).
#! @requires refund — the costly action (cost 30)
#! @effect io
grant refund cost 30
budget 100

type Decision = Small | Large | Deny

let a = fetch<web>
quarantined { let d1 = extract<Decision>(a) }
privileged { refund(d1) }
let b = fetch<web>
quarantined { let d2 = extract<Decision>(b) }
privileged { refund(d2) }
let c = fetch<web>
quarantined { let d3 = extract<Decision>(c) }
privileged { refund(d3) }
