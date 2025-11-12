package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default resourceset_User_5fview_5fMO = false

resourceset_User_5fview_5fMO {
	attributes.user.key in attributes.resource.ViewOnlyUsers
	attributes.resource.type == "market_order"
}
