############secure copy from one server to onither server##
mv target/*.war target/shipwick.war
scp -i /home/ubuntu/ec2key.pem -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/wipro-myweb/target/myapp-SNAPSHOT-1.0-1.1.4.war ubuntu@34.217.148.218:/opt/tomcat8/webapps/

##To pick latest version fron pom.xml and download#####

a=$(head -n 7 pom.xml | tail -n 1 |awk '{print $1}' | sed -e "s/<version>//" | sed 's/.\{10\}$//')
or
cat pom.xml | grep "<version>" | head -n 1 |awk '{print $1}' |sed -e "s/<version>//" |sed 's/<.*//'
echo $a
rm -rf *.war
wget http://18.236.64.135:8081/repository/maven-releases/in/mpcechno/myapp/$a/myapp-$a.war
mv *.war myapp5.war
*************

or

a=$(cat pom.xml | grep "<version>" | head -n 1 |awk '{print $1}' |sed -e "s/<version>//" |sed 's/.\{10\}$//')
echo $a
rm -rf *.war
wget http://34.219.119.246:8081/repository/Shipwrick/com/boot/shipwreck/$a/shipwreck-$a.war
mv *.war shipwrick.war
scp -i /ec2key.pem -o StrictHostKeyChecking=no shipwrick.war ec2-user@54.244.198.19:/opt/tomcat8/webapps/

#############
##Jenkinsfile#####
    sh "cat pom.xml | grep '<version>' | head -n 1 > a.txt "
    sh "cat a.txt | awk '{print \$1}' > b.txt "
    sh "cat b.txt | sed -e \"s/<version>//\" > c.txt "
    sh "cat c.txt |  sed 's/<.*//' > d.txt"
    sh " echo \$(cat d.txt)"
    f = readFile 'd.txt'
    echo "The current date is ${f}"
***********
echo $JOB_NAME
#echo $BUILD_NUMBER
#echo $BUILD_STATUS
echo $BUILD_URL
#echo $BUILD_NUMBER
echo $BUILD_ID
echo $BUILD_URL
echo $NODE_NAME
echo $JOB_NAME
echo $BUILD_TAG
echo $JENKINS_URL
echo $EXECUTOR_NUMBER
echo $JAVA_HOME
echo $WORKSPACE
echo $GIT_COMMIT
echo $GIT_URL
echo $GIT_BRANCH
echo $GIT_BRANCH
echo BULDURL: $BUILD_URL
echo NODENAME: $NODE_NAME
echo JOBNAME: $JOB_NAME
echo BUILDTAG: $BUILD_TAG
echo JENINSURL: $JENKINS_URL
echo EXUECUTORNUMBER: $EXECUTOR_NUMBER
echo JAVAHOME: $JAVA_HOME
echo WORKSPACE: $WORKSPACE
echo GITCOMMIT: $GIT_COMMIT
echo GITURL: $GIT_URL
echo GITBRANCH: $GIT_BRANCH
echo GITBRANCH: $GIT_BRANCH
echo GIT_PULL_USER: $GIT_PULL
echo GIT_PULL_USER: $GIT_PULL1

################AutomationCode###################
ssh -i /var/lib/jenkins/mavenkey.pem -o StrictHostKeyChecking=no ec2-user@3.84.40.183 rm -rf /opt/apache-tomcat-8.5.45/webapps/*.war
scp -i /var/lib/jenkins/mavenkey.pem -o StrictHostKeyChecking=no target/*.war ec2-user@3.84.40.183:/opt/apache-tomcat-8.5.45/webapps/app.war
ssh -i /var/lib/jenkins/mavenkey.pem -o StrictHostKeyChecking=no ec2-user@3.84.40.183 sh /opt/apache-tomcat-8.5.45/restart.sh
