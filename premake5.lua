include "../../premake/common_premake_defines.lua"

project "zstd"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	files {
		"./lib/**.h",
		"./lib/**.c",
		"./lib/**.cpp"
	}

	defines {
		"ZSTD_MULTITHREAD=1",
		"ZSTD_LEGACY_SUPPORT=5"
	}

	filter "toolset:msc"
		disablewarnings { "4244" }

 	filter "system:windows"
		defines { "_CRT_SECURE_NO_WARNINGS" }