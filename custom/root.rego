package permit.custom

import rego.v1

import data.permit.policies
import data.permit.rbac
import data.permit.abac
import data.permit.rebac

default allow := true
default deny := false

deny if {
	input.resource.type == "market_order"
	"abac" in policies.__allow_sources
	abac.allowing_rules.resourceset == "Company_distributed_MO"
	data.relationships[concat("", ["market_order:", input.resource.id])].viewer == [concat("", ["user:", input.user])]
}

# allow if {
# 	not input.resource.type == "market_order"
# } else if {
# 	input.resource.type == "market_order"
# 	"abac" in policies.__allow_sources
# 	abac.allowing_rules.resourceset == "Company_distributed_MO"
# 	not data.relationships[concat("", ["market_order:", input.resource.id])].viewer == [concat("", ["user:", input.user])]
# } else if {
# 	input.resource.type == "market_order"
# 	not "abac" in policies.__allow_sources
# 	not abac.allowing_rules.resourceset == "Company_distributed_MO"
# }

# is_trade_user is true if....
is_trade_user if {
	"Trade" in rbac.allowing_roles
}