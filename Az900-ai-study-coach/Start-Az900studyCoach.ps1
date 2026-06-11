# AZ-900 AI Study Coach
# This script quizzes the user, tracks score history, identifies weak topics
# Creates an AI Study prompt for target review

$Date = Get-Date -Format "yyyy-mm-dd"
$QuestionFile = ".\questions.csv"
$ReportFolder = ".\Reports"

if (!(Test-Path $ReportFolder)) {
    New-Item -Path $ReportFolder -ItemType Directory
}


if (!(Test-Path $QuestionFile)) {
    Write-Host "questions.csv was not found. Please create the file and try again."
    exit
}


$AllQuestions = Import-Csv $QuestionFile

if ($AllQuestions.Count -lt 5) {
    Write-Host "You need at least 5 questions in questions.csv."
    exit
}

$QuizCount = 5
$Questions = $AllQuestions | Get-Random -Count $QuizCount

$Results = @()
$Score = 0

foreach ($Questions in $Questions) {
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
        $SCORE++
    }
    else {
        Write-Host "Incorrect. Correct answer: $($Question.CorrectionAnswer)"
        $IsCorrect = "No"
    }

    $Results += [PSCustomObject]@{
        Date          = $Date
        Question      = $Question.Question
        Topic         = $Question.Topic
        YourAnswer    = $UserAnswer
        CorrectAnswer = $Question.CorrectAnswer
        Correct       = $IsCorrect
    }
}

$QuizResultsPath = "$ReportFolder\QuizResults-$Date.csv"
$ScoreHistoryPath = "$ReportFolder\ScoreHistory.csv"
$PromptPath = "$ReportFolder\AIStudyCoachPrompt-$Date.txt"

$Results | Export-Csv -Path $QuizResultsPath -NoTypeInformation

$ScorePercent = [math]::Round(($Score / $QuizCount) * 100, 2)

$ScoreRecord = [PSCustomObject]@{
    Date         = $Date
    Questions    = $QuizCount
    Score        = $Score
    ScorePercent = $ScorePercent
}

if (Test-Path $ScoreRecord | Export-Csv -Path $ScoreHistoryPath -Append -NoTypeInformation) {
}

else {
    $ScoreRecord | Export-Csv -Path $ScoreHistoryPath -NoTypeInformation
}

$MissedQuestions = $Results | Where-Object { $_.Correct -eq "No" }

$WeakTopics = $MissedQuestions |
Group-Object Topic |
Select-Object Name, COunt |
Sort-Object Count -Descending

Write-Host ""
Write-Host "Quiz Complete."
Write-Host "Score: $Score out of $QuizCount"
Write-Host "Score Percentage: $ScorePercent%"


Write-Host ""
Write-Host "Write Topics:"
$WeakTopics | Format-Table -AutoSize

$AIPrompt = @"
I am studying for the Microsoft AZ-900 exam.

I am completed an AZ-900 practice quiz using a Powershell study coach script.

My score was $Score out of $QuizCount, which is $ScorePercent%.

Please help me study based on the questions I missed.

For each missed question:
1. Explain why the correct answer is correct
2. Explain why my answer was wrong
3. Give me a simple memory tip
4. Tell me how this topic may appear on the AZ-900 exam

Also create a short study plan based on my weakest topics.

Missed questions:
"@

Foreach ($Missed in $MissedQuestions) {
    $AIPrompt += "'nQuestion: $($Missed.Question)"
    $AIPrompt += "'nTopic: $($Missed.Topic)"
    $AIPrompt += "'nMy Answer: $($Missed.YourAnswer)"
    $AIPrompt += "'nCorrect Answer: $($Missed.CorrectAnswer)"
    $AIPrompt += "'n"
}

if ($MissedQuestions.Count -eq 0) {
    $AIPrompt += "'nI did bot miss any questions. Please create a short review plan to help me maintain my knowledge."
}

$AIPrompt | Out-File -FilePath $PromptPath

Write-Host ""
Write-Host "Reports created:"
Write-Host "Quiz results: $QuizResultsPath"
Write-Host "Score history: $ScoreHistoryPath"
Write-Host "AI study coach prompt: $PromptPath"