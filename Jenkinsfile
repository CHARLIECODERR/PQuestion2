pipeline{
    agent any
    
    stages{
        stage('If-Else Example'){
            steps{
                script{
                    def number = 10
                    
                    if (number % 2 == 0){
                        echo "The number ${number} is Even"
                    }else {
                        echo "The number ${number} is odd"
                    }
                }
            }
        }
        stage('If-Else Ladder Example'){
            steps{
                script{
                    def marks = 85
                    
                    if(marks >=90){
                        echo "Grade:A+"
                    }else if(marks >=80){
                        echo "Grade:A"
                    }else if(marks >=70){
                        echo "Grade:B"
                    }else if(marks >=60){
                        echo "Grade:C"
                    }else{
                        echo "Grade:fail"
                    }
                }
            }
        }
    }
}
