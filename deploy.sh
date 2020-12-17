set -e
npm run build 
cd dist
git init 
git add -addgit commit -m " deploy"