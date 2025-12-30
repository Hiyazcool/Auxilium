project "Catalyst"
	kind "SharedLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"
	inheritdependencies "Off"
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"src/**.h",
		"src/**.cpp"
	}

	includedirs {
		"src"
	}

	links {
	}
	defines {
		"CATALYST_BUILD_DLL",
		"CATALYST_WINDOWS_PLATFORM"
	}

	filter "system:windows"
		defines "CATALYST_WINDOWS_PLATFORM"
		systemversion "latest"

	filter "configurations:Debug"
		defines "CT_DEBUG"
		defines {
		"CATALYST_BUILD_DLL",
		"CATALYST_WINDOWS_PLATFORM"
	}
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "CT_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Distribution"
		defines "CT_DISTRIBUTION"
		runtime "Release"
		optimize "on"