#!/bin/bash
echo "func _blockIntelSha(h *[8]uint32, data []byte, length int)" > sha256blockIntelSha_amd64.go
clang -O3 -mtune=native -march=native -masm=intel -fno-asynchronous-unwind-tables -fno-exceptions -msha -msse4.2 -S ./sha256-x86.c -o ./sha256-x86.s
c2goasm -a sha256-x86.s sha256blockIntelSha_amd64.s
sed -i 's/_blockIntelSha/blockIntelSha/g' sha256blockIntelSha_amd64.s
mv sha256blockIntelSha_amd64.s ../sha256blockIntelSha_amd64.s