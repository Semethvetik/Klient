.PHONY: all double int16_t uint16_t int32_t uint32_t int64_t uint64_t clean format zip

CXX=g++
 
CXXFLAGS=-O2 -Wall -DNDEBUG -std=c++17

ifneq (,$(findstring B,$(firstword $(MAKEFLAGS))))
LDFLAGS= -static -lcrypto++  
else
LDFLAGS= -lcrypto++  
endif


EXEC=client
FLOAT=$(EXEC)_float
DOUBLE=$(EXEC)_double
INT16=$(EXEC)_int16_t
INT32=$(EXEC)_int32_t
INT64=$(EXEC)_int64_t
UINT16=$(EXEC)_uint16_t
UINT32=$(EXEC)_uint32_t
UINT64=$(EXEC)_uint64_t
SOURCE=$(EXEC).cpp


all: float double int16_t uint16_t int32_t uint32_t int64_t uint64_t

float: $(FLOAT)
double: $(DOUBLE)
int16_t: $(INT16)
uint16_t: $(UINT16)
int32_t: $(INT32)
uint32_t: $(UINT32)
int64_t: $(INT64)
uint64_t: $(UINT64)

$(FLOAT): $(SOURCE)
	$(CXX)  $(SOURCE)  -o $(FLOAT) $(CXXFLAGS) $(LDFLAGS) -DCODE=-4

$(DOUBLE): $(SOURCE)
	$(CXX)  $(SOURCE)  -o $(DOUBLE) $(CXXFLAGS) $(LDFLAGS) -DCODE=-8

$(INT16): $(SOURCE)
	$(CXX)  $(SOURCE)  -o $(INT16) $(CXXFLAGS) $(LDFLAGS) -DCODE=-16
	
$(UINT16): $(SOURCE)
	$(CXX)  $(SOURCE)  -o $(UINT16) $(CXXFLAGS) $(LDFLAGS) -DCODE=16

$(INT32): $(SOURCE)
	$(CXX)  $(SOURCE)  -o $(INT32) $(CXXFLAGS) $(LDFLAGS) -DCODE=-32
	
$(UINT32): $(SOURCE)
	$(CXX)  $(SOURCE)  -o $(UINT32) $(CXXFLAGS) $(LDFLAGS) -DCODE=32
	
$(INT64): $(SOURCE)
	$(CXX)  $(SOURCE)  -o $(INT64) $(CXXFLAGS) $(LDFLAGS) -DCODE=-64
	
$(UINT64): $(SOURCE)
	$(CXX)  $(SOURCE)  -o $(UINT64) $(CXXFLAGS) $(LDFLAGS) -DCODE=64

zip: 
	zip dumb_client.zip $(EXEC)_*

clean:
	rm -f $(EXEC)_* *.zip
