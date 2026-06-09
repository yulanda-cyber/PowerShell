# PowerShell

Active Directory Account Audit Tool

Project Overview

This project uses Powershell to automate common Active Directory user acoount auditing tasks. The Script checks for inactive, locked, expired, abd disabled user accounts, then exports the results to a CSV report.

The goal is to reduce manual administrative work and provide a simple report that can help with account cleanup, troubleshooting, and security review.

What it does:
1.Finds user accounts inactive for 30 days or more
2.Retrieves locked user accounts
3.Retrieves expired user accounts
4.Retrieves disabled user accounts
5.Exports results to a CSV report
6.Gives a completion message after script runs

How It Works:

The Script imports the Active directory powershell module and runs several account checks. It stores the results in a report object and exports the data to a CSV file named: ADAccountAuditReport.csv

Tools and Technologies:
Powershell
Active Directory Module for Windows Powershell
Windows Server
Visual studio code
GitHub


Future Improvements:
Add a menu for selecting specific audit checks
Add error handling
Create an HTML version of the report
Add comments and help documentation inside script 


# Windows System Information Collector

This project uses Powershell to collect basic system information from a windows computer, including operating system details, disk space, network adapter information, 
IP address, installed printers, and last reboot time. The goal is to automate common information-gathering tasks used in windows administration and troubleshooting.