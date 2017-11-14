NAME="cmake"
VERSION="3.6.3"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.gz"
URL="https://cmake.org/files/v3.6/$FILE"
SHA256SUM="7d73ee4fae572eb2d7cd3feb48971aea903bb30a20ea5ae8b4da826d8ccad5fe"

pkg_configure() {
	LDFLAGS="-O3" ./configure --prefix="$PREFIX/$PACKAGE"
}
