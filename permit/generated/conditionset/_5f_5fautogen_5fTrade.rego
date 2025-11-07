package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default userset__5f_5fautogen_5fTrade = false

userset__5f_5fautogen_5fTrade {
	"Trade" in attributes.user.roles
}
