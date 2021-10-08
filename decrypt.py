import zlib, sys

with open(sys.argv[1], 'rb') as handle:
    print(zlib.decompress(handle.read()).decode('utf-8'))