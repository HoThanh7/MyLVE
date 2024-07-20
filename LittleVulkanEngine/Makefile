CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

LittleVulkanEngine: *.cpp *.hpp
	g++ $(CFLAGS) -o LittleVulkanEngine *.cpp $(LDFLAGS)

.PHONY: test clean

test: LittleVulkanEngine
	./LittleVulkanEngine

clean:
	rm -f LittleVulkanEngine
