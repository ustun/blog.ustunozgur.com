install_deps:
	bundle install --path vendor/bundle --binstubs

locally_serve: install_deps
	bin/jekyll s

build: install_deps
	bin/jekyll build

build_and_serve: build
	(cd _site; python -m SimpleHTTPServer)
