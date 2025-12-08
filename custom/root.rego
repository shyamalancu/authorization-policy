package permit.custom

import rego.v1

import data.permit.policies
import data.permit.rbac
import data.permit.abac
import data.permit.rebac

default allow := true
default deny := false

deny if {
	print("Resource Type: %a, Resource Id: %b", input.resource.type, input.resource.id)
	input.resource.type == "market_order"
	print(policies.__allow_sources)
	"abac" in policies.__allow_sources
	print(abac.allowing_rules)
	abac.allowing_rules[_].resourceset == "resourceset_Company_5fdistributed_5fMO"
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