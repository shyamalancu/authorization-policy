package permit.custom

import rego.v1

import data.permit.policies
import data.permit.rbac
import data.permit.abac
import data.permit.rebac

default allow := true
default deny := false

deny if {
	resource_key := sprintf("%s:%s", [input.resource.type, input.resource.key])
	user_key := sprintf("user:%s", [input.user.key])

	# print("Resource : ", resource_key, ", User : ", user_key, ", Action : ", input.action)
	input.resource.type == "market_order"

	# print("Allowed policy sources: ", policies.__allow_sources)
	count(policies.__allow_sources) == 1
	"abac" in policies.__allow_sources

	# print(abac.allowing_rules)
	abac.allowing_rules[_].resourceset == "resourceset_Company_5fdistributed_5fMO"
	"viewer" in data.role_assignments[user_key][resource_key]
}