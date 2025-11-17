package permit.custom

import rego.v1

import data.permit.policies
import data.permit.rbac
import data.permit.abac
import data.permit.rebac
import data.permit.user_permissions


default allow := false

allow if {
	not input.resource.type == "market_order"
} else if {
	input.resource.type == "market_order"
	"abac" in policies.__allow_sources
	abac.allowing_rules.resourceset == "resourceset_Company_5fdistributed_5fMO"
	not relationships[concat("", ["market_order:", input.resource.id])].viewer == [concat("", ["user:", input.user])]
} else if {
	input.resource.type == "market_order"
	not "abac" in policies.__allow_sources
	not abac.allowing_rules.resourceset == "resourceset_Company_5fdistributed_5fMO"
}

# is_trade_user is true if....
is_trade_user if {
	"Trade" in rbac.allowing_roles
}