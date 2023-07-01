

git lfs track ./*
git add ./*
huggingface-cli lfs-enable-largefiles ./
git commit -am "Add files in LFS mode"
git push
