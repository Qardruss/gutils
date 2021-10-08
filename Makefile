all: clean build

deploy: clean build pack
clean-deploy: unpack clean build pack
cdep: unpack build pack

build:
	go build test.go
	go build b64enc.go
	go build test.go
	go build sha1.go
	go build encrypt.go
	pyinstaller --noconfirm --onefile --console  "/home/Arkadii/a-gostuff/decrypt.py"

clean:
	sleep 0.5
	rm -rf test fstest sha1 b64enc encrypt build dist gutils.7z decrypt.spec decrypt compress
	sleep 0.5

cleanbin:
	sleep 0.5
	rm -rf bin/*
	sleep 0.5

pack: b64enc sha1 test encrypt encrypt decrypt
	upx -9 b64enc sha1 test encrypt decrypt

unpack: b64enc sha1 test encrypt decrypt
	upx -d b64enc sha1 test encrypt decrypt

move: b64enc sha1 test encrypt
	mv b64enc bin
	mv sha1 bin
	mv test bin
	mv encrypt bin
	mv dist/decrypt bin
	rm -rf dist
package:
	bash -c "cd bin && 7z a gutils.7z && mv gutils.7z .. && cd .. "
full-package: cleanbin clean build pack move clean package cleanbin