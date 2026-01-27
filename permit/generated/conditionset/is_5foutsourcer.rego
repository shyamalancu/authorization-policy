package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default userset_is_5foutsourcer = false

userset_is_5foutsourcer {
	contains(attributes.user.key, "outsourcer")
}
