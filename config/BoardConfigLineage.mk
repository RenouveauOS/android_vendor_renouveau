# Charger
ifeq ($(WITH_LINEAGE_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.lineage
endif

include vendor/renouveau/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/renouveau/config/BoardConfigQcom.mk
endif

include vendor/renouveau/config/BoardConfigSoong.mk
