package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default userset_Trade_5fuser = false

userset_Trade_5fuser {
	"Trade" in attributes.user.roles
}
