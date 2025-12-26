project "Frontiers"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp"
	}

	includedirs
	{
		"%{wks.location}/Auxilium/ThirdParty/spdlog/include",
		"%{wks.location}/Auxilium/src",
		"%{wks.location}/Auxilium/ThirdParty",
		"%{IncludeDir.glm}",
	}

	links
	{
		"Auxilium"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "AX_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "AX_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Distribution"
		defines "AX_DISTRIBUTION"
		runtime "Release"
		optimize "on"