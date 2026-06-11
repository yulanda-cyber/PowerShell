 # AZ-900 AI Study Quizzer
 # This script asks AZ-900 practice questions, scores the quiz, and creates an AI study prompt.

 $Date = Get-Date -Format "yyyy-MM-dd"
 $QuestionFile = ".\questions.csv"
 $ReportFolder = ".\Reports"

 if (!(Test-Path $ReportFolder)) {
     New-Item -Path $ReportFolder -ItemType Directory
     }

     if (!(Test-Path $QuestionFile)) {
         Write-Host "questions.csv was not found. Please create the file and try again."
             exit
             }

             $Questions = Import-Csv $QuestionFile | Get-Random -Count 5

             $Results = @()
             $Score = 0

             foreach ($Question in $Questions) {
                 Write-Host ""
                     Write-Host "Question:"
                         Write-Host $Question.Question
                             Write-Host "A. $($Question.OptionA)"
                                 Write-Host "B. $($Question.OptionB)"
                                     Write-Host "C. $($Question.OptionC)"
                                         Write-Host "D. $($Question.OptionD)"

                                             $UserAnswer = Read-Host "Enter your answer A, B, C, or D"
                                                 $UserAnswer = $UserAnswer.ToUpper()

                                                     if ($UserAnswer -eq $Question.CorrectAnswer) {
                                                             Write-Host "Correct!"
                                                                     $IsCorrect = "Yes"
                                                                             $Score++
                                                                                 }
                                                                                     else {
                                                                                             Write-Host "Incorrect. Correct answer: $($Question.CorrectAnswer)"
                                                                                                     $IsCorrect = "No"
                                                                                                         }

                                                                                                             $Results += [PSCustomObject]@{
                                                                                                                     Question      = $Question.Question
                                                                                                                             Topic         = $Question.Topic
                                                                                                                                     YourAnswer    = $UserAnswer
                                                                                                                                             CorrectAnswer = $Question.CorrectAnswer
                                                                                                                                                     Correct       = $IsCorrect
                                                                                                                                                         }
                                                                                                                                                         }

                                                                                                                                                         $ResultsPath = "$ReportFolder\QuizResults-$Date.csv"
                                                                                                                                                         $PromptPath = "$ReportFolder\AIStudyPrompt-$Date.txt"
                                                                                                                                                         $Results | Export-Csv -Path $ResultsPath -NoTypeInformation

                                                                                                                                                         $MissedQuestions = $Results | Where-Object { $_.Correct -eq "No" }

                                                                                                                                                         $AIPrompt = @"
                                                                                                                                                         I am studying for the Microsoft AZ-900 exam.

                                                                                                                                                         Please review the questions I missed and help me understand:
                                                                                                                                                         1. Why the correct answer is correct
                                                                                                                                                         2. Why my answer was wrong
                                                                                                                                                         3. A simple memory tip
                                                                                                                                                         4. How this topic may appear on the AZ-900 exam

                                                                                                                                                         Missed questions:
"@

foreach ($Missed in $MissedQuestions) {
AIPrompt += "`nQuestion: $($Missed.Question)"
AIPrompt += "`nTopic: $($Missed.Topic)"
AIPrompt += "`nMy Answer: $($Missed.YourAnswer)"    
AIPrompt += "`nCorrect Answer: $($Missed.CorrectAnswer)"
AIPrompt += "`n"
}

$AIPrompt | Out-File -FilePath $PromptPath

Write-Host ""
Write-Host "Quiz complete."
Write-Host "Score: $Score out of $($Questions.Count)"
Write-Host "Results saved to: ($ResultsPath)"
Write-Host "AI study prompt saved to:($PromptPath)"