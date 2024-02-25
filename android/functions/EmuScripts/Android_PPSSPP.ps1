#!/bin/bash

function Android_PPSSPP_install(){
	setMSG "Installing PPSSPP"
	$temp_url="https://www.ppsspp.org/files/1_16_6/ppsspp.apk"
	$temp_emu="ppsspp"
	Android_ADB_dl_installAPK $temp_emu $temp_url
}

function Android_PPSSPP_init(){
	echo "NYI"
}

function Android_PPSSPP_setup(){
	setMSG "000 #PPSSPP"
	adb shell pm grant org.ppsspp.ppsspp android.permission.WRITE_EXTERNAL_STORAGE
	adb shell am start -n org.ppsspp.ppsspp/.PpssppActivity
	confirmDialog -TitleText "Manual action" -MessageText "Waiting for user..."
	adb shell am force-stop org.ppsspp.ppsspp
}

function Android_PPSSPP_IsInstalled(){
	$package="org.ppsspp.ppsspp"
	$test= adb shell pm list packages $package
	if ($test){
		Write-Output  "true"
	}else{
		Write-Output  "false"
	}
}