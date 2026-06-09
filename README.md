# PowerShell

# Active Directory Account Audit Tool

##Project Overview

This project uses Powershell to automate common Active Directory user acoount auditing tasks. The Script checks for inactive, locked, expired, abd disabled user accounts, then exports the results to a CSV report.

The goal is to reduce manual administrative work and provide a simple report that can help with account cleanup, troubleshooting, and security review.

## What it does:
1.Finds user accounts inactive for 30 days or more
2.Retrieves locked user accounts
3.Retrieves expired user accounts
4.Retrieves disabled user accounts
5.Exports results to a CSV report
6.Gives a completion message after script runs

## How It Works:

The Script imports the Active directory powershell module and runs several account checks. It stores the results in a report object and exports the data to a CSV file named: ADAccountAuditReport.csv

## Tools and Technologies:
Powershell
Active Directory Module for Windows Powershell
Windows Server
Visual studio code
GitHub


## Future Improvements:
Add a menu for selecting specific audit checks
Add error handling
Create an HTML version of the report
Add comments and help documentation inside script 




# Windows System Information Collector

This project uses Powershell to collect basic system information from a windows computer, including operating system details, disk space, network adapter information, 
IP address, installed printers, and last reboot time. The goal is to automate common information-gathering tasks used in windows administration and troubleshooting.








# Windows Security Baseline Checker

## Project Overview

This project uses PowerShell to collect basic Windows security and system configuration information. The script checks the computer name, operating system version, Windows Firewall status, C drive free space, and members of the local Administrators group.

## Purpose

The purpose of this project is to automate a simple security baseline review for a Windows computer. System administrators often need to verify basic configuration settings for troubleshooting, documentation, and compliance review.

## Tools used
- PowerShell
- Windows Server or Windows client
- Visual Studio Code
- GitHub

## Features

- Displays the computer name
- Displays the operating system and version
- Checks Windows Firewall profiles
- Checks free space on the C drive
- Lists local administrator accounts
- Exports results to a CSV report

## Why I Built This

I built this project to practice PowerShell automation for Windows administration tasks. It connects to my interest in system administration, cloud security, and governance/compliance by showing how automation can support basic security reviews and documentation.

## Future Improvements

- Add checks for antivirus status
- Add checks for Windows Update status
- Add an HTML report
- Add pass/fail results for each security check
- Add support for remote computers




# Windows Disk Cleanup Report

## Project Overview

This project uses PowerShell to automate a basic disk cleanup review for a Windows computer. The script checks available disk space, identifies the top 15 largest files in the user profile, and reports files in the Downloads folder that are older than 60 days.

## Purpose
System administrators often need to monitor disk space and identify files that may be using unnecessary storage. This script helps automate the reporting process so an administrator can review disk usage before deleting or moving files.

## Tools Used

- PowerShell
- Windows Server or Windows client
- Visual Studio Code
- GitHub

## Features

 - Checks C: drive size and free space
 - Finds the top 15 largest files
 - Finds Downloads files older than 60 days
 - Displays results on screen
 - Exports reports to CSV files
 - Creates a Reports folder automatically
 
 ## Why I Built This
 
 I built this project to practice PowerShell automation for Windows administration tasks. It connects to system administration and cloud operations because storage monitoring is important for performance, availability, and troubleshooting.
 
 ## Safety Note
 
 This version only creates reports. It does not delete files. This allows an administrator to review the results before taking cleanup action.
 
 ## Future Improvements
 
 - Add an option to delete selected files after confirmation
 - Add an HTML report
 - Add support for scanning remote computers
 - Add warning levels for low disk space the reporting process so an administrator can review disk usage before deleting or moving files.
 
 ## Tools Used
 
 - PowerShell
 - Windows Server or Windows client
 - Visual Studio Code
 - GitHub
 
 ## Features
 
 - Checks Ct files in the user profile, and reports files in the Downloads folder that are older than 60 days.

## Purpose
System administrators often need to monitor disk space and identify files that may be using unnecessary storage. This script helps automate






# AI-Ready Windows System Report Generator

## Project Overview
This project uses PowerShell to collect basic Windows system and security information, then formats the results into a text report that can be reviewed by an AI assistant.

## Purpose

The purpose of this project is to combine Windows administration, PowerShell automation, and AI-assisted analysis. The script gathers system information such as operating system details, disk space, firewall status, and local administrator accounts. It also creates an AI review prompt that can be used to analyze the report for security, compliance, and maintenance concerns.

## Tools Used

- PowerShell
- Windows Server or Windows client
- Visual Studio Code
- GitHub
- AI-assisted review workflow

## Features

- Collects computer name
- Collects operating system and version
- Checks last boot time
- Checks C: drive size and free space
- Checks Windows Firewall profile status
- Lists local administrators
- Creates a system report
- Creates an AI review prompt

## Why I Built This

I built this project to practice PowerShell automation while connecting it to my interest in AI governance and compliance. This project shows how system data can be collected in a structured way and prepared for AI-assisted review, documentation, and decision support.

## Future Improvements

- Export the report as HTML
- Add Windows Update status
- Add antivirus status
- Add pass/fail checks
- Add remote computer support
- Add Azure VM support
- Add a risk rating system






## Important Note

These projects iare for learning and lab use. They should be tested before being used in a production environment.