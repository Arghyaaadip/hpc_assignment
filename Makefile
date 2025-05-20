.PHONY: all clean

SRC=src/

INCLUDES=-Iexternal/argparse-2.9/include -Iexternal/libnpy/include
CFLAGS=-std=c++17 -O3 -march=native -Wall -Wextra -Wnarrowing -Wparentheses -Werror -Wno-unused-parameter
CC=g++
BINS=cgc_serial

all: $(BINS) Makefile

cgc_serial: $(SRC)/serial.cpp $(SRC)/common.h
	$(CC) -o $@ $(SRC)/serial.cpp $(CFLAGS) $(INCLUDES)

submit:
	tar -czf submission.tar.gz src/ Makefile *.job *.pdf

clean:
	rm -rf $(BINS)

