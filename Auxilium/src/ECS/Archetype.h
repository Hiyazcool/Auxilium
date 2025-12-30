#include "axpch.h"
#include"Core/Define.h"
#pragma once
#include "Component.h"
#include "Entity.h"
struct Archetype {
	uint ArchetypeID;
	std::unordered_map<uint32, IComponent> Comps;
};
