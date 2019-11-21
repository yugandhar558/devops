PROJECT_VERSION=$(mvn -q -Dexec.executable=echo -Dexec.args='${project.version}' --non-recursive exec:exec)
GROUP_ID=$(mvn -q -Dexec.executable=echo -Dexec.args='${project.groupId}' --non-recursive exec:exec)
ARTIFACT_ID=$(mvn -q -Dexec.executable=echo -Dexec.args='${project.artifactId}' --non-recursive exec:exec)
PACKAGING=$(mvn -q -Dexec.executable=echo -Dexec.args='${project.packaging}' --non-recursive exec:exec)
JAR_NAME=$ARTIFACT_ID-$PROJECT_VERSION.$PACKAGING
echo $JAR_NAME
