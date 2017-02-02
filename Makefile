CC=clang+llvm-3.9.1-x86_64-linux-gnu-ubuntu-16.04/bin/clang
CFLAGS=-Idist/public/nss/ -Idist/Linux3.13_x86_64_clang-3.9_glibc_PTH_ASAN_64_DBG.OBJ/include/ -Wall -g -fsanitize=address
LDFLAGS=-Ldist/Linux3.13_x86_64_clang-3.9_glibc_PTH_ASAN_64_DBG.OBJ/lib/ -lnss3 -lnspr4 -lsmime3 -lssl3 -lnssutil3

default: dbs nssthreading
run:
	LD_LIBRARY_PATH=dist/Linux3.13_x86_64_clang-3.9_glibc_PTH_ASAN_64_DBG.OBJ/lib/ ./nssthreading

dbs:
	certutil -d . -N --empty-password

nssthreading: nssthreading.c Makefile
	$(CC) -o nssthreading nssthreading.c $(CFLAGS) $(LDFLAGS)

clean:
	rm -f nssthreading key3.db cert8.db secmod.db
