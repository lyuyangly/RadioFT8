CC = gcc
CXX = g++
CFLAGS = -O3 -D_USE_MATH_DEFINES
CXXFLAGS = -std=c99 -D_USE_MATH_DEFINES -I.
LDFLAGS = -lm

TARGETS = gen_ft8 decode_ft8 test rclib

.PHONY: run_tests all clean

all: $(TARGETS)

run_tests: test
	@./test

gen_ft8: gen_ft8.o ft8/constants.o ft8/text.o ft8/pack.o ft8/encode.o ft8/crc.o common/wave.o
	$(CXX) $(LDFLAGS) -o $@ $^

test:  test.o ft8/pack.o ft8/encode.o ft8/crc.o ft8/text.o ft8/constants.o fft/kiss_fftr.o fft/kiss_fft.o 
	$(CXX) $(LDFLAGS) -o $@ $^

decode_ft8: decode_ft8.o fft/kiss_fftr.o fft/kiss_fft.o ft8/decode.o ft8/encode.o ft8/crc.o ft8/ldpc.o ft8/unpack.o ft8/text.o ft8/constants.o common/wave.o
	$(CXX) $(LDFLAGS) -o $@ $^

rclib:
	$(AR) rc libft8.a ft8/constants.o ft8/encode.o ft8/pack.o ft8/text.o common/wave.o 

clean:
	rm -f *.o ft8/*.o common/*.o fft/*.o libft8.a $(TARGETS)

