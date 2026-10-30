$(call inherit-product, device/xiaomi/violet/lineage_violet.mk)

# FiOS Mobile product identity. Device hardware configuration remains upstream.
PRODUCT_NAME := fios_violet
PRODUCT_DEVICE := violet
PRODUCT_BRAND := Pratham Tech
PRODUCT_MODEL := FiOS Mobile
PRODUCT_MANUFACTURER := Pratham Tech
PRODUCT_BUILD_PROP_OVERRIDES += DeviceName=violet
