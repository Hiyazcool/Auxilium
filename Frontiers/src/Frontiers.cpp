#pragma once 
#include "Auxilium.h"
#include "Core/Entry.h"
class FrontiersApplication : public Auxilium::Application {


public:
	FrontiersApplication() {
	}
	~FrontiersApplication() {
	}

};
Auxilium::Application* Auxilium::CreateApplication() {
	return new FrontiersApplication();
}