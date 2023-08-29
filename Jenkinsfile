pipeline{
    agent any
    environment {     
    DOCKERHUB_CREDENTIALS= credentials('docker-hub-credientials')     
    } 
    stages{
      stage('Build Docker Image') {  
          steps{                     
             sh 'docker build -f Dockerfile -t pythomimage .'     
             echo 'Build Image Completed'
            }
        } 
        stage('Login to Docker Hub') {      	
          steps{                       	
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                		
                echo 'Login Completed'      
            }           
        }
        stage('Push Image to Docker Hub') {         
            steps{                            
              sh 'docker push pythomimage'           
              echo 'Push Image Completed'       
            }            
        }  
                
                      
    }
    post {
        always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
     
        }
    }   
}