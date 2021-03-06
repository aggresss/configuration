#!/usr/bin/env bash
# hello test for various kinds of language

# linux shell color support.
BLACK="\\033[30m"
RED="\\033[31m"
GREEN="\\033[32m"
YELLOW="\\033[33m"
BLUE="\\033[34m"
MAGENTA="\\033[35m"
CYAN="\\033[36m"
WHITE="\\033[37m"
NORMAL="\\033[m"
LIGHT="\\033[1m"
INVERT="\\033[7m"


HELLO_TYPE=$1
case ${HELLO_TYPE} in
    c)
        cat << END > /tmp/hello.c
#include <stdio.h>
#include <signal.h>

static int interrupted = 0;

static void handleInterrupt(int sig)
{
    interrupted = 1;
}

int main(int argc, const char * argv[])
{
    (void)signal(SIGINT, handleInterrupt);
    (void)signal(SIGTERM, handleInterrupt);
    (void)signal(SIGKILL, handleInterrupt);

    printf("Hello, World!\n");
    while(!interrupted) {
    }
    return 0;
}

END
        echo "/tmp/hello.c"
        #gcc -v /tmp/hello.c 2> /tmp/hello.c.txt
        #gcc -v /tmp/hello.c
        #rm -rf /tmp/hello.c* a.out
    ;;
    h)

        cat << END > /tmp/hello.h
/* License */

#ifndef HELLO_H
#define HELLO_H

/* Includes */

/* Public defines */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/* Public structures */

/* Function declarations */

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* HELLO_H */

END
        echo "/tmp/hello.h"
    ;;
    cpp)
        cat << END > /tmp/hello.cpp
#include <iostream>

class Foo {
   public:

   protected:
   private:
};

struct Bar {

};

int main(int argc, const char * argv[])
{
    std::cout << "Hello, World!" << std::endl;
    return 0;
}

END
        echo "/tmp/hello.cpp"
        #g++ -v /tmp/hello.cpp 2> /tmp/hello.cpp.txt
        #g++ -v /tmp/hello.cpp
        #rm -rf /tmp/hello.cpp* a.out
    ;;
    go)
        cat << END > /tmp/hello.go
package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGINT, syscall.SIGTERM, syscall.SIGKILL)

	fmt.Println("Hello, World!")

	select {
	case s := <-ch:
		fmt.Println(s.String())
	}
}

END
        echo "/tmp/hello.go"
        #go build -o a.out /tmp/hello.go
        #rm -rf /tmp/hello.go a.out
    ;;
    rs)
        cat << END > /tmp/hello.rs
fn main() {
    println!("Hello, world!");
}

END
        echo "/tmp/hello.rs"
        #rustc /tmp/hello.rs
        #rm -rf /tmp/hello.rs /tmp/hello

    ;;
    py)
        cat << END > /tmp/hello.py
# -*- coding: UTF-8 -*-
print('Hello, World!')

END
        echo "/tmp/hello.py"
        #python /tmp/hello.py
        #rm -rf /tmp/hello.py
    ;;
    sh)
        cat << END > /tmp/hello.sh
#!/usr/bin/env bash

function hello () {
    echo "\$(echo "Hello, World!")"
}

hello \$@
END
        echo "/tmp/hello.sh"
        chmod +x /tmp/hello.sh
        #bash /tmp/hello.sh
        #rm -rf /tmp/hello.sh
    ;;
    pl)
        cat << END > /tmp/hello.pl
#!/usr/bin/env perl

print "Hello, World!\n"

END
        echo "/tmp/hello.pl"
        chmod +x /tmp/hello.pl
        #perl /tmp/hello.pl
        #rm -rf /tmp/hello.pl

    ;;
    cmake)
        cat << END > /tmp/CMakeLists.txt
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
project(HELLO C)
set(CMAKE_VERBOSE_MAKEFILE ON)
file(WRITE \${CMAKE_BINARY_DIR}/main.c "#include <stdio.h>\nint main(void){printf(\"Hello, World!\\\\n\");return 0;}\n")
add_executable(main main.c)
install(TARGETS main RUNTIME DESTINATION bin)

END
        echo "/tmp/CMakeLists.txt"
    ;;
    make)
        cat << END > /tmp/Makefile
ifeq (\$(OUTPUT), )
    OUTPUT:=Hello, World!
endif

all:
	@echo \$(OUTPUT)

END
    ;;
    nodejs)
        cat << END > /tmp/hello.js
#!/usr/bin/env node

'use strict'
const http = require('http');
const port = process.env.PORT || 8080;

(async function() {
  http.createServer(async (req, res) => {
    res.writeHead(200, {
      "Content-Type": "text/plain",
      "Access-Control-Allow-Origin": "*"
      });
    res.end('Hello, World!\n');
  }).listen(port, "0.0.0.0");
  console.log(\`Server running at http://:localhost:\${port}/\`);
})();

END
    echo "/tmp/hello.js"
    chmod +x /tmp/hello.js
    ;;
    html)
        cat << END > /tmp/hello.html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Hello, World!</title>
    <link rel="help" href="https://github.com/aggresss/dotfiles">
    <style type="text/css">
      h1 {color:magenta}
      p {color:cyan}
    </style>
  </head>
  <body>
    <h1>Hello, World!</h1>
    <p>Hello, World!</p>
    <script>
      console.log('Hello, World!')
    </script>
  </body>
</html>

END
    echo "/tmp/hello.html"
    ;;
    java)
    cat << END > /tmp/hello.java
public class hello{
    public static void main(String[] args){
         System.out.println("Hello, World!");
    }
}

END
    echo "/tmp/hello.java"
    ;;
    lua)
    cat << END > /tmp/hello.lua
#!/usr/bin/env lua

function printHello(printString)
    print(printString)
end

printHello("Hello, World!")

END
    echo "/tmp/hello.lua"
    chmod +x /tmp/hello.lua
    ;;
    rb)
    cat << END > /tmp/hello.rb
#!/usr/bin/env ruby

puts "Hello, World!"

END
    echo "/tmp/hello.rb"
    chmod +x /tmp/hello.rb
    ;;
    *)
        echo -e "${GREEN}Support Lang:"
        echo -e "  c\n  h\n  cpp\n  go\n  rs\n  py\n  sh\n  pl\n  cmake\n  make\n  nodejs\n  html\n  java\n  lua\n  rb\n${NORMAL}"
    ;;
esac

