.PHONY: int16_t clean format zip

CXX=g++
 
CXXFLAGS=-O2 -Wall -DNDEBUG -std=c++17

ifneq (,$(findstring B,$(firstword $(MAKEFLAGS))))
LDFLAGS= -static -lcrypto++  
else
LDFLAGS= -lcrypto++  
endif


EXEC=client
INT16=$(EXEC)_int16_t
SOURCE=$(EXEC).cpp


all: int16_t

int16_t: $(INT16)


$(INT16): $(SOURCE)
	$(CXX)  $(SOURCE)  -o $(INT16) $(CXXFLAGS) $(LDFLAGS) -DCODE=-16

zip: 
	zip dumb_client.zip $(EXEC)_*

clean:
	rm -f $(EXEC)_* *.zip
