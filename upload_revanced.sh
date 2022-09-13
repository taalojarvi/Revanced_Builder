#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
# Automation script for sending ReVanced Builds to Telegram Channel
# Copyright (C) Karthik Sreedevan V <taalojarvi@github.com>

export token=$TGKEN
# export token=DEBUGGING
BOT_MSG_URL="https://api.telegram.org/bot$token/sendMessage"
BOT_BUILD_URL="https://api.telegram.org/bot$token/sendDocument"
CHATID=-1001555492735
CHANNEL_URL="https://github.com/taalojarvi/Revanced_Builder/releases"

##---------------------------------------------------------##

tg_post_msg() {
	curl -s -X POST "$BOT_MSG_URL" -d chat_id="$CHATID" \
	-d "disable_web_page_preview=true" \
	-d "parse_mode=html" \
	-d text="$1"

}

##----------------------------------------------------------------##

tg_post_build() {
	#Post MD5Checksum alongwith for easeness
	MD5CHECK=$(md5sum "$1" | cut -d' ' -f1)

	#Show the Checksum alongwith caption
	curl --progress-bar -F document=@"$1" "$BOT_BUILD_URL" \
	-F chat_id="$CHATID"  \
	-F "disable_web_page_preview=true" \
	-F "parse_mode=Markdown" 
	}

##----------------------------------------------------------##

tg_post_msg "<b>YouTube ReVanced was built successfully!</b>%0A<b>Date : </b><code>$(TZ=Etc/UTC date)</code>%0A"
tg_post_msg "<a href='$CHANNEL_URL'>Download on Github Releases</a>"
