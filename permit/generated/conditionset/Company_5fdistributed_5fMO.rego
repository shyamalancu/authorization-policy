package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default resourceset_Company_5fdistributed_5fMO = false

resourceset_Company_5fdistributed_5fMO {
	attributes.user.key in attributes.resource.DistributedCompanies
	attributes.resource.type == "market_order"
}
