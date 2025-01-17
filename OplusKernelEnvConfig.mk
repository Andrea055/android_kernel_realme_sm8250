# Copyright (C), 2008-2030, OPLUS Mobile Comm Corp., Ltd
### All rights reserved.
###
### File: - OplusKernelEnvConfig.mk
### Description:
###     you can get the oplus feature variables set in android side in this file
###     this file will add global macro for common oplus added feature
###     BSP team can do customzation by referring the feature variables
### Version: 1.0
### Date: 2020-03-18
### Author: Liang.Sun
###
### ------------------------------- Revision History: ----------------------------
### <author>                        <date>       <version>   <desc>
### ------------------------------------------------------------------------------
##################################################################################

###ifdef OPLUS_ARCH_INJECT
OPLUS_CONNECTIVITY_NATIVE_FEATURE_SET :=

export OPLUS_BUG_STABILITY := false

$(foreach myfeature,$(OPLUS_CONNECTIVITY_NATIVE_FEATURE_SET),\
    $( \
        $(eval KBUILD_CFLAGS += -D$(myfeature)) \
        $(eval KBUILD_CPPFLAGS += -D$(myfeature)) \
        $(eval CFLAGS_KERNEL += -D$(myfeature)) \
        $(eval CFLAGS_MODULE += -D$(myfeature)) \
    ) \
)
###endif OPLUS_ARCH_INJECT
OPLUS_FEATURE_CAMERA_COMMON = yes
ALLOWED_MCROS := \
OPLUS_FEATURE_EMMC_SDCARD_OPTIMIZE \
OPLUS_FEATURE_TP_BSPFWUPDATE \
OPLUS_FEATURE_CHG_BASIC \
OPLUS_FEATURE_WIFI_BDF \
OPLUS_FEATURE_CONNFCSOFT \
OPLUS_FEATURE_SSR \
OPLUS_FEATURE_TP_BASIC \
OPLUS_FEATURE_IPV6_OPTIMIZE \
OPLUS_FEATURE_PXLW_IRIS5 \
OPLUS_FEATURE_AUDIO_FTM \
OPLUS_FEATURE_SPEAKER_MUTE \
OPLUS_FEATURE_MI2S_SLAVE \
OPLUS_FEATURE_KTV \
OPLUS_FEATURE_CAMERA_OIS \
OPLUS_ARCH_INJECT \
OPLUS_ARCH_EXTENDS \
OPLUS_FEATURE_AUDIODETECT \
VENDOR_EDIT \
OPLUS_FEATURE_CAMERA_COMMON \
OPLUS_FEATURE_ADSP_RECOVERY \
OPLUS_FEATURE_SMARTPA_PM \
OPLUS_FEATURE_IMPEDANCE_MATCH \
OPLUS_FEATURE_WIFI_OPLUSWFD \
OPLUS_FEATURE_WIFI_DUALSTA_AP_BLACKLIST \
OPLUS_FEATURE_MIC_VA_MIC_CLK_SWITCH \
OPLUS_FEATURE_ADFR

$(foreach myfeature,$(ALLOWED_MCROS),\
         $(eval KBUILD_CFLAGS += -D$(myfeature)) \
         $(eval KBUILD_CPPFLAGS += -D$(myfeature)) \
         $(eval CFLAGS_KERNEL += -D$(myfeature)) \
         $(eval CFLAGS_MODULE += -D$(myfeature)) \
)

# BSP team can do customzation by referring the feature variables

export OPLUS_FEATURE_WIFI_ROUTERBOOST=y
export OPLUS_FEATURE_ADFR_KERNEL=yes
export OPLUS_FEATURE_PXLW_IRIS5=yes
