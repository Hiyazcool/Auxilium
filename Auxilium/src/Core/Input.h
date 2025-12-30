#pragma once
#pragma once

#include "Core/KeyCode.h"
#include "Core/MouseCode.h"

#include <glm/glm.hpp>

namespace Auxilium {

	class Input {
	public:
		static bool IsKeyPressed(KeyCode key);

		static bool IsMouseButtonPressed(MouseCode button);
		static VECTOR2 GetMousePosition();
		static float GetMouseX();
		static float GetMouseY();
	};
}
