all: full-package

deploy: clean build pack
clean-deploy: unpack clean build pack
cdep: unpack build pack

setup:
	pip install pyinstaller
	sudo apt install -y upx
	

build: 
	go build b64enc.go
	go build sha1.go
	go build encrypt.go
	go build b64dec.go
	go build dog.go
	pyinstaller --noconfirm --onefile --console  "decrypt.py"

clean:
	sleep 0.5
	rm -rf  fs sha1 b64enc encrypt build dist gutils.zip *.spec decrypt compress bytes build/ dog
	sleep 0.5

cleanbin:
	sleep 0.5
	rm -rf bin/*
	sleep 0.5

pack: b64enc sha1  encrypt encrypt b64dec
	upx -9 b64enc sha1  encrypt b64dec

unpack: b64enc sha1 encrypt
	upx -d b64enc sha1 encrypt

move: b64enc sha1  encrypt b64dec
	mv b64enc bin
	mv sha1 bin
	mv encrypt bin
	mv dist/decrypt bin
	mv b64dec bin
	mv dog bin
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