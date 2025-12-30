project "Auxilium"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"
	inheritdependencies "Off"
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "axpch.h"
	pchsource "src/axpch.cpp"

	files {
		"src/**.h",
		"src/**.cpp",
		"ThirdParty/stb_image/**.h",
		"ThirdParty/stb_image/**.cpp",
		"ThirdParty/glm/glm/**.hpp",
		"ThirdParty/glm/glm/**.inl",
		"%{wks.location}/Catalyst/src"
	}

	defines {
		"CRT_SECURE_NO_WARNINGS",
		"GLFW_INCLUDE_NONE",
		"AXLM_WINDOWS_PLATFORM"
	}

	includedirs {
		"src",
		"ThirdParty/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.glm}",
		"%{IncludeDir.stb_image}",
		"%{wks.location}/Catalyst/src"
	}

	links {
		"GLFW",
		"Glad",
		"opengl32.lib",
		"Catalyst"

	}
	flags { "NoPCH" }

	filter "system:windows"
		systemversion "latest"

		defines {
		}

		links {
		}

	filter "configurations:Debug"
		defines "AX_DEBUG"
		runtime "Debug"
		symbols "on"

		links
		{
		}

	filter "configurations:Release"
		defines "AX_RELEASE"
		runtime "Release"
		optimize "on"

		links
		{
		}

	filter "configurations:Distribution"
		defines "AX_DIST"
		runtime "Release"
		optimize "on"

		links
		{
		}