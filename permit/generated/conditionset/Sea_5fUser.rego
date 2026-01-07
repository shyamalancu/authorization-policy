package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default userset_Sea_5fUser = false

userset_Sea_5fUser {
	contains(attributes.user.email, "testuser@example.com")
}
