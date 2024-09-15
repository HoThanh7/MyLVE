#flags for the compiler
CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

#define GLSLC binary file path for compile
GLSLC = /usr/bin/glslc

# create list for all spv files and set as dependency
vertSources = $(shell find ./shaders -type f -name "*.vert")
vertObjFiles = $(patsubst %.vert, %.vert.spv, $(vertSources))
fragSources = $(shell find ./shaders -type f -name "*.frag")
fragObjFiles = $(patsubst %.frag, %.frag.spv, $(fragSources))

TARGET = LittleVulkanEngine
$(TARGET): $(vertObjFiles) $(fragObjFiles)
$(TARGET): *.cpp *.hpp
	g++ $(CFLAGS) -o $(TARGET) *.cpp $(LDFLAGS)

# make shader targets
%.spv: %
	${GLSLC} $< -o $@

.PHONY: test clean

test: LittleVulkanEngine
	./LittleVulkanEngine

clean:
	rm -f LittleVulkanEngine


#old makefile



#CFLAGS = -std=c++17 -O2
#LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

#LittleVulkanEngine: *.cpp *.hpp
#	g++ $(CFLAGS) -o LittleVulkanEngine *.cpp $(LDFLAGS)

#.PHONY: test clean

#test: LittleVulkanEngine
#	./LittleVulkanEngine

#clean:
#	rm -f LittleVulkanEngine
