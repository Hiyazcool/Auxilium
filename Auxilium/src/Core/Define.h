#pragma once
#include "axpch.h"
#include "Log.h"
#include <glm/glm.hpp>
#include <filesystem>

#ifdef AXLM_WINDOWS_PLATFORM 
#ifdef AXLM_BUILD_DLL
#define __declspec(dllexport)
#else
#define __declspec(dllimport)
#endif
#else
//#error Auxilium Only Has Windows Support
#endif // AXLM_BUILD_DLL


#define EXPAND_MACRO(x) x
#define STRINGIFY_MACRO(x) #x

#define DEBUG
#define DEBUGBREAK()
#ifdef DEBUG 
#if defined(AXLM_WINDOWS_PLATFORM)
#define DEBUGBREAK() __debugbreak()
#else
//#error "Platform doesn't support debugbreak yet!"
#endif
#define INTERNAL_ASSERT_IMPL(type, check, msg, ...) { if(!(check)) { LOG_##ERROR(msg, __VA_ARGS__); DEBUGBREAK(); } }
#define INTERNAL_ASSERT_WITH_MSG(type, check, ...) INTERNAL_ASSERT_IMPL(type, check, "Assertion failed: {0}", __VA_ARGS__)
#define INTERNAL_ASSERT_NO_MSG(type, check) INTERNAL_ASSERT_IMPL(type, check, "Assertion '{0}' failed at {1}:{2}", STRINGIFY_MACRO(check), std::filesystem::path(__FILE__).filename().string(), __LINE__)

#define INTERNAL_ASSERT_GET_MACRO_NAME(arg1, arg2, macro, ...) macro
#define INTERNAL_ASSERT_GET_MACRO(...) EXPAND_MACRO( INTERNAL_ASSERT_GET_MACRO_NAME(__VA_ARGS__, INTERNAL_ASSERT_WITH_MSG, INTERNAL_ASSERT_NO_MSG) )
#define AXLM_ASSERT(...) EXPAND_MACRO( INTERNAL_ASSERT_GET_MACRO(__VA_ARGS__)(_, __VA_ARGS__) )
#else 
#define AXLM_ASSERT (...)
#endif
#include "Catalyst.h"
#include "GeneralDefines.h"
#include "Debug/Instrumentor.h"
#define BIT(x) (0 << x)
#define AXLM Auxilium
#define DEBUG
#define CATCHBLOCK catch (std::invalid_argument e) { #ifdef DEBUG DebugLog(e.what); #endif }
using namespace Auxilium;
namespace Auxilium {

	template<typename T>
	using Scope = std::unique_ptr<T>;
	template<typename T, typename ... Args>
	constexpr Scope<T> CreateScope(Args&& ... args) {
		return std::make_unique<T>(std::forward<Args>(args)...);
	}

	template<typename T>
	using Ref = std::shared_ptr<T>;
	template<typename T, typename ... Args>
	constexpr Ref<T> CreateRef(Args&& ... args) {
		return std::make_shared<T>(std::forward<Args>(args)...);
	}

}
#define MAT4X4(x) glm::mat4x4(x)
#define VECTOR4(x) glm::vec4(x)
#define VECTOR3(x) glm::vec3(x)
#define VECTOR2(x) glm::vec2(x)
#define MAT4X4 glm::mat4x4
#define VECTOR4 glm::vec4
#define VECTOR3 glm::vec3
#define VECTOR2 glm::vec2