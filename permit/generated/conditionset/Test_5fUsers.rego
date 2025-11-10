package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default userset_Test_5fUsers = false

userset_Test_5fUsers {
	contains(attributes.user.email, "test")
}
