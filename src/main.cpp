
#include "../include/Server.hpp"
#include "../include/HttpRequest.hpp"

#include "Server.hpp"
#include <iostream>
#include <exception>
#include <signal.h>

int main(int argc, char **argv)
{
    // try{

    if (argc != 2) 
    {
        std::cerr <<RED "Usage:  ./Server  <config file>" RESET<< std::endl;
        return 1;
    }




    signal(SIGPIPE, SIG_IGN);
    Server     webserver(argv[1]);
    // ConfigParser::printConfigParser(webserver.getServerConfigs());
    ConfigParser::printSelectedServer(&webserver.getServerConfigs()[2]); //<===add    
    webserver.run();





    
    // std::cout <<RED "\n\n===== test3 parse request =====\n" RESET;
    // char bufferReadRequest[] =
    //         "POST /search?q=Server&lang=en HTTP/1.1\r\n"
    //         "Host: localhost:9091\r\n"
    //         "User-Agent: MakefileTest/1.0\r\n"
    //         "Accept: \r\n"
    //         "Cookie: PHPSESSID=xyz789; theme=dark\r\n"
    //         "Content-Type: application/json\r\n"
    //         "Content-Length: 45\r\n"
    //         "\r\n"\
    //         "{\"query\": \"Server\", \"lang\": \"en\"}";
    // HttpRequest     request;
    // request.HttpRequest::parseHttpRequest(bufferReadRequest, request);
    // HttpRequest::printHttpRequest(request);
    // std::cout <<GREEN "test public variable method: " RESET<< request.method << "\n";
    return 0;
}


