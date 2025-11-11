package permit.custom

import rego.v1

import data.permit.policies

default allow := false

# You can find the official Rego tutorial at:
# https://www.openpolicyagent.org/docs/latest/policy-language/
# Example rule - you can replace this with something of your own
# allow {
# 	input.user.key == "test@permit.io"
# }
# Also, you can add more allow blocks here to get an OR effect
allow if {
	# i.e if you add my_custom_rule here - the policy will allow
	# if my_custom_rule is true, EVEN IF policies.allow is false.
	not input.resource.type == "market_order"
} else if {
	input.resource.type == "market_order"
    is_trade_user
}

# trade_access is true if...
is_trade_user if {
	# for some `i`...
	some i

	# "Trade" is the `i`-th element in the user->role mappings for the identified user.
	#data.users[input.user.key].roles[i] == "Trade"
    input.user.attributes.roles[i] == "Trade"
}