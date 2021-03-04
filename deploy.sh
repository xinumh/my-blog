#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# git init
git add .
git commit -m 'deploy'

git push -f origin  master:master

# 进入生成的文件夹
cd public

# 如果发布到 https://<USERNAME>.github.io
git push -f git@github.com:xinumh/xinumh.github.io.git master

cd ..

