include "./ThirdParty/Premake/premake_customization/solution_items.lua"
include "Dependencies.lua"

workspace "Auxilium"
	architecture "x64"
	startproject "Frontiers"
	buildoptions { "/utf-8" } 
	linkoptions { "/utf-8" }
	configurations
	{
		"Debug",
		"Release",
		"Distribution"
	}

	solution_items
	{
		".editorconfig"
	}

	flags
	{
		"MultiProcessorCompile"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

group "Dependencies"
	include "ThirdParty/premake"
	include "Auxilium/ThirdParty/glfw"
	include "Auxilium/ThirdParty/glad"

group "Core"
	include "Catalyst"
	include "Auxilium"

group "Game"
	include "Frontiers"
group ""


