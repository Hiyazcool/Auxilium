IncludeDir = {}
IncludeDir["stb_image"] = "%{wks.location}/Auxilium/ThirdParty/stb"
IncludeDir["GLFW"] = "%{wks.location}/Auxilium/ThirdParty/GLFW/include"
IncludeDir["Glad"] = "%{wks.location}/Auxilium/ThirdParty/Glad/include"
IncludeDir["glm"] = "%{wks.location}/Auxilium/ThirdParty/glm"

Library = {}

Library["WinSock"] = "Ws2_32.lib"
Library["WinMM"] = "Winmm.lib"
Library["WinVersion"] = "Version.lib"
Library["BCrypt"] = "Bcrypt.lib"
