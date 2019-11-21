cat pom.xml | grep "<version>" | head -n 1 |awk '{print $1}' |sed -e "s/<version>//" |sed 's/.\{10\}$//'
