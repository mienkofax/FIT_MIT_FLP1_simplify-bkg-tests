#!/usr/bin/env bash

# simplify-bkg
# Peter Tisovčík (xtisov00)
# Klára Nečasová (xnecas24)

LOGIN=$1

if [ -z ${LOGIN} ]; then
	echo "Musi byt zadany login"
	exit 1
fi

/bin/rm -rf ${LOGIN}
unzip flp-fun-${LOGIN}.zip -d ${LOGIN}

cp run_tests.sh ${LOGIN}/.
cp -r dir_in ${LOGIN}/.
mkdir ${LOGIN}/dir_out
cp -r dir_ref ${LOGIN}/.

cd ${LOGIN}
make

./run_tests.sh

