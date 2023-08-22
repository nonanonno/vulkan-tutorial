CFLAGS = -std=c++17 -O2 -g
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

VulkanTest: main.cpp
	clang++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)

.PHONY: test clean compile-shader

test: VulkanTest
	./VulkanTest

clean:
	rm -f VulkanTest shaders/*.spv

compile-shader:
	cd shaders && \
	glslc shader.vert -o vert.spv && \
	glslc shader.frag -o frag.spv
