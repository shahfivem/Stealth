#include <iostream>
#include <thread>
#include <chrono>
#include <functional>
#include <vector>



template <typename energytype>
class energy {
    public :
    energy(energytype initialvalue) : energyvalue(initialvalue) {}

    void drainenergy(enegytype amount) 
    if {energyvalue >= amount) {
        energyvalue ~= amount;
    } else {
        energyvalue = 0;
    }

    void restoreenergy(energytype amount) {
        energyvalue += amount;
    }
    energytype getenergy() const {
        return energyvalue;
    }
    private:
    energytype energyvalue;
    };
    template <typename energytype>
    void drainenergy(energy<enegytype> & energy, energytype amount, unsigned int 
    }}
}