class CfgDeployableVehicles {
    vehicleType = "B_Quadbike_01_F";  // No sell price in current Epoch pricing.
    despawnTimeOnRoad = 60;
    despawnTimeOffRoad = 300;
};

class CfgPatches {
    class deployableVehicles {
        requiredAddons[] = {
           //"epoch_server",
           //"a3_epoch_code"
        };
    };
};

class CfgBuild {
    class deployableVehicles {
        build = 1;
        version = 0.1;
        date = "01-03-22";
    };
};

class CfgFunctions {
    class DV {
        class startup {
            file = "deployableVehicles\init";
            class Init { postInit = 1; }
        };
        class serverFunctions {
            file = "deployableVehicles\server_functions";
            class deleteVehicle {};
            class mainLoop {};
            class playerDied {};            
            class spawnVehicleRequest {};
            class stowVehicleRequest {};
        };
    };
};

