package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default resourceset_Large_5fquantity = false

resourceset_Large_5fquantity {
	attributes.resource.Quantity > 15000
	attributes.resource.type == "market_order"
}
