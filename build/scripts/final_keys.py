import sys
sys.path.append('build/scripts')
import bundle

bundle.TEMP_DIR = "build/temp"
bundle.SRC_DIR = "build/temp"
bundle.bundle()

with open('build/keys.txt', 'w') as f:
    for name in bundle.processed_modules.keys():
        f.write(name + "\n")
