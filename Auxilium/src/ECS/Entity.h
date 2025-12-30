#include "axpch.h"
#include "Core/Define.h"
#pragma once
struct Entity {
public:
	uint32 ID;
	operator unsigned long() const {
		return ID;
	}
};