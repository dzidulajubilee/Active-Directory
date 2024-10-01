#Remember to Change the Organization Unit in your CSV file Before Running this Script



#import required modules
Import-Module ActiveDirectory


#Prompt User for CSV file path
$filepath = Read-Host "Please Enter the path to your CSV file"

#import the file into a variable
$users = Import-Csv $filepath

ForEach ($user in $users) {

#Gather the User's information

$fname= $user.Firstname
$lname= $user.Lastname
$ounit= $user.'Organizational Unit'
$password= $user.Password
$uname = $user.Username  
$ophone=$user.Phone
$email=$user.Email
$dname=$user.Dname
$securePassword =  ConvertTo-SecureString $user.password -AsPlainText -Force


New-ADuser -Name "$fname $lname" -GivenName $fname -Surname $lname -SamAccountName $uname -DisplayName "$dname" -UserPrincipalName "$fname.$lname" -Path $ounit -AccountPassword $securePassword -ChangePasswordAtLogon $false -OfficePhone $ophone -Description $descript -Enabled $True -EmailAddress $email

echo "Account Created for $fname $lname in $ounit"

}

