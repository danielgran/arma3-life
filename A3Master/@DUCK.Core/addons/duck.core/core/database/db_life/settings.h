/**
 * @Date:   2020-04-09T19:16:32+02:00
 */
class db_life
{

  // DB IDS of Redis are saved here
  class Redis
  {
    dbIds[] =
    {
      {"playerdata", 0}, // Contains all the cached playerdata which the player is using
      {"garagedata", 1}, // Contains all playergarages and houses
      {"shopdata", 2}, // Contains Infrmation about shops on the server
      {"placeholder03", 3},
      {"placeholder04", 4},
      {"placeholder05", 5},
      {"placeholder06", 6},
      {"placeholder07", 7},
      {"placeholder08", 8},
      {"placeholder09", 9},
      {"placeholder10", 10}

    };
  };

  class tblplayers
  {
    playerRelated[] =
    {
      {"a3name", "STRING"},
      {"rankTeam", "SCALAR"},
      {"rankDonator", "SCALAR"},
      {"nickname", "STRING"},
      {"location", "DBARRAY"},
      {"gearCivilian", "DBARRAY"},
      {"gearPolice", "DBARRAY"},
      {"gearMedic", "DBARRAY"},
      {"gearMechanic", "DBARRAY"},
      {"invVirtual", "DBARRAY"},
      {"alive", "BOOL"},
      {"arrested", "DBARRAY"},
      {"banned", "BOOL"},
      {"cash", "SCALAR"},
      {"bank", "SCALAR"},
      {"teamkills", "SCALAR"},
      {"kills", "SCALAR"},
      {"deaths", "SCALAR"},
      {"xp", "SCALAR"},
      {"levelPlayer", "SCALAR"},
      {"levelPolice", "SCALAR"},
      {"levelMedic", "SCALAR"},
      {"levelMech", "SCALAR"},
      {"playtime", "SCALAR"},
      {"lastconnect", "SCALAR"}
    };
  };


  class tblGarageVehicle
  {
    schema[] =
    {
      {"id", "SCALAR"},
      {"intid", "STRING"},
      {"nameClass", "STRING"},
      {"nameDisplay", "STRING"},
      {"canSpawn", "BOOL"},
      {"priceBuy", "BOOL"},
      {"inventoryVirt", "DBARRAY"},
      {"fuel", "SCALAR"},
      {"hitInfo", "DBARRAY"},
      {"cargoBackpack", "DBARRAY"},
      {"cargoItem", "DBARRAY"},
      {"cargoWeapon", "DBARRAY"},
      {"cargoMagazine", "DBARRAY"},
      {"turretWeapon", "DBARRAY"},
      {"turretAmmo", "DBARRAY"}
    };
  };

  class tblPlayerServerTransact
  {
    schema[] =
    {

      {"steamid64", "STRING"},
      {"serverFrom", "SCALAR"},
      {"serverTo", "SCALAR"},
      {"vehicle", "STRING"},
      {"vehicleSkin", "STRING"},
      {"velocity", "DBARRAY"}

    };
  };



  class tblEcoShopServerInfo
  {

    // schema of the sp in the mysql 
    schemaSP[] =
    {
      {"shopID", "STRING"},
      {"shopName", "STRING"},
      {"shopType", "STRING"},
      {"itemClass", "STRING"},
      {"itemName", "STRING"},
      {"itemIsVirtual", "STRING"},
      {"itemType", "STRING"},
      {"itemPriceBuy", "SCALAR"},
      {"itemPriceSell", "SCALAR"},
      {"itemStock", "SCALAR"}
    };

    schemaCache[] = 
    {
      {"shopID", "STRING"},
      {"shopName", "STRING"},
      {"shopType", "STRING"},
      {"warehouse", "DBARRAY"}
    };




  };



};
