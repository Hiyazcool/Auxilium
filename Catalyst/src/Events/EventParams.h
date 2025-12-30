#pragma once
#include "CatalystAPI.h"
namespace Catalyst {
	struct CATALYST_API EventParams {
		bool IsHandled;
		EventParams() :
			IsHandled(false)
		{

		}
	};
}
