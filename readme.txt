This readme.txt contains instructions on how to use Dockerfile to achieve solution on below problem.

Instructions :-
1. This Dockerfile will pull centos-6.8 image from official centos docker repo.
2. Will update/install all centos required packages through yum update command include openjdk java.
3. Download latest python-2.7 source package, extract and make install.
4. Mongodb-server installation through yum.
5. Download latest tomcat 7 binary package, extract and copy to /opt/tomcat7 folder.
6. Expose the container port 8080 to enable access from host machine outside.
7. Start the tomcat 7 service.

Once the image build, the using following docker command, we can access tomcat page.
Command to build image
	docker build -t aadirakshe/zycus-assign-1 .

Command to run container
	docker run -p 7080:8080 -d aadirakshe/zycus-assign-1:latest	

Access the tomcate page in your favourite browser
	http://<Docker Host IP>:7080 	 

Author :- Aadinath N. Rakshe
E-mail :- aadirakshe@gmail.com
