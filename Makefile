all: demos

src/%.o: src/%.cpp
	g++ -std=c++11 -Isrc $< -c -o $@

test/%.o: test/%.cpp
	g++ -std=c++11 -Isrc $< -c -o $@

demos: demo01

demo01: test/test.o test/imageio.o test/image.o src/polypartition.o
	g++ $^ -o $@
	cd test && ../$@ && cd ..

demo02: test/demo.o test/imageio.o test/image.o src/polypartition.o
	g++ $^ -o $@
	cd test && ../$@ && cd ..

clean:
	rm -f *.o demo01 demo02
	cd src && rm -f *.o
	cd test && rm -f *.o && rm -f *.bmp
