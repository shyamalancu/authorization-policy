package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default resourceset_is_5fpriority_5fhigh = false

resourceset_is_5fpriority_5fhigh {
	attributes.resource.priority == "true"
	attributes.resource.type == "project"
}
