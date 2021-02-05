#!/bin/bash
read -p 'Enter File Name: ' File
read -p 'Enter User Name: ' UserName
read -p 'Enter IP Address: ' IPAddr
read -p 'Enter Destination Path: ' DestPath
read -p 'Select Action Send/Get : ' Action


if [ "$Action" = "Send" ]
then
scp $File $UserName@$IPAddr:$DestPath
if [ $? -eq 0 ]
then
echo -e "\t\t\t\t##################################"
echo -e "\t\t\t\t##################################"
echo -e "\t\t\t\t#### File Transfer Successful ####"
echo -e "\t\t\t\t##################################"
echo -e "\t\t\t\t##################################"
else
echo -e "\t\t\t\t##################################"
echo -e "\t\t\t\t##################################"
echo -e "\t\t\t\t####!!File Transfer Failed!!##### "
echo -e "\t\t\t\t##################################"
echo -e "\t\t\t\t##################################"
fi
elif [ "$Action" = "Get" ]
then 
if [ -z "$DestPath" ]
then 
DestPath="."
fi
scp $UserName@$IPAddr:$File $DestPath
else
echo -e "\t\t\t\t###################################"
echo -e "\t\t\t\t###################################"
echo -e "\t\t\t\t# Unknown Action Please try Again #"
echo -e "\t\t\t\t###################################"
echo -e "\t\t\t\t###################################"
fi
