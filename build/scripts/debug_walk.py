import os
with open("build/debug_walk.txt", "w") as f:
    for r,d,fi in os.walk('build/temp'):
        for fl in fi:
            f.write(os.path.join(r,fl) + "\n")
