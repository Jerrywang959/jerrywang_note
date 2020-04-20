# build gitbook and push to gitee
gitbook build ./ ./docs
git commit -m "同步到gitee"
git push gitee