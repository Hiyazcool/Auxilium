#pragma once
#include "Component.h"
class SystemAPI {



	// ECB
public:

	class EntityCommandBuffer {
		friend SystemAPI;
	public:
		template<typename type, typename... args>
		type AddComponent();
	};
};

