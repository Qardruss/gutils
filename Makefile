all: clean build

deploy: clean build pack
clean-deploy: unpack clean build pack
cdep: unpack build pack

setup:
	pip install pyinstaller
	

build:
	go build test.go
	go build b64enc.go
	go build test.go
	go build sha1.go
	go build encrypt.go
	go build b64dec.go
	pyinstaller --noconfirm --onefile --console  "decrypt.py"

clean:
	sleep 0.5
	rm -rf test fstest sha1 b64enc encrypt build dist gutils.zip *.spec decrypt compress bytes build/
	sleep 0.5

cleanbin:
	sleep 0.5
	rm -rf bin/*
	sleep 0.5

pack: b64enc sha1 test encrypt encrypt b64dec
	upx -9 b64enc sha1 test encrypt b64dec

unpack: b64enc sha1 test encrypt
	upx -d b64enc sha1 test encrypt

move: b64enc sha1 test encrypt b64dec
	mv b64enc bin
	mv sha1 bin
	mv test bin
	mv encrypt bin
	mv dist/decrypt bin
	mv b64dec bin
	rm -rf dist
package:
	bash -c "cd bin && zip gutils.zip * && mv gutils.zip .. && cd .. "
full-clean: clean cleanbin clean-strings
clean-strings:
	rm -rf *.strings *.upx.strings
full-package: cleanbin clean build pack move clean package cleanbin
pull:
	git fetch
	git pull
push:
	bash -c "git add * && git commit -m \"Commit from Makefile\" && git push"