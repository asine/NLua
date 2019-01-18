#!/bin/sh
cd Core/KeraLua
make -f Makefile.OSX
xbuild KeraLua.Net45.sln /p:Configuration=Release
cd ../../
cp Core/KeraLua/external/lua/osx/lib/liblua52.dylib tests/liblua52.dylib
xbuild NLua.Net45.sln /p:Configuration=Release
cd tests/
export MONO_PATH="/Library/Frameworks/Mono.framework/Libraries/mono/4.5/"
nunit-console NLuaTest.dll -xml=$1
