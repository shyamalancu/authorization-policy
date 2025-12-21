package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default userset_Seacom_5fUsers = false

userset_Seacom_5fUsers {
	contains(attributes.user.email, "sea.com1")
}
