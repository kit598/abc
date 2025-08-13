

#ifndef CONFIGPARSER_HPP
#define CONFIGPARSER_HPP

#include "ServerConfig.hpp"

#include <fstream>
#include <sstream>
#include <iostream>
#include <algorithm>
#include <set>        

# define SEV_COLOR 	"\033[0;34m"

class ConfigParser
{
	public:
		static std::vector<ServerConfig> parseAllConfigs		  (const std::string& configFilePath);
		static bool 					 checkErrorParseAllConfigs(const std::vector<ServerConfig>& servers);
		static void 					 printConfigParser		  (const std::vector<ServerConfig>& servers) ;


		/// kit add ///
		static void 					 printSelectedServer(const ServerConfig* s);


		
};


#endif

