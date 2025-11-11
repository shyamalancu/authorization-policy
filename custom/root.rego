package permit.custom

import rego.v1

import data.permit.policies
import data.permit.rbac

default allow := false

allow if {
	not input.resource.type == "market_order"
} else if {
	input.resource.type == "market_order"
    is_trade_user
}

# is_trade_user is true if....
is_trade_user if {
	# "Trade" in rbac.allowing_roles
    input.user.key == "anton@clarksons.com"
}