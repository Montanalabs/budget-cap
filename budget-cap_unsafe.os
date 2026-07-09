#! VULNERABLE — the same three refunds (cost 30 each = 90) under a budget of only 80.
#! The total exceeds the budget, so the checker rejects the over-spend: check -> UNSAFE.
grant refund cost 30
budget 80

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
