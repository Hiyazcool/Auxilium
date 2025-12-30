#pragma once 
#include "Auxilium.h"
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